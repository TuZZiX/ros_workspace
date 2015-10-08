; Auto-generated. Do not edit!


(cl:in-package cwru_msgs-msg)


;//! \htmlinclude Path.msg.html

(cl:defclass <Path> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (segs
    :reader segs
    :initarg :segs
    :type (cl:vector cwru_msgs-msg:PathSegment)
   :initform (cl:make-array 0 :element-type 'cwru_msgs-msg:PathSegment :initial-element (cl:make-instance 'cwru_msgs-msg:PathSegment))))
)

(cl:defclass Path (<Path>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Path>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Path)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_msgs-msg:<Path> is deprecated: use cwru_msgs-msg:Path instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:header-val is deprecated.  Use cwru_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'segs-val :lambda-list '(m))
(cl:defmethod segs-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:segs-val is deprecated.  Use cwru_msgs-msg:segs instead.")
  (segs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Path>) ostream)
  "Serializes a message object of type '<Path>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Path>) istream)
  "Deserializes a message object of type '<Path>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cwru_msgs-msg:PathSegment))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Path>)))
  "Returns string type for a message object of type '<Path>"
  "cwru_msgs/Path")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Path)))
  "Returns string type for a message object of type 'Path"
  "cwru_msgs/Path")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Path>)))
  "Returns md5sum for a message object of type '<Path>"
  "61997cac25b65fbf8f9034286f94085e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Path)))
  "Returns md5sum for a message object of type 'Path"
  "61997cac25b65fbf8f9034286f94085e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Path>)))
  "Returns full string definition for message of type '<Path>"
  (cl:format cl:nil "#Standard header.~%Header header~%~%#List of path segments that should be executed~%cwru_msgs/PathSegment[] segs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cwru_msgs/PathSegment~%#Reference frame that the following coordinates should be interpreted relative to and timestamp to use when transforming~%Header header~%~%#Segment type enums~%int8 LINE = 1~%int8 ARC = 2~%int8 SPIN_IN_PLACE = 3~%~%#Segment type~%int8 seg_type~%~%#Segment number~%uint32 seg_number~%~%#Segment length~%float64 seg_length~%~%#Reference point~%geometry_msgs/Point ref_point~%~%#Initial tangent angle~%geometry_msgs/Quaternion init_tan_angle~%~%#Curvature~%float64 curvature~%~%#Speed limits for this segment~%geometry_msgs/Twist max_speeds~%geometry_msgs/Twist min_speeds~%~%#Acceleration limit for this segment (m/s^2 for lines/arcs, rads/s^2 for spin-in-place)~%float64 accel_limit~%~%#Deceleration limit for this segment~%float64 decel_limit~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Path)))
  "Returns full string definition for message of type 'Path"
  (cl:format cl:nil "#Standard header.~%Header header~%~%#List of path segments that should be executed~%cwru_msgs/PathSegment[] segs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cwru_msgs/PathSegment~%#Reference frame that the following coordinates should be interpreted relative to and timestamp to use when transforming~%Header header~%~%#Segment type enums~%int8 LINE = 1~%int8 ARC = 2~%int8 SPIN_IN_PLACE = 3~%~%#Segment type~%int8 seg_type~%~%#Segment number~%uint32 seg_number~%~%#Segment length~%float64 seg_length~%~%#Reference point~%geometry_msgs/Point ref_point~%~%#Initial tangent angle~%geometry_msgs/Quaternion init_tan_angle~%~%#Curvature~%float64 curvature~%~%#Speed limits for this segment~%geometry_msgs/Twist max_speeds~%geometry_msgs/Twist min_speeds~%~%#Acceleration limit for this segment (m/s^2 for lines/arcs, rads/s^2 for spin-in-place)~%float64 accel_limit~%~%#Deceleration limit for this segment~%float64 decel_limit~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Path>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Path>))
  "Converts a ROS message object to a list"
  (cl:list 'Path
    (cl:cons ':header (header msg))
    (cl:cons ':segs (segs msg))
))
