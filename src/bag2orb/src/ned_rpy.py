#!/usr/bin/env python
import roslib; roslib.load_manifest("bag2orb");
import numpy as np
import rospy
import tf
import math

 # ROS messages.
from nav_msgs.msg import Odometry
#from sensor_msgs.msg import Imu
from bag2orb.msg import TatBry

class QuatToTaitBryan():
    def __init__(self):
         self.got_new_msg = False
         self.tatbry_msg = TatBry()

         # Create subscribers and publishers.
         #sub_imu   = rospy.Subscriber("imu", Imu, self.imu_callback)
         sub_odom  = rospy.Subscriber("odometry/filtered", Odometry, self.odom_callback)
         pub_tatbry = rospy.Publisher("tat_bry", TatBry, queue_size=1)
         rate = rospy.Rate(16)
         # Main while loop.
         while not rospy.is_shutdown():
             # Publish new data if we got a new message.
             if self.got_new_msg:
                 pub_tatbry.publish(self.tatbry_msg)
                 self.got_new_msg = False
   
     # Odometry callback function.
    def odom_callback(self, msg):
         # Convert quaternions to Euler angles.
         (r, p, y) = tf.transformations.euler_from_quaternion([msg.pose.pose.orientation.x, msg.pose.pose.orientation.y,
                        msg.pose.pose.orientation.z, msg.pose.pose.orientation.w])
         (r, p, y) = [r*180/math.pi, p*180/math.pi, y*180/math.pi]
         #(r, p, y) = [(r*180/math.pi)-2.59743, (p*180/math.pi)-0.565085, (y*180/math.pi)-3.369444]
         # frm field meas- roll 2.59743 or-1.75%, pitch -1.0%(0.572938)+.45deg??, yaw -3.369444
         y = y % 180            #modulo normalizes negative azimuth
         self.fill_tatbry_msg(msg, r, p, y)

     # IMU callback function.
     #def imu_callback(self, msg):
         # Convert quaternions to Euler angles.
         #(r, p, y) = tf.transformations.euler_from_quaternion([msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w])
         #self.fill_euler_msg(msg, r, p, y)
         
    """def normalize_angle(y):
        #y = y % (2 * np.pi)    # force in range [0, 2 pi)
        y = y % 360
        #if y > np.pi:          # move to [-pi, pi)
            #y -= 2 * np.pi
        return y """
    
     # Fill in Euler (TaitBryan)angle message.
    def fill_tatbry_msg(self, msg, r, p, y):
         self.got_new_msg = True
         self.tatbry_msg.header.stamp = msg.header.stamp
         self.tatbry_msg.roll  = r
         self.tatbry_msg.pitch = p
         self.tatbry_msg.yaw   = y

 # Main function.
if __name__ == '__main__':
     # Initialize the node and name it.
     rospy.init_node('afl_tatbry_node')
     # Go to class functions that do all the heavy lifting. Do error checking.
     try:
         afl_tatbry_node = QuatToTaitBryan()
     except rospy.ROSInterruptException: pass


