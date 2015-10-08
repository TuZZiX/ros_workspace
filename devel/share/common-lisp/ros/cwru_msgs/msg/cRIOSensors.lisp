; Auto-generated. Do not edit!


(cl:in-package cwru_msgs-msg)


;//! \htmlinclude cRIOSensors.msg.html

(cl:defclass <cRIOSensors> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (left_wheel_encoder
    :reader left_wheel_encoder
    :initarg :left_wheel_encoder
    :type cl:integer
    :initform 0)
   (right_wheel_encoder
    :reader right_wheel_encoder
    :initarg :right_wheel_encoder
    :type cl:integer
    :initform 0)
   (left_motor_encoder
    :reader left_motor_encoder
    :initarg :left_motor_encoder
    :type cl:integer
    :initform 0)
   (right_motor_encoder
    :reader right_motor_encoder
    :initarg :right_motor_encoder
    :type cl:integer
    :initform 0)
   (yaw_rate
    :reader yaw_rate
    :initarg :yaw_rate
    :type cl:fixnum
    :initform 0)
   (yaw_temp
    :reader yaw_temp
    :initarg :yaw_temp
    :type cl:fixnum
    :initform 0)
   (yaw_ref
    :reader yaw_ref
    :initarg :yaw_ref
    :type cl:fixnum
    :initform 0))
)

(cl:defclass cRIOSensors (<cRIOSensors>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cRIOSensors>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cRIOSensors)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_msgs-msg:<cRIOSensors> is deprecated: use cwru_msgs-msg:cRIOSensors instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:header-val is deprecated.  Use cwru_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'left_wheel_encoder-val :lambda-list '(m))
(cl:defmethod left_wheel_encoder-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:left_wheel_encoder-val is deprecated.  Use cwru_msgs-msg:left_wheel_encoder instead.")
  (left_wheel_encoder m))

(cl:ensure-generic-function 'right_wheel_encoder-val :lambda-list '(m))
(cl:defmethod right_wheel_encoder-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:right_wheel_encoder-val is deprecated.  Use cwru_msgs-msg:right_wheel_encoder instead.")
  (right_wheel_encoder m))

(cl:ensure-generic-function 'left_motor_encoder-val :lambda-list '(m))
(cl:defmethod left_motor_encoder-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:left_motor_encoder-val is deprecated.  Use cwru_msgs-msg:left_motor_encoder instead.")
  (left_motor_encoder m))

(cl:ensure-generic-function 'right_motor_encoder-val :lambda-list '(m))
(cl:defmethod right_motor_encoder-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:right_motor_encoder-val is deprecated.  Use cwru_msgs-msg:right_motor_encoder instead.")
  (right_motor_encoder m))

(cl:ensure-generic-function 'yaw_rate-val :lambda-list '(m))
(cl:defmethod yaw_rate-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:yaw_rate-val is deprecated.  Use cwru_msgs-msg:yaw_rate instead.")
  (yaw_rate m))

(cl:ensure-generic-function 'yaw_temp-val :lambda-list '(m))
(cl:defmethod yaw_temp-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:yaw_temp-val is deprecated.  Use cwru_msgs-msg:yaw_temp instead.")
  (yaw_temp m))

(cl:ensure-generic-function 'yaw_ref-val :lambda-list '(m))
(cl:defmethod yaw_ref-val ((m <cRIOSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:yaw_ref-val is deprecated.  Use cwru_msgs-msg:yaw_ref instead.")
  (yaw_ref m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cRIOSensors>) ostream)
  "Serializes a message object of type '<cRIOSensors>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'left_wheel_encoder)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_wheel_encoder)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left_motor_encoder)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_motor_encoder)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw_rate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw_temp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw_ref)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cRIOSensors>) istream)
  "Deserializes a message object of type '<cRIOSensors>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_wheel_encoder) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_wheel_encoder) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_motor_encoder) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_motor_encoder) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw_rate) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw_temp) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw_ref) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cRIOSensors>)))
  "Returns string type for a message object of type '<cRIOSensors>"
  "cwru_msgs/cRIOSensors")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cRIOSensors)))
  "Returns string type for a message object of type 'cRIOSensors"
  "cwru_msgs/cRIOSensors")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cRIOSensors>)))
  "Returns md5sum for a message object of type '<cRIOSensors>"
  "210acf44f8ca85255cab84f619fb4f26")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cRIOSensors)))
  "Returns md5sum for a message object of type 'cRIOSensors"
  "210acf44f8ca85255cab84f619fb4f26")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cRIOSensors>)))
  "Returns full string definition for message of type '<cRIOSensors>"
  (cl:format cl:nil "Header header~%int32 left_wheel_encoder~%int32 right_wheel_encoder~%int32 left_motor_encoder~%int32 right_motor_encoder~%~%int16 yaw_rate~%int16 yaw_temp~%int16 yaw_ref~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cRIOSensors)))
  "Returns full string definition for message of type 'cRIOSensors"
  (cl:format cl:nil "Header header~%int32 left_wheel_encoder~%int32 right_wheel_encoder~%int32 left_motor_encoder~%int32 right_motor_encoder~%~%int16 yaw_rate~%int16 yaw_temp~%int16 yaw_ref~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cRIOSensors>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cRIOSensors>))
  "Converts a ROS message object to a list"
  (cl:list 'cRIOSensors
    (cl:cons ':header (header msg))
    (cl:cons ':left_wheel_encoder (left_wheel_encoder msg))
    (cl:cons ':right_wheel_encoder (right_wheel_encoder msg))
    (cl:cons ':left_motor_encoder (left_motor_encoder msg))
    (cl:cons ':right_motor_encoder (right_motor_encoder msg))
    (cl:cons ':yaw_rate (yaw_rate msg))
    (cl:cons ':yaw_temp (yaw_temp msg))
    (cl:cons ':yaw_ref (yaw_ref msg))
))
