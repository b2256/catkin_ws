//

#include "stdafx.h"

#include <iostream>
#include <string>
#include <sstream>
#include <stdexcept>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

// ROS stuff
#include <ros/ros.h>
#include <ros/time.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CameraInfo.h>

// ROS messaging and image processing stuff
#include <tf/transform_broadcaster.h>
#include <tf/transform_datatypes.h>
#include <image_transport/image_transport.h>
#include "opencv2/core/core.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <cv_bridge/cv_bridge.h>

// Camera-specific stuff
#include <camera_info_manager/camera_info_manager.h>
#include "Ladybug3CameraConfig.h"
#include "ladybug.h"

#include "Configuration.h"
#include "ConfigurationLoader.h"
#include "ImageGrabber.h"
#include "ImageRecorder.h"

#ifdef _WIN32
#include <conio.h>
#else
#include <termios.h>
#include <sys/ioctl.h>
#include <unistd.h>
#endif

#include <iostream>

#include "ladybug3_limits.h"

using namespace std;

//ros::NodeHandle nh_;
static volatile int running_ = 1;
image_transport::ImageTransport *it_;
image_transport::Publisher image_pub_;

static int monitor_lens_ = 0;
static int current_pan_lens_ = 0;
static double monitor_fixate_duration_ = 0;
static double monitor_pan_duration_ = 0;
static ros::Time last_lens_update_;
static ros::Time next_lens_update_;

// InitPublishMonitor
// Init publication of the camera-is-running monitor image
void InitPublishMonitor(ros::NodeHandle nh)
{
//	cinfo_ = boost::shared_ptr<camera_info_manager::CameraInfoManager>(new camera_info_manager::CameraInfoManager(nh));
	it_ = new image_transport::ImageTransport(nh);
	image_pub_ = it_->advertise("/ladybug3_monitor/image_raw", 8);
}

// DeInintPublishMonitor
void DeInitPublishMonitor()
{
	if (it_) {
		delete it_;
		it_ = NULL;
  }
}

// getImageIndex
// Find image nth index (according to JPG headers) past the index passed in in a stream of JPEG d in a string of data.
// Looks for jpeg header data and, if found, looks around it to confirm it.
char *getImageIndex(int seek_image_index, int max_size, char *data)
{
  unsigned char *image_location = (unsigned char *) data;
  unsigned char *image_candidate_location;
  unsigned char *end = data + max_size;
  int current_image_index = 0;

  if (!seek_image_index) {
    return image_location;
  }

  // Table contains candidate index deltas to beginning of string
  static char delta_lookup[256] =
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x00-0x0f
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x10
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x20
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x30
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x40
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x50
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x60
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x70
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x80
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0x90
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0xa0
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0xb0
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0xc0
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,       // 0xd0
    3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       // 0xe0
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,       // 0xf0-0xff
  };

  // Don't start on the first JPEG header; advance index
  //image_location += 4;

  // Since JPEG doesn't have compressed image size (see https://www.file-recovery.com/jpg-signature-format.htm)
  // we are faced with the arduous task of searching for the next JPEG header
  while(image_location < end) {
    image_location += 4;
    int delta_candidate_index;
    // Yes, assignment below of delta_candidate_index is deliberate
    if (delta_candidate_index = delta_lookup[*image_location]) {
      image_candidate_location = image_location - delta_candidate_index;
      if ((unsigned char)0xff == image_candidate_location[0]) {
        if ((unsigned char)0xd8 == image_candidate_location[1]) {
          if ((unsigned char)0xff == image_candidate_location[2]) {
            if ((unsigned char)0xe0 == image_candidate_location[3]) {
              current_image_index++;
	            //cout << "Index incremented" << endl;
              if (current_image_index == seek_image_index) {
                image_location = image_candidate_location;
                break;
              }
            }
          }
        }
      }
    }
    image_candidate_location = image_location;
    if ((unsigned char)0xff == image_candidate_location[0]) {
      if ((unsigned char)0xd8 == image_candidate_location[1]) {
        if ((unsigned char)0xff == image_candidate_location[2]) {
          if ((unsigned char)0xe0 == image_candidate_location[3]) {
            current_image_index++;
	          //cout << "Index incremented" << endl;
            if (current_image_index == seek_image_index) {
              image_location = image_candidate_location;
              break;
            }
          }
        }
      }
    }
  }

  return image_location;
}

