#!/usr/bin/env python


import sys
import roslib; roslib.load_manifest('bag2orb')
import rospy
import message_filters

from message_filters import TimeSynchronizer, Subscriber
from sensor_msgs.msg import NavSatFix
from bag2orb.msg import TatBry



"""
Synchronizes output from robot_localization
for gps and modified odometry topics (into rpy)
using ApproximateTimeSynchronizer

"""
class Synco():

    #defining callback
    def cb_synco(self,gps_msg, rpy_msg):
            sub_gps = Subscriber("gps/filtered", NavSatFix)
            sub_rpy = Subscriber("tat_bry", TatBry)
            r = rospy.Rate(4) # 4hz
            rospy.loginfo("syncing topics")

        # Main while loop.
            while not rospy.is_shutdown():
                r.sleep()

    def __init__(self):
        #self.aflsync_node = AflSync()
        sub_gps = Subscriber("gps/filtered", NavSatFix)
        sub_rpy = Subscriber("tat_bry", TatBry)


        ts = message_filters.ApproximateTimeSynchronizer([sub_gps, sub_rpy], 30, 0.24 )
        ts.registerCallback(self.cb_synco)



    """if NavSatFix.msg.header.stamp != TatBry.msg.header.stamp
                rospy.loginfo("We have a sync issue")
            #rospy.loginfo("gps: "+str(sub_gps.Header.stamp)+"tatbry: "+str(sub_rpy.Header.stamp))
            else:
                rospy.loginfo(sub_gps.Header.seq)"""


def main(args):
	sync = Synco()
	rospy.init_node('Synco', anonymous=True)
	try:
         aflsync_node = Synco()
         rospy.spin()
         rospy.loginfo("sync node has shutdown.")

	except KeyboardInterrupt:
		print "Shutting down"


if __name__ == '__main__':
    main(sys.argv)
