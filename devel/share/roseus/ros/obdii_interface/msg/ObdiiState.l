;; Auto-generated. Do not edit!


(when (boundp 'obdii_interface::ObdiiState)
  (if (not (find-package "OBDII_INTERFACE"))
    (make-package "OBDII_INTERFACE"))
  (shadow 'ObdiiState (find-package "OBDII_INTERFACE")))
(unless (find-package "OBDII_INTERFACE::OBDIISTATE")
  (make-package "OBDII_INTERFACE::OBDIISTATE"))

(in-package "ROS")
;;//! \htmlinclude ObdiiState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass obdii_interface::ObdiiState
  :super ros::object
  :slots (_header _delay _speed _distance _flags ))

(defmethod obdii_interface::ObdiiState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:delay __delay) 0.0)
    ((:speed __speed) 0.0)
    ((:distance __distance) 0.0)
    ((:flags __flags) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _delay (float __delay))
   (setq _speed (float __speed))
   (setq _distance (float __distance))
   (setq _flags (round __flags))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:delay
   (&optional __delay)
   (if __delay (setq _delay __delay)) _delay)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:flags
   (&optional __flags)
   (if __flags (setq _flags __flags)) _flags)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _delay
    4
    ;; float32 _speed
    4
    ;; float32 _distance
    4
    ;; int32 _flags
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _delay
       (sys::poke _delay (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _flags
       (write-long _flags s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _delay
     (setq _delay (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _flags
     (setq _flags (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get obdii_interface::ObdiiState :md5sum-) "77d5ab65db3911553d2e7228c912a97d")
(setf (get obdii_interface::ObdiiState :datatype-) "obdii_interface/ObdiiState")
(setf (get obdii_interface::ObdiiState :definition-)
      "# This is the obdii message primitive.  Catkin builds out a header file from this.

Header header
float32 delay
float32 speed
float32 distance
int32 flags

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :obdii_interface/ObdiiState "77d5ab65db3911553d2e7228c912a97d")