// PublishMonitorImage
// Peridocially publish one color channel from a single camera lens for
// camera operation monitoring purposes.
// Entry: LadybugImage
void PublishMonitorImage(ros::NodeHandle nh, LadybugImage& currentImage, int lens_index)
{
	// Publish image from the first camera.  Note that the offset of this
	// image is known.  It is possible to publish images from other cameras, but
	// their starting locations are unknown as each JPEG image of a given size
	// will fluctuate owing to the compression.
#define LADYBUG3_IMOFFS 1024
	char *buffer, *bufferR, *bufferG, *bufferB;
  bufferR = getImageIndex((lens_index * 4), 
    currentImage.uiDataSizeBytes - LADYBUG3_IMOFFS, 
    (char *)&currentImage.pData[LADYBUG3_IMOFFS]
  );
  bufferG = getImageIndex(1, 
    currentImage.uiDataSizeBytes - LADYBUG3_IMOFFS, 
    bufferR
  );
  bufferB = getImageIndex(1,
    currentImage.uiDataSizeBytes - LADYBUG3_IMOFFS, 
    bufferG
  );

  //buffer = (char *)&currentImage.pData[LADYBUG3_IMOFFS];
	// cv::imdecode will detect JPEG format from the header bytes (0xff 0xf8 0xff 0xe0)
	// It will be decompressed into a 1-dimensional matrix (matImg) with its
	// own buffer, which we then publish.
	//cv::Mat matImg = cv::imdecode(cv::Mat(1, currentImage.uiDataSizeBytes, CV_8UC1, buffer), cv::IMREAD_UNCHANGED);
	cv::Mat r = cv::imdecode(cv::Mat(1, currentImage.uiDataSizeBytes, CV_8UC1, bufferR), cv::IMREAD_UNCHANGED);
	cv::Mat g = cv::imdecode(cv::Mat(1, currentImage.uiDataSizeBytes, CV_8UC1, bufferG), cv::IMREAD_UNCHANGED);
	cv::Mat b = cv::imdecode(cv::Mat(1, currentImage.uiDataSizeBytes, CV_8UC1, bufferB), cv::IMREAD_UNCHANGED);

  std::vector<cv::Mat> array_to_merge;
  array_to_merge.push_back(b);
  array_to_merge.push_back(g);
  array_to_merge.push_back(r);
  cv::Mat color;
  cv::merge(array_to_merge, color);

  transpose(color, color);

  #if 0
  // Comment in if the image must be rotated in the frame by 90 degrees.
  double angle = -90;
  cv::Point2f center((matImg.cols-1)/2.0, (matImage.rows-1)/2.0);
  cv::Mat rot = cv::getRotationMatrix2D(center, angle, 1.0);
  cv::Rect2f bbox = cv::RotatedRect(cv::Point2f(), matImg.size(), angle)
  #endif

  //transpose(matImg, matImg);

	sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", color).toImageMsg();		// image for publication
	//sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "mono8", matImg).toImageMsg();		// image for publication
	msg->header.stamp = ros::Time::now();
	image_pub_.publish(msg);
}

// UpdateLens
// Update the lens that I use
// Entry: -
// Exit: -
void UpdateLens()
{
  double duration;
  if (current_pan_lens_ == monitor_lens_) {
    duration = monitor_fixate_duration_;
  } else {
    duration = monitor_pan_duration_;
  }

  cout << duration << " " << next_lens_update_.toSec() << " " << last_lens_update_.toSec() << endl;
  if (last_lens_update_.toSec() > next_lens_update_.toSec()) {
    last_lens_update_ = next_lens_update_;
    next_lens_update_ += ros::Duration(duration);
    current_pan_lens_++;
    current_pan_lens_ %= 6;      // TODO: Hardcoded lens max; look up in Ladybug SDK!!! 
    cout << "2" << endl;
  } else {
    last_lens_update_ = ros::Time::now();
  }
}

