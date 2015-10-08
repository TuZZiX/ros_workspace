; Auto-generated. Do not edit!


(cl:in-package cwru_srv-srv)


;//! \htmlinclude arm_nav_service_message-request.msg.html

(cl:defclass <arm_nav_service_message-request> (roslisp-msg-protocol:ros-message)
  ((cmd_mode
    :reader cmd_mode
    :initarg :cmd_mode
    :type cl:integer
    :initform 0)
   (q_vec_start
    :reader q_vec_start
    :initarg :q_vec_start
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (q_vec_end
    :reader q_vec_end
    :initarg :q_vec_end
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (poseStamped_start
    :reader poseStamped_start
    :initarg :poseStamped_start
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (poseStamped_goal
    :reader poseStamped_goal
    :initarg :poseStamped_goal
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (plan_id
    :reader plan_id
    :initarg :plan_id
    :type cl:integer
    :initform 0)
   (delta_p
    :reader delta_p
    :initarg :delta_p
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass arm_nav_service_message-request (<arm_nav_service_message-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_nav_service_message-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_nav_service_message-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<arm_nav_service_message-request> is deprecated: use cwru_srv-srv:arm_nav_service_message-request instead.")))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <arm_nav_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:cmd_mode-val is deprecated.  Use cwru_srv-srv:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'q_vec_start-val :lambda-list '(m))
(cl:defmethod q_vec_start-val ((m <arm_nav_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:q_vec_start-val is deprecated.  Use cwru_srv-srv:q_vec_start instead.")
  (q_vec_start m))

(cl:ensure-generic-function 'q_vec_end-val :lambda-list '(m))
(cl:defmethod q_vec_end-val ((m <arm_nav_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:q_vec_end-val is deprecated.  Use cwru_srv-srv:q_vec_end instead.")
  (q_vec_end m))

(cl:ensure-generic-function 'poseStamped_start-val :lambda-list '(m))
(cl:defmethod poseStamped_start-val ((m <arm_nav_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:poseStamped_start-val is deprecated.  Use cwru_srv-srv:poseStamped_start instead.")
  (poseStamped_start m))

(cl:ensure-generic-function 'poseStamped_goal-val :lambda-list '(m))
(cl:defmethod poseStamped_goal-val ((m <arm_nav_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:poseStamped_goal-val is deprecated.  Use cwru_srv-srv:poseStamped_goal instead.")
  (poseStamped_goal m))

(cl:ensure-generic-function 'plan_id-val :lambda-list '(m))
(cl:defmethod plan_id-val ((m <arm_nav_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:plan_id-val is deprecated.  Use cwru_srv-srv:plan_id instead.")
  (plan_id m))

(cl:ensure-generic-function 'delta_p-val :lambda-list '(m))
(cl:defmethod delta_p-val ((m <arm_nav_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:delta_p-val is deprecated.  Use cwru_srv-srv:delta_p instead.")
  (delta_p m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_nav_service_message-request>) ostream)
  "Serializes a message object of type '<arm_nav_service_message-request>"
  (cl:let* ((signed (cl:slot-value msg 'cmd_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'q_vec_start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'q_vec_start))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'q_vec_end))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'q_vec_end))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poseStamped_start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poseStamped_goal) ostream)
  (cl:let* ((signed (cl:slot-value msg 'plan_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'delta_p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'delta_p))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_nav_service_message-request>) istream)
  "Deserializes a message object of type '<arm_nav_service_message-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cmd_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'q_vec_start) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'q_vec_start)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'q_vec_end) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'q_vec_end)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poseStamped_start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poseStamped_goal) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'plan_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'delta_p) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'delta_p)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_nav_service_message-request>)))
  "Returns string type for a service object of type '<arm_nav_service_message-request>"
  "cwru_srv/arm_nav_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_nav_service_message-request)))
  "Returns string type for a service object of type 'arm_nav_service_message-request"
  "cwru_srv/arm_nav_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_nav_service_message-request>)))
  "Returns md5sum for a message object of type '<arm_nav_service_message-request>"
  "3416a565a18c200ab6e309f562189f67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_nav_service_message-request)))
  "Returns md5sum for a message object of type 'arm_nav_service_message-request"
  "3416a565a18c200ab6e309f562189f67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_nav_service_message-request>)))
  "Returns full string definition for message of type '<arm_nav_service_message-request>"
  (cl:format cl:nil "~%int32 cmd_mode~%~%~%float32[] q_vec_start~%float32[] q_vec_end~%~%~%~%geometry_msgs/PoseStamped poseStamped_start~%geometry_msgs/PoseStamped poseStamped_goal~%~%~%~%int32 plan_id~%~%~%float32[] delta_p~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_nav_service_message-request)))
  "Returns full string definition for message of type 'arm_nav_service_message-request"
  (cl:format cl:nil "~%int32 cmd_mode~%~%~%float32[] q_vec_start~%float32[] q_vec_end~%~%~%~%geometry_msgs/PoseStamped poseStamped_start~%geometry_msgs/PoseStamped poseStamped_goal~%~%~%~%int32 plan_id~%~%~%float32[] delta_p~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_nav_service_message-request>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'q_vec_start) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'q_vec_end) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poseStamped_start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poseStamped_goal))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'delta_p) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_nav_service_message-request>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_nav_service_message-request
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':q_vec_start (q_vec_start msg))
    (cl:cons ':q_vec_end (q_vec_end msg))
    (cl:cons ':poseStamped_start (poseStamped_start msg))
    (cl:cons ':poseStamped_goal (poseStamped_goal msg))
    (cl:cons ':plan_id (plan_id msg))
    (cl:cons ':delta_p (delta_p msg))
))
;//! \htmlinclude arm_nav_service_message-response.msg.html

(cl:defclass <arm_nav_service_message-response> (roslisp-msg-protocol:ros-message)
  ((bool_resp
    :reader bool_resp
    :initarg :bool_resp
    :type cl:boolean
    :initform cl:nil)
   (rtn_code
    :reader rtn_code
    :initarg :rtn_code
    :type cl:integer
    :initform 0)
   (plan_id
    :reader plan_id
    :initarg :plan_id
    :type cl:integer
    :initform 0)
   (q_vec_start
    :reader q_vec_start
    :initarg :q_vec_start
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (q_vec_end
    :reader q_vec_end
    :initarg :q_vec_end
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass arm_nav_service_message-response (<arm_nav_service_message-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_nav_service_message-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_nav_service_message-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<arm_nav_service_message-response> is deprecated: use cwru_srv-srv:arm_nav_service_message-response instead.")))

(cl:ensure-generic-function 'bool_resp-val :lambda-list '(m))
(cl:defmethod bool_resp-val ((m <arm_nav_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:bool_resp-val is deprecated.  Use cwru_srv-srv:bool_resp instead.")
  (bool_resp m))

(cl:ensure-generic-function 'rtn_code-val :lambda-list '(m))
(cl:defmethod rtn_code-val ((m <arm_nav_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:rtn_code-val is deprecated.  Use cwru_srv-srv:rtn_code instead.")
  (rtn_code m))

(cl:ensure-generic-function 'plan_id-val :lambda-list '(m))
(cl:defmethod plan_id-val ((m <arm_nav_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:plan_id-val is deprecated.  Use cwru_srv-srv:plan_id instead.")
  (plan_id m))

(cl:ensure-generic-function 'q_vec_start-val :lambda-list '(m))
(cl:defmethod q_vec_start-val ((m <arm_nav_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:q_vec_start-val is deprecated.  Use cwru_srv-srv:q_vec_start instead.")
  (q_vec_start m))

(cl:ensure-generic-function 'q_vec_end-val :lambda-list '(m))
(cl:defmethod q_vec_end-val ((m <arm_nav_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:q_vec_end-val is deprecated.  Use cwru_srv-srv:q_vec_end instead.")
  (q_vec_end m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_nav_service_message-response>) ostream)
  "Serializes a message object of type '<arm_nav_service_message-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bool_resp) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'rtn_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'plan_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'q_vec_start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'q_vec_start))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'q_vec_end))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'q_vec_end))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_nav_service_message-response>) istream)
  "Deserializes a message object of type '<arm_nav_service_message-response>"
    (cl:setf (cl:slot-value msg 'bool_resp) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rtn_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'plan_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'q_vec_start) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'q_vec_start)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'q_vec_end) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'q_vec_end)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_nav_service_message-response>)))
  "Returns string type for a service object of type '<arm_nav_service_message-response>"
  "cwru_srv/arm_nav_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_nav_service_message-response)))
  "Returns string type for a service object of type 'arm_nav_service_message-response"
  "cwru_srv/arm_nav_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_nav_service_message-response>)))
  "Returns md5sum for a message object of type '<arm_nav_service_message-response>"
  "3416a565a18c200ab6e309f562189f67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_nav_service_message-response)))
  "Returns md5sum for a message object of type 'arm_nav_service_message-response"
  "3416a565a18c200ab6e309f562189f67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_nav_service_message-response>)))
  "Returns full string definition for message of type '<arm_nav_service_message-response>"
  (cl:format cl:nil "~%bool bool_resp~%~%~%int32 rtn_code~%~%~%~%int32 plan_id~%~%~%float32[] q_vec_start~%float32[] q_vec_end~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_nav_service_message-response)))
  "Returns full string definition for message of type 'arm_nav_service_message-response"
  (cl:format cl:nil "~%bool bool_resp~%~%~%int32 rtn_code~%~%~%~%int32 plan_id~%~%~%float32[] q_vec_start~%float32[] q_vec_end~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_nav_service_message-response>))
  (cl:+ 0
     1
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'q_vec_start) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'q_vec_end) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_nav_service_message-response>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_nav_service_message-response
    (cl:cons ':bool_resp (bool_resp msg))
    (cl:cons ':rtn_code (rtn_code msg))
    (cl:cons ':plan_id (plan_id msg))
    (cl:cons ':q_vec_start (q_vec_start msg))
    (cl:cons ':q_vec_end (q_vec_end msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'arm_nav_service_message)))
  'arm_nav_service_message-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'arm_nav_service_message)))
  'arm_nav_service_message-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_nav_service_message)))
  "Returns string type for a service object of type '<arm_nav_service_message>"
  "cwru_srv/arm_nav_service_message")