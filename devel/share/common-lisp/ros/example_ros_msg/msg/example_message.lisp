; Auto-generated. Do not edit!


(cl:in-package example_ros_msg-msg)


;//! \htmlinclude example_message.msg.html

(cl:defclass <example_message> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (demo_int
    :reader demo_int
    :initarg :demo_int
    :type cl:integer
    :initform 0)
   (demo_double
    :reader demo_double
    :initarg :demo_double
    :type cl:float
    :initform 0.0)
   (TF
    :reader TF
    :initarg :TF
    :type cl:boolean
    :initform cl:nil)
   (my_first_vector
    :reader my_first_vector
    :initarg :my_first_vector
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass example_message (<example_message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <example_message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'example_message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name example_ros_msg-msg:<example_message> is deprecated: use example_ros_msg-msg:example_message instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <example_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_msg-msg:header-val is deprecated.  Use example_ros_msg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'demo_int-val :lambda-list '(m))
(cl:defmethod demo_int-val ((m <example_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_msg-msg:demo_int-val is deprecated.  Use example_ros_msg-msg:demo_int instead.")
  (demo_int m))

(cl:ensure-generic-function 'demo_double-val :lambda-list '(m))
(cl:defmethod demo_double-val ((m <example_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_msg-msg:demo_double-val is deprecated.  Use example_ros_msg-msg:demo_double instead.")
  (demo_double m))

(cl:ensure-generic-function 'TF-val :lambda-list '(m))
(cl:defmethod TF-val ((m <example_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_msg-msg:TF-val is deprecated.  Use example_ros_msg-msg:TF instead.")
  (TF m))

(cl:ensure-generic-function 'my_first_vector-val :lambda-list '(m))
(cl:defmethod my_first_vector-val ((m <example_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_msg-msg:my_first_vector-val is deprecated.  Use example_ros_msg-msg:my_first_vector instead.")
  (my_first_vector m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <example_message>) ostream)
  "Serializes a message object of type '<example_message>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'demo_int)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'demo_double))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'TF) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'my_first_vector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'my_first_vector))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <example_message>) istream)
  "Deserializes a message object of type '<example_message>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'demo_int) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'demo_double) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'TF) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'my_first_vector) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'my_first_vector)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<example_message>)))
  "Returns string type for a message object of type '<example_message>"
  "example_ros_msg/example_message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'example_message)))
  "Returns string type for a message object of type 'example_message"
  "example_ros_msg/example_message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<example_message>)))
  "Returns md5sum for a message object of type '<example_message>"
  "7915b7d98e95ea55af183a4501515331")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'example_message)))
  "Returns md5sum for a message object of type 'example_message"
  "7915b7d98e95ea55af183a4501515331")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<example_message>)))
  "Returns full string definition for message of type '<example_message>"
  (cl:format cl:nil "# here are primitives that can be used:~%#int8, int16, int32, int64 (plus uint*)~%# float32, float64~%# string~%# time, duration~%# other msg files~%# variable-length array[] and fixed-length array[C] ~%Header header~%int32 demo_int~%float64 demo_double~%bool TF~%float64[] my_first_vector~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'example_message)))
  "Returns full string definition for message of type 'example_message"
  (cl:format cl:nil "# here are primitives that can be used:~%#int8, int16, int32, int64 (plus uint*)~%# float32, float64~%# string~%# time, duration~%# other msg files~%# variable-length array[] and fixed-length array[C] ~%Header header~%int32 demo_int~%float64 demo_double~%bool TF~%float64[] my_first_vector~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <example_message>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     8
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'my_first_vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <example_message>))
  "Converts a ROS message object to a list"
  (cl:list 'example_message
    (cl:cons ':header (header msg))
    (cl:cons ':demo_int (demo_int msg))
    (cl:cons ':demo_double (demo_double msg))
    (cl:cons ':TF (TF msg))
    (cl:cons ':my_first_vector (my_first_vector msg))
))
