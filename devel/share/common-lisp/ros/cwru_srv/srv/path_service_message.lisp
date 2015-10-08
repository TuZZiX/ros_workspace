; Auto-generated. Do not edit!


(cl:in-package cwru_srv-srv)


;//! \htmlinclude path_service_message-request.msg.html

(cl:defclass <path_service_message-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type nav_msgs-msg:Path
    :initform (cl:make-instance 'nav_msgs-msg:Path)))
)

(cl:defclass path_service_message-request (<path_service_message-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <path_service_message-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'path_service_message-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<path_service_message-request> is deprecated: use cwru_srv-srv:path_service_message-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <path_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:path-val is deprecated.  Use cwru_srv-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <path_service_message-request>) ostream)
  "Serializes a message object of type '<path_service_message-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <path_service_message-request>) istream)
  "Deserializes a message object of type '<path_service_message-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<path_service_message-request>)))
  "Returns string type for a service object of type '<path_service_message-request>"
  "cwru_srv/path_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_service_message-request)))
  "Returns string type for a service object of type 'path_service_message-request"
  "cwru_srv/path_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<path_service_message-request>)))
  "Returns md5sum for a message object of type '<path_service_message-request>"
  "8fb4d04b2272c50e65219c252c619030")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'path_service_message-request)))
  "Returns md5sum for a message object of type 'path_service_message-request"
  "8fb4d04b2272c50e65219c252c619030")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<path_service_message-request>)))
  "Returns full string definition for message of type '<path_service_message-request>"
  (cl:format cl:nil "nav_msgs/Path path~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'path_service_message-request)))
  "Returns full string definition for message of type 'path_service_message-request"
  (cl:format cl:nil "nav_msgs/Path path~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <path_service_message-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <path_service_message-request>))
  "Converts a ROS message object to a list"
  (cl:list 'path_service_message-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude path_service_message-response.msg.html

(cl:defclass <path_service_message-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass path_service_message-response (<path_service_message-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <path_service_message-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'path_service_message-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<path_service_message-response> is deprecated: use cwru_srv-srv:path_service_message-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <path_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:resp-val is deprecated.  Use cwru_srv-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <path_service_message-response>) ostream)
  "Serializes a message object of type '<path_service_message-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resp) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <path_service_message-response>) istream)
  "Deserializes a message object of type '<path_service_message-response>"
    (cl:setf (cl:slot-value msg 'resp) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<path_service_message-response>)))
  "Returns string type for a service object of type '<path_service_message-response>"
  "cwru_srv/path_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_service_message-response)))
  "Returns string type for a service object of type 'path_service_message-response"
  "cwru_srv/path_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<path_service_message-response>)))
  "Returns md5sum for a message object of type '<path_service_message-response>"
  "8fb4d04b2272c50e65219c252c619030")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'path_service_message-response)))
  "Returns md5sum for a message object of type 'path_service_message-response"
  "8fb4d04b2272c50e65219c252c619030")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<path_service_message-response>)))
  "Returns full string definition for message of type '<path_service_message-response>"
  (cl:format cl:nil "bool resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'path_service_message-response)))
  "Returns full string definition for message of type 'path_service_message-response"
  (cl:format cl:nil "bool resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <path_service_message-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <path_service_message-response>))
  "Converts a ROS message object to a list"
  (cl:list 'path_service_message-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'path_service_message)))
  'path_service_message-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'path_service_message)))
  'path_service_message-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_service_message)))
  "Returns string type for a service object of type '<path_service_message>"
  "cwru_srv/path_service_message")