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

using namespace std;

//ros::NodeHandle nh_;
static volatile int running_ = 1;
image_transport::ImageTransport *it_;
image_transport::Publisher image_pub_;

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

// PublishMonitorImage
// Peridocially publish one color channel from a single camera lens for
// camera operation monitoring purposes.
// Entry: LadybugImage
void PublishMonitorImage(ros::NodeHandle nh, LadybugImage& currentImage)
{
	// Publish image from the first camera.  Note that the offset of this
	// image is known.  It is possible to publish images from other cameras, but
	// their starting locations are unknown as each JPEG image of a given size
	// will fluctuate owing to the compression.
#define LADYBUG3_IMOFFS 1024
	char *buffer = (char *)&currentImage.pData[LADYBUG3_IMOFFS];
	// cv::imdecode will detect JPEG format from the header bytes (0xff 0xf8 0xff 0xe0)
	// It will be decompressed into a 1-dimensional matrix (matImg) with its
	// own buffer, which we then publish.
	cv::Mat matImg = cv::imdecode(cv::Mat(1, currentImage.uiDataSizeBytes, CV_8UC1, buffer), cv::IMREAD_UNCHANGED);

	sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "mono8", matImg).toImageMsg();		// image for publication
	msg->header.stamp = ros::Time::now();
	image_pub_.publish(msg);
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

		cout << "Image acquired - " << currentImage.timeStamp.ulCycleSeconds << ":" << currentImage.timeStamp.ulCycleCount << endl;

		static int monitor_count = 0;
		// Only publish every few frames -- a couple times a second should suffice.
		if(!(++monitor_count & 0x07))	// TODO: parameterize this
			PublishMonitorImage(nh, currentImage);

		double mbWritten = 0.0;
		unsigned long imagesWritten = 0;
		const LadybugError writeError = recorder.Write(currentImage, mbWritten, imagesWritten);
		if (writeError != LADYBUG_OK)
		{
			// Error
			cerr << "Failed to write image to stream (" << ladybugErrorToString(writeError) << ")" << endl;
			continue;
		}

		cout << imagesWritten << " images - " << mbWritten << "MB" << endl;

		grabber.Unlock(currentImage.uiBufferIndex);
		ros::spinOnce();
	}
}

static void signalHandler(int)
{
	running_ = 0;
	ros::shutdown();
}

int main (int argc, char **argv)
{
	////ROS STUFF
	ros::init(argc, argv, "pgrrecorder");
	//nhros::NodeHandle = ros::getNodeHandle(); //node(getNodeHandle());
	//nh_ = ros::NodeHandle(node, "pgrrecorder");
	ros::NodeHandle nh;

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
