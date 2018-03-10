; Auto-generated. Do not edit!


(cl:in-package obdii_interface-msg)


;//! \htmlinclude ObdiiState.msg.html

(cl:defclass <ObdiiState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (delay
    :reader delay
    :initarg :delay
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (flags
    :reader flags
    :initarg :flags
    :type cl:integer
    :initform 0))
)

(cl:defclass ObdiiState (<ObdiiState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObdiiState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObdiiState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obdii_interface-msg:<ObdiiState> is deprecated: use obdii_interface-msg:ObdiiState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ObdiiState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obdii_interface-msg:header-val is deprecated.  Use obdii_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'delay-val :lambda-list '(m))
(cl:defmethod delay-val ((m <ObdiiState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obdii_interface-msg:delay-val is deprecated.  Use obdii_interface-msg:delay instead.")
  (delay m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ObdiiState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obdii_interface-msg:speed-val is deprecated.  Use obdii_interface-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ObdiiState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obdii_interface-msg:distance-val is deprecated.  Use obdii_interface-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'flags-val :lambda-list '(m))
(cl:defmethod flags-val ((m <ObdiiState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obdii_interface-msg:flags-val is deprecated.  Use obdii_interface-msg:flags instead.")
  (flags m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObdiiState>) ostream)
  "Serializes a message object of type '<ObdiiState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'delay))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'flags)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObdiiState>) istream)
  "Deserializes a message object of type '<ObdiiState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delay) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flags) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObdiiState>)))
  "Returns string type for a message object of type '<ObdiiState>"
  "obdii_interface/ObdiiState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObdiiState)))
  "Returns string type for a message object of type 'ObdiiState"
  "obdii_interface/ObdiiState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObdiiState>)))
  "Returns md5sum for a message object of type '<ObdiiState>"
  "77d5ab65db3911553d2e7228c912a97d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObdiiState)))
  "Returns md5sum for a message object of type 'ObdiiState"
  "77d5ab65db3911553d2e7228c912a97d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObdiiState>)))
  "Returns full string definition for message of type '<ObdiiState>"
  (cl:format cl:nil "# This is the obdii message primitive.  Catkin builds out a header file from this.~%~%Header header~%float32 delay~%float32 speed~%float32 distance~%int32 flags~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObdiiState)))
  "Returns full string definition for message of type 'ObdiiState"
  (cl:format cl:nil "# This is the obdii message primitive.  Catkin builds out a header file from this.~%~%Header header~%float32 delay~%float32 speed~%float32 distance~%int32 flags~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObdiiState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObdiiState>))
  "Converts a ROS message object to a list"
  (cl:list 'ObdiiState
    (cl:cons ':header (header msg))
    (cl:cons ':delay (delay msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':flags (flags msg))
))
