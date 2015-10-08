; Auto-generated. Do not edit!


(cl:in-package cwru_msgs-msg)


;//! \htmlinclude PowerState.msg.html

(cl:defclass <PowerState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (battery_voltage
    :reader battery_voltage
    :initarg :battery_voltage
    :type cl:float
    :initform 0.0)
   (cRIO_voltage
    :reader cRIO_voltage
    :initarg :cRIO_voltage
    :type cl:float
    :initform 0.0)
   (v13_8_voltage
    :reader v13_8_voltage
    :initarg :v13_8_voltage
    :type cl:float
    :initform 0.0)
   (motor_voltage
    :reader motor_voltage
    :initarg :motor_voltage
    :type cl:float
    :initform 0.0))
)

(cl:defclass PowerState (<PowerState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PowerState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PowerState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_msgs-msg:<PowerState> is deprecated: use cwru_msgs-msg:PowerState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:header-val is deprecated.  Use cwru_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'battery_voltage-val :lambda-list '(m))
(cl:defmethod battery_voltage-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:battery_voltage-val is deprecated.  Use cwru_msgs-msg:battery_voltage instead.")
  (battery_voltage m))

(cl:ensure-generic-function 'cRIO_voltage-val :lambda-list '(m))
(cl:defmethod cRIO_voltage-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:cRIO_voltage-val is deprecated.  Use cwru_msgs-msg:cRIO_voltage instead.")
  (cRIO_voltage m))

(cl:ensure-generic-function 'v13_8_voltage-val :lambda-list '(m))
(cl:defmethod v13_8_voltage-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:v13_8_voltage-val is deprecated.  Use cwru_msgs-msg:v13_8_voltage instead.")
  (v13_8_voltage m))

(cl:ensure-generic-function 'motor_voltage-val :lambda-list '(m))
(cl:defmethod motor_voltage-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:motor_voltage-val is deprecated.  Use cwru_msgs-msg:motor_voltage instead.")
  (motor_voltage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PowerState>) ostream)
  "Serializes a message object of type '<PowerState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'battery_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cRIO_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v13_8_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PowerState>) istream)
  "Deserializes a message object of type '<PowerState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'battery_voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cRIO_voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v13_8_voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_voltage) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PowerState>)))
  "Returns string type for a message object of type '<PowerState>"
  "cwru_msgs/PowerState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PowerState)))
  "Returns string type for a message object of type 'PowerState"
  "cwru_msgs/PowerState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PowerState>)))
  "Returns md5sum for a message object of type '<PowerState>"
  "28d9736fc054adc56d7b67c1f71a6b0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PowerState)))
  "Returns md5sum for a message object of type 'PowerState"
  "28d9736fc054adc56d7b67c1f71a6b0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PowerState>)))
  "Returns full string definition for message of type '<PowerState>"
  (cl:format cl:nil "Header header~%float32 battery_voltage~%float32 cRIO_voltage~%float32 v13_8_voltage~%float32 motor_voltage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PowerState)))
  "Returns full string definition for message of type 'PowerState"
  (cl:format cl:nil "Header header~%float32 battery_voltage~%float32 cRIO_voltage~%float32 v13_8_voltage~%float32 motor_voltage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PowerState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PowerState>))
  "Converts a ROS message object to a list"
  (cl:list 'PowerState
    (cl:cons ':header (header msg))
    (cl:cons ':battery_voltage (battery_voltage msg))
    (cl:cons ':cRIO_voltage (cRIO_voltage msg))
    (cl:cons ':v13_8_voltage (v13_8_voltage msg))
    (cl:cons ':motor_voltage (motor_voltage msg))
))