// GrabLoop
// This sits in a  ROS-ified loop and grabs images from the camera
// as fast as it can send them.
void GrabLoop( ros::NodeHandle nh, ImageGrabber &grabber, ImageRecorder &recorder )
{
	LadybugImage currentImage;

	ros::Rate loop_rate(1);
	while (running_ && ros::ok())
	{
		const LadybugError acquisitionError = grabber.Acquire(currentImage);
		if (acquisitionError != LADYBUG_OK)
		{
			// Error
			ROS_ERROR_STREAM ("Failed to acquire image. Error (" << ladybugErrorToString(acquisitionError) << ")");
			continue;
		}
//#define GRAB_FILE_DATA
#ifdef GRAB_FILE_DATA
  {
    static int fidx = 0;
    FILE *pf;
    char *fpath = "/home/afl04/catkin_ws/notes/cameraraw";
    char buf[256];
    sprintf(buf, "%s%d", fpath, fidx);
    fidx++;
    pf = fopen( buf, "w");
    if (pf) {
      fwrite( currentImage.pData, 1, currentImage.uiDataSizeBytes, pf);
      fclose(pf);
    }
  }
#endif

		//cout << "Image acquired - " << currentImage.timeStamp.ulCycleSeconds << ":" << currentImage.timeStamp.ulCycleCount << endl;

		static int monitor_count = 0;
		// Only publish every few frames -- a couple times a second should suffice.
		//if(!(++monitor_count & 0x07))	// TODO: parameterize this
			PublishMonitorImage(nh, currentImage, current_pan_lens_);

		double mbWritten = 0.0;
		unsigned long imagesWritten = 0;
		const LadybugError writeError = recorder.Write(currentImage, mbWritten, imagesWritten);
		if (writeError != LADYBUG_OK)
		{
			// Error
			cerr << "Failed to write image to stream (" << ladybugErrorToString(writeError) << ")" << endl;
			continue;
		}

		// cout << imagesWritten << " images - " << mbWritten << "MB" << endl;

		grabber.Unlock(currentImage.uiBufferIndex);

    // Swap lens
    UpdateLens();

		ros::spinOnce();
	}
}

static void signalHandler(int)
{
	running_ = 0;
	ros::shutdown();
}
// setCameraParams
// Get the GAIN and other parameters into the config.
// Note, owing to a(n apparent) limitation in ROS launch files,
// there is no way to CONDITIONALLY map a parameter based on
// its presence or absence.  Therefore, as a fallback we will
// use the value of 0 to mean "Use the camera default".
// Entry: ConfigurationProperties
// Exit: true == success
bool setCameraParams(ConfigurationProperties& config)
{
  double param;
  bool success = true;
  if (ros::param::has("~gain") && ros::param::get("~gain", param)) {
    if (param) {
      if (param >= kGainMin && param < kGainMax) {
        config.camera.gain = param;
        config.camera.use_gain = true;
        ROS_INFO("Set gain to %f", param);
      } else {
        ROS_WARN("Gain limits: %f - %f", (double)kGainMin, (double)kGainMax);
        success = false;
      }
    }
  }
  if (ros::param::has("~brightness") && ros::param::get("~brightness", param)) {
    if (param) {
      if (param >= kBrightnessMin && param < kBrightnessMax) {
        config.camera.brightness = param;
        config.camera.use_brightness = true;
        ROS_INFO("Set brightness to %f", param);
      } else {
        ROS_WARN("brightness limits: %f - %f", (double)kBrightnessMin, (double)kBrightnessMax);
        success = false;
      }
    }
  }
  if (ros::param::has("~autoexposure") && ros::param::get("~autoexposure", param)) {
    if (param) {
      if (param >= kAutoExposureMin && param < kAutoExposureMax) {
        config.camera.autoexposure = param;
        config.camera.use_autoexposure = true;
        ROS_INFO("Set autoexposure to %f", param);
      } else {
        ROS_WARN("autoexposure limits: %f - %f", (double)kAutoExposureMin, (double)kAutoExposureMax);
        success = false;
      }
    }
  }
  if (ros::param::has("~whitebalance") && ros::param::get("~whitebalance", param)) {
    if (param) {
      if (param >= kWhiteBalanceMin && param < kWhiteBalanceMax) {
        config.camera.whitebalance = param;
        config.camera.use_whitebalance = true;
        ROS_INFO("Set whitebalance to %f", param);
      } else {
        ROS_WARN("whitebalance limits: %d - %d", (int)kWhiteBalanceMin, (int)kWhiteBalanceMax);
        success = false;
      }
    }
  }
  if (ros::param::get("~gamma", param)) {
    if (param) {
      if (param >= kGammaMin && param < kGammaMax) {
        config.camera.gamma = param;
        config.camera.use_gamma = true;
        ROS_INFO("Set gamma to %f", param);
      } else {
        ROS_WARN("gamma limits: %f - %f", (double)kGammaMin, (double)kGammaMax);
        success = false;
      }
    }
  }
  if (ros::param::has("~shutter") && ros::param::get("~shutter", param)) {
    if (param) {
      if (param >= kShutterMin && param < kShutterMax) {
        config.camera.shutter = param;
        config.camera.use_shutter = true;
        ROS_INFO("Set shutter to %f seconds", param);
      } else {
        ROS_WARN("shutter limits: %f - %f seconds", (double)kShutterMin, (double)kShutterMax);
        success = false;
      }
    }
  }

  int iparam;
  if (ros::param::has("~monitor_lens") && ros::param::get("~monitor_lens", iparam)) {
    if (iparam) {
      if (iparam >= 0 && iparam < 6) {    // TODO: Make constants (lens min and max)
        monitor_lens_ = current_pan_lens_ = iparam;
        ROS_INFO("Set monitor lens to %d", iparam);
      } else {
        ROS_WARN("Monitor lens must be between 0 and 5.");
        success = false;
      }
    }
  }

  if (ros::param::has("~monitor_fixate") && ros::param::get("~monitor_fixate", param)) {
    if (param) {
        monitor_fixate_duration_ = param;
        ROS_INFO("Set monitor fixate to %f seconds", param);
    }
  }

  if (ros::param::has("~monitor_pan") && ros::param::get("~monitor_pan", param)) {
    if (param) {
        monitor_pan_duration_ = param;
        ROS_INFO("Set monitor pan to %f seconds", param);
    }
  }

  last_lens_update_ = ros::Time::now();
  next_lens_update_ = ros::Time::now() + ros::Duration(monitor_fixate_duration_); // = ros::Time::now();

  // END GPH
  return success;
}

