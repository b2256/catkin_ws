#!/usr/bin/env python
import roslib; roslib.load_manifest("bag2orb");
import rospy
import tf
import math

 # ROS messages.
#from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
from bag2orb.msg import TatBry


class QuatToTaitBryan():
    def __init__(self):
         self.got_new_msg = False
         self.tatbry_msg = TatBry()

         # Create subscribers and publishers.
         sub_imu   = rospy.Subscriber("imu/data", Imu, self.imu_callback)
         #sub_odom  = rospy.Subscriber("odometry/filtered", Odometry, self.odom_callback)
         pub_tatbry = rospy.Publisher("tat_bry", TatBry, queue_size=12)
         rate = rospy.Rate(20)
         # Main while loop.
         while not rospy.is_shutdown():
             # Publish new data if we got a new message.
             if self.got_new_msg:
                 pub_tatbry.publish(self.tatbry_msg)
                 self.got_new_msg = False
                 rate.sleep()
     # Odometry callback function.
    #def odom_callback(self, msg):
         # Convert quaternions to Euler angles.
         #(r, p, y) = tf.transformations.euler_from_quaternion([msg.pose.pose.orientation.x, msg.pose.pose.orientation.y,
         #               msg.pose.pose.orientation.z, msg.pose.pose.orientation.w])
         #(r, p, y) = [r*180/math.pi, p*180/math.pi, y*180/math.pi+ (+11.8599971761)]
         #self.fill_tatbry_msg(msg, r, p, y)

     # IMU callback function.
    def imu_callback(self, msg):
         # Convert quaternions to Euler angles.
         (r, p, y) = tf.transformations.euler_from_quaternion([msg.orientation.x, msg.orientation.y, 
            msg.orientation.z, msg.orientation.w])
         (r, p, y) = [r*180/math.pi, p*180/math.pi, y*180/math.pi]
         self.fill_tatbry_msg(msg, r, p, y)

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


