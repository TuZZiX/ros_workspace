; Auto-generated. Do not edit!


(cl:in-package cwru_srv-srv)


;//! \htmlinclude IM_node_service_message-request.msg.html

(cl:defclass <IM_node_service_message-request> (roslisp-msg-protocol:ros-message)
  ((cmd_mode
    :reader cmd_mode
    :initarg :cmd_mode
    :type cl:integer
    :initform 0)
   (poseStamped_IM_desired
    :reader poseStamped_IM_desired
    :initarg :poseStamped_IM_desired
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass IM_node_service_message-request (<IM_node_service_message-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IM_node_service_message-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IM_node_service_message-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<IM_node_service_message-request> is deprecated: use cwru_srv-srv:IM_node_service_message-request instead.")))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <IM_node_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:cmd_mode-val is deprecated.  Use cwru_srv-srv:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'poseStamped_IM_desired-val :lambda-list '(m))
(cl:defmethod poseStamped_IM_desired-val ((m <IM_node_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:poseStamped_IM_desired-val is deprecated.  Use cwru_srv-srv:poseStamped_IM_desired instead.")
  (poseStamped_IM_desired m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IM_node_service_message-request>) ostream)
  "Serializes a message object of type '<IM_node_service_message-request>"
  (cl:let* ((signed (cl:slot-value msg 'cmd_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poseStamped_IM_desired) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IM_node_service_message-request>) istream)
  "Deserializes a message object of type '<IM_node_service_message-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cmd_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poseStamped_IM_desired) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IM_node_service_message-request>)))
  "Returns string type for a service object of type '<IM_node_service_message-request>"
  "cwru_srv/IM_node_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IM_node_service_message-request)))
  "Returns string type for a service object of type 'IM_node_service_message-request"
  "cwru_srv/IM_node_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IM_node_service_message-request>)))
  "Returns md5sum for a message object of type '<IM_node_service_message-request>"
  "64798921d798e32da065649fee6f759f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IM_node_service_message-request)))
  "Returns md5sum for a message object of type 'IM_node_service_message-request"
  "64798921d798e32da065649fee6f759f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IM_node_service_message-request>)))
  "Returns full string definition for message of type '<IM_node_service_message-request>"
  (cl:format cl:nil "~%int32 cmd_mode~%~%~%~%geometry_msgs/PoseStamped poseStamped_IM_desired~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IM_node_service_message-request)))
  "Returns full string definition for message of type 'IM_node_service_message-request"
  (cl:format cl:nil "~%int32 cmd_mode~%~%~%~%geometry_msgs/PoseStamped poseStamped_IM_desired~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IM_node_service_message-request>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poseStamped_IM_desired))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IM_node_service_message-request>))
  "Converts a ROS message object to a list"
  (cl:list 'IM_node_service_message-request
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':poseStamped_IM_desired (poseStamped_IM_desired msg))
))
;//! \htmlinclude IM_node_service_message-response.msg.html

(cl:defclass <IM_node_service_message-response> (roslisp-msg-protocol:ros-message)
  ((poseStamped_IM_current
    :reader poseStamped_IM_current
    :initarg :poseStamped_IM_current
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass IM_node_service_message-response (<IM_node_service_message-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IM_node_service_message-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IM_node_service_message-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<IM_node_service_message-response> is deprecated: use cwru_srv-srv:IM_node_service_message-response instead.")))

(cl:ensure-generic-function 'poseStamped_IM_current-val :lambda-list '(m))
(cl:defmethod poseStamped_IM_current-val ((m <IM_node_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:poseStamped_IM_current-val is deprecated.  Use cwru_srv-srv:poseStamped_IM_current instead.")
  (poseStamped_IM_current m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IM_node_service_message-response>) ostream)
  "Serializes a message object of type '<IM_node_service_message-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poseStamped_IM_current) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IM_node_service_message-response>) istream)
  "Deserializes a message object of type '<IM_node_service_message-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poseStamped_IM_current) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IM_node_service_message-response>)))
  "Returns string type for a service object of type '<IM_node_service_message-response>"
  "cwru_srv/IM_node_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IM_node_service_message-response)))
  "Returns string type for a service object of type 'IM_node_service_message-response"
  "cwru_srv/IM_node_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IM_node_service_message-response>)))
  "Returns md5sum for a message object of type '<IM_node_service_message-response>"
  "64798921d798e32da065649fee6f759f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IM_node_service_message-response)))
  "Returns md5sum for a message object of type 'IM_node_service_message-response"
  "64798921d798e32da065649fee6f759f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IM_node_service_message-response>)))
  "Returns full string definition for message of type '<IM_node_service_message-response>"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped poseStamped_IM_current~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IM_node_service_message-response)))
  "Returns full string definition for message of type 'IM_node_service_message-response"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped poseStamped_IM_current~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IM_node_service_message-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poseStamped_IM_current))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IM_node_service_message-response>))
  "Converts a ROS message object to a list"
  (cl:list 'IM_node_service_message-response
    (cl:cons ':poseStamped_IM_current (poseStamped_IM_current msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'IM_node_service_message)))
  'IM_node_service_message-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'IM_node_service_message)))
  'IM_node_service_message-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IM_node_service_message)))
  "Returns string type for a service object of type '<IM_node_service_message>"
  "cwru_srv/IM_node_service_message")