int main (int argc, char **argv)
{
	////ROS STUFF
	ros::init(argc, argv, "pgrrecorder");
	//nhros::NodeHandle = ros::getNodeHandle(); //node(getNodeHandle());
	//nh_ = ros::NodeHandle(node, "pgrrecorder");
	ros::NodeHandle nh;
  ros::NodeHandle private_nh("~");
	signal(SIGTERM, signalHandler);//detect closing

	// Initialize the monitor-image publisher
	InitPublishMonitor(nh);

	// Load configuration from XML
	ConfigurationProperties config;
	string pathToConfigFile;
	try
	{
#ifdef _WIN32
		pathToConfigFile = "LadybugRecorderConsole.xml";
#else
		pathToConfigFile = "/etc/ladybug/LadybugRecorderConsole.xml";
#endif
		cout << "Loading configuration from " << pathToConfigFile << endl;
		config  = ConfigurationLoader::Parse(pathToConfigFile);
	}
	catch (const std::runtime_error& e)
	{
		cerr << "Error: " << e.what() << endl;
		return -1;
	}

	cout << config.ToString() << endl;

	// Initialize grabber
	ImageGrabber grabber;
	const LadybugError grabberInitError = grabber.Init();
	if (grabberInitError != LADYBUG_OK)
	{
		cerr << "Error: " << "Failed to initialize camera (" << ladybugErrorToString(grabberInitError) << ")" << endl;
		return -1;
	}

  if (!setCameraParams(config))
  {
    cerr << "Error: Setting camera params -- check syntax" << endl;
    return -1;
  }

	grabber.SetConfiguration(config.camera, config.gps);

	// Get the camera information
	LadybugCameraInfo camInfo;
	grabber.GetCameraInfo(camInfo);

	// Initialize recorder
	ImageRecorder recorder(config.stream);
	const LadybugError recorderInitError = recorder.Init(grabber.GetCameraContext(), camInfo.serialBase);
	if (recorderInitError != LADYBUG_OK)
	{
		std::string additionalInformation = "";

		if (recorderInitError == LADYBUG_COULD_NOT_OPEN_FILE)
		{
			additionalInformation = " This may be caused by permission issues with the destination directory. Try setting the desination directory to a location that does not require admin privilege.";
		}

		cerr << "Error: " << "Failed to initialize stream (" << ladybugErrorToString(recorderInitError) << ")." << additionalInformation << endl;
		return -1;
	}

	const LadybugError startError = grabber.Start();
	if (startError != LADYBUG_OK)
	{
		cerr << "Error: " << "Failed to start camera (" << ladybugErrorToString(startError) << ")" << endl;
		return -1;
	}

	cout << "Successfully started camera and stream" << endl;

	GrabLoop(nh, grabber, recorder);

	cout << "Stopping..." << endl;

	// Shutdown
	grabber.Stop();
	recorder.Stop();

	ROS_INFO_STREAM("Camera grabbing stopped...");

	return 0;
}
