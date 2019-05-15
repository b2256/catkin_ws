/* $Id: camera1394_node.cpp 34660 2010-12-11 18:27:24Z joq $ */

/*********************************************************************
* Software License Agreement (BSD License)
*
*  Copyright (c) 2010 Jack O'Quin
*  All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above
*     copyright notice, this list of conditions and the following
*     disclaimer in the documentation and/or other materials provided
*     with the distribution.
*   * Neither the name of the author nor other contributors may be
*     used to endorse or promote products derived from this software
*     without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*  POSSIBILITY OF SUCH DAMAGE.
*********************************************************************/

#include <signal.h>
#include <ros/ros.h>
#include "driver1394stereo.h"
#include <camera1394/SetCameraRegisters.h>
#include <camera1394/GetCameraRegisters.h>
/** @file

    @brief ROS driver node for IIDC-compatible IEEE 1394 digital cameras.

*/

/** Segfault signal handler.
 *
 *  Sadly, libdc1394 sometimes crashes.
 */
void sigsegv_handler(int sig)
{
  signal(SIGSEGV, SIG_DFL);
  fprintf(stderr, "Segmentation fault, stopping camera driver.\n");
  ROS_ERROR("Segmentation fault, stopping camera.");
  ros::shutdown();                      // stop the main loop
}

/*
 * Set LadyBug3-specific registers for image acquisition
 */
bool set_registers()
{
  std::string service_name = "/camera/set_camera_registers";
	bool result;

  const bool rv0 = ros::service::waitForService("/camera/set_camera_registers", 1000);
    if (!rv0)
      return false;

	// Types of requests
  // (per /opt/ros/kinetic/camera1394/SetCameraRegistersRequest.h):
  //  TYPE_CONTROL = 0u,
  //  TYPE_ABSOLUTE = 1u,
  //  TYPE_FORMAT7 = 2u,
  //  TYPE_ADVANCED_CONTROL = 3u,
  //  TYPE_PIO = 4u,
  //  TYPE_SIO = 5u,
  //  TYPE_STROBE = 6u,
	std::vector<uint32_t> val;
  val[0] = 0xDEAD;
  camera1394::SetCameraRegisters srv;
  srv.request.type = camera1394::SetCameraRegistersRequest::TYPE_ABSOLUTE;
	srv.request.offset = 0xBEEF;
	srv.request.value = val;
	srv.request.mode = 0;

  result = ros::service::call("/camera/set_camera_registers", srv);
  return result;
#if 0
  ros::service::MReq srv_req;
  ros::service::MRes srv_resp;
  bool rv = ros::service::call("/camera/set_camera_registers", srv_req, srv_resp);
  rv &= ros::service::call("/camera/set_camera_registers", srv_req, srv_resp);
  rv &= ros::service::call("/camera/set_camera_registers", srv_req, srv_resp);
#endif
}

/** Main node entry point. */
int main(int argc, char **argv)
{
  ros::init(argc, argv, "ladybug3camera_node");
  ros::NodeHandle node;
  ros::NodeHandle priv_nh("~");
  ros::NodeHandle camera_nh("stereo_camera");
  signal(SIGSEGV, &sigsegv_handler);
  ladybug3camera_driver::Ladybug3CameraDriver dvr(priv_nh, camera_nh);

  // GPH Added
  set_registers();


  dvr.setup();
  while (node.ok())
    {
      dvr.poll();
      ros::spinOnce();
    }
  dvr.shutdown();

  return 0;
}
