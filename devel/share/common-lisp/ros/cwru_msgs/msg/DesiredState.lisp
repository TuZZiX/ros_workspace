; Auto-generated. Do not edit!


(cl:in-package cwru_msgs-msg)


;//! \htmlinclude DesiredState.msg.html

(cl:defclass <DesiredState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (seg_type
    :reader seg_type
    :initarg :seg_type
    :type cl:fixnum
    :initform 0)
   (seg_number
    :reader seg_number
    :initarg :seg_number
    :type cl:integer
    :initform 0)
   (des_pose
    :reader des_pose
    :initarg :des_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (des_speed
    :reader des_speed
    :initarg :des_speed
    :type cl:float
    :initform 0.0)
   (des_rho
    :reader des_rho
    :initarg :des_rho
    :type cl:float
    :initform 0.0)
   (des_lseg
    :reader des_lseg
    :initarg :des_lseg
    :type cl:float
    :initform 0.0))
)

(cl:defclass DesiredState (<DesiredState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DesiredState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DesiredState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_msgs-msg:<DesiredState> is deprecated: use cwru_msgs-msg:DesiredState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DesiredState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:header-val is deprecated.  Use cwru_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'seg_type-val :lambda-list '(m))
(cl:defmethod seg_type-val ((m <DesiredState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:seg_type-val is deprecated.  Use cwru_msgs-msg:seg_type instead.")
  (seg_type m))

(cl:ensure-generic-function 'seg_number-val :lambda-list '(m))
(cl:defmethod seg_number-val ((m <DesiredState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:seg_number-val is deprecated.  Use cwru_msgs-msg:seg_number instead.")
  (seg_number m))

(cl:ensure-generic-function 'des_pose-val :lambda-list '(m))
(cl:defmethod des_pose-val ((m <DesiredState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:des_pose-val is deprecated.  Use cwru_msgs-msg:des_pose instead.")
  (des_pose m))

(cl:ensure-generic-function 'des_speed-val :lambda-list '(m))
(cl:defmethod des_speed-val ((m <DesiredState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:des_speed-val is deprecated.  Use cwru_msgs-msg:des_speed instead.")
  (des_speed m))

(cl:ensure-generic-function 'des_rho-val :lambda-list '(m))
(cl:defmethod des_rho-val ((m <DesiredState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:des_rho-val is deprecated.  Use cwru_msgs-msg:des_rho instead.")
  (des_rho m))

(cl:ensure-generic-function 'des_lseg-val :lambda-list '(m))
(cl:defmethod des_lseg-val ((m <DesiredState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:des_lseg-val is deprecated.  Use cwru_msgs-msg:des_lseg instead.")
  (des_lseg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DesiredState>) ostream)
  "Serializes a message object of type '<DesiredState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'seg_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seg_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seg_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seg_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seg_number)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'des_pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'des_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'des_rho))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'des_lseg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DesiredState>) istream)
  "Deserializes a message object of type '<DesiredState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'seg_type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seg_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seg_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seg_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seg_number)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'des_pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'des_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'des_rho) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'des_lseg) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DesiredState>)))
  "Returns string type for a message object of type '<DesiredState>"
  "cwru_msgs/DesiredState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesiredState)))
  "Returns string type for a message object of type 'DesiredState"
  "cwru_msgs/DesiredState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DesiredState>)))
  "Returns md5sum for a message object of type '<DesiredState>"
  "8a022665b62e846aae599403b4b5aab1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DesiredState)))
  "Returns md5sum for a message object of type 'DesiredState"
  "8a022665b62e846aae599403b4b5aab1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DesiredState>)))
  "Returns full string definition for message of type '<DesiredState>"
  (cl:format cl:nil "#Standard ROS header for timestamp and frame_id~%Header header~%~%#Segment type~%int8 seg_type~%~%#Segment number~%uint32 seg_number~%~%#6DOF pose~%geometry_msgs/Pose des_pose~%~%#Desired speed~%float64 des_speed~%~%#Desired curvature~%float64 des_rho~%~%#Desired distance along the segment~%float64 des_lseg~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DesiredState)))
  "Returns full string definition for message of type 'DesiredState"
  (cl:format cl:nil "#Standard ROS header for timestamp and frame_id~%Header header~%~%#Segment type~%int8 seg_type~%~%#Segment number~%uint32 seg_number~%~%#6DOF pose~%geometry_msgs/Pose des_pose~%~%#Desired speed~%float64 des_speed~%~%#Desired curvature~%float64 des_rho~%~%#Desired distance along the segment~%float64 des_lseg~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DesiredState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'des_pose))
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DesiredState>))
  "Converts a ROS message object to a list"
  (cl:list 'DesiredState
    (cl:cons ':header (header msg))
    (cl:cons ':seg_type (seg_type msg))
    (cl:cons ':seg_number (seg_number msg))
    (cl:cons ':des_pose (des_pose msg))
    (cl:cons ':des_speed (des_speed msg))
    (cl:cons ':des_rho (des_rho msg))
    (cl:cons ':des_lseg (des_lseg msg))
))
