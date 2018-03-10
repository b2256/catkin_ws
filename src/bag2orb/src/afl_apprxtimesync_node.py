#!/usr/bin/env python



import roslib; roslib.load_manifest('bag2orb')
import rospy
import message_filters


#ROS messages

from sensor_msgs.msg import NavSatFix
from bag2orb.msg import TatBry
from bag2orb.msg import Sync_orb

"""method to sync two topics

    Subscriptions:
        * gps/filtered: gps topic from robot_localization filter
        * Tat_bry: custom message  from q2_rpy.py quaternion conversion to Tate-Byan rpy (NED)


"""

class AflSync():
    def __init__(self):
        self.got_new_msg = False
        self.tat_bry_msg = TatBry()
        self.sync_msg = Sync_orb()

    # Create subscribers and publishers
    # subscriber to message_filters module and assigning to local class variable
        self.sub_gps = message_filters.Subscriber("gps/filtered", NavSatFix)
        self.sub_rpy = message_filters.Subscriber("tat_bry", TatBry)
        
        
        
    # Synchronize topics
        self.ts = message_filters.ApproximateTimeSynchronizer([self.sub_gps, self.sub_rpy], 8, 0.0625)
        self.ts.registerCallback(self.cb_aflsync)



    def cb_aflsync(self, tat_bry_msg, sync_msg):
      	self.sub_gps = message_filters.Subscriber("gps/filtered", NavSatFix)
        self.sub_rpy = message_filters.Subscriber("tat_bry", TatBry)
        self.subs = [self.sub_gps,  self.sub_rpy]
        tat_bry_msg = self.tat_bry_msg 
        sync_msg = self.sync_msg
        r = rospy.Rate(16) # 16hz
        rospy.loginfo('syncing topics now')
        
        
        # Main while loop.
        while not rospy.is_shutdown():
            
            r.sleep()
            
    """         
    def sync_pub():
        # Publish output
        self.gps_pub = rospy.Publisher("/gps/filtered", NavSatFix, queue_size=1)
        self.rpy_pub = rospy.Publisher("/tat_bry", TatBry, queue_size=1)
        rate = rospy.Rate(16) # 16hz
        tat = TatBry()
        nsat = NavSatFix()
        while not rospy.is_shutdown():
            #self.gps_pub.publish(nsat)
            #self.rpy_pub.publish(tat)
            rospy.loginfo("sync callback working!")
            rate.sleep()  """

if __name__ == '__main__':
    # Initialize the node and name it.
    rospy.init_node('aflsync_node')
    # Go to class functions that do all the heavy lifting. Do error checking.
    try:
        aflsync_node = AflSync()
        rospy.spin()
        rospy.loginfo("sync node has shutdown.")
    except rospy.ROSInterruptException: pass
s
