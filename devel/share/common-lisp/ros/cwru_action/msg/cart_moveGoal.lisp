; Auto-generated. Do not edit!


(cl:in-package cwru_action-msg)


;//! \htmlinclude cart_moveGoal.msg.html

(cl:defclass <cart_moveGoal> (roslisp-msg-protocol:ros-message)
  ((des_pose_gripper1
    :reader des_pose_gripper1
    :initarg :des_pose_gripper1
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (des_pose_gripper2
    :reader des_pose_gripper2
    :initarg :des_pose_gripper2
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (gripper_jaw_angle1
    :reader gripper_jaw_angle1
    :initarg :gripper_jaw_angle1
    :type cl:float
    :initform 0.0)
   (gripper_jaw_angle2
    :reader gripper_jaw_angle2
    :initarg :gripper_jaw_angle2
    :type cl:float
    :initform 0.0)
   (move_time
    :reader move_time
    :initarg :move_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass cart_moveGoal (<cart_moveGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cart_moveGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cart_moveGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_action-msg:<cart_moveGoal> is deprecated: use cwru_action-msg:cart_moveGoal instead.")))

(cl:ensure-generic-function 'des_pose_gripper1-val :lambda-list '(m))
(cl:defmethod des_pose_gripper1-val ((m <cart_moveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_action-msg:des_pose_gripper1-val is deprecated.  Use cwru_action-msg:des_pose_gripper1 instead.")
  (des_pose_gripper1 m))

(cl:ensure-generic-function 'des_pose_gripper2-val :lambda-list '(m))
(cl:defmethod des_pose_gripper2-val ((m <cart_moveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_action-msg:des_pose_gripper2-val is deprecated.  Use cwru_action-msg:des_pose_gripper2 instead.")
  (des_pose_gripper2 m))

(cl:ensure-generic-function 'gripper_jaw_angle1-val :lambda-list '(m))
(cl:defmethod gripper_jaw_angle1-val ((m <cart_moveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_action-msg:gripper_jaw_angle1-val is deprecated.  Use cwru_action-msg:gripper_jaw_angle1 instead.")
  (gripper_jaw_angle1 m))

(cl:ensure-generic-function 'gripper_jaw_angle2-val :lambda-list '(m))
(cl:defmethod gripper_jaw_angle2-val ((m <cart_moveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_action-msg:gripper_jaw_angle2-val is deprecated.  Use cwru_action-msg:gripper_jaw_angle2 instead.")
  (gripper_jaw_angle2 m))

(cl:ensure-generic-function 'move_time-val :lambda-list '(m))
(cl:defmethod move_time-val ((m <cart_moveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_action-msg:move_time-val is deprecated.  Use cwru_action-msg:move_time instead.")
  (move_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cart_moveGoal>) ostream)
  "Serializes a message object of type '<cart_moveGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'des_pose_gripper1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'des_pose_gripper2) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'gripper_jaw_angle1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'gripper_jaw_angle2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'move_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cart_moveGoal>) istream)
  "Deserializes a message object of type '<cart_moveGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'des_pose_gripper1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'des_pose_gripper2) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gripper_jaw_angle1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gripper_jaw_angle2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'move_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cart_moveGoal>)))
  "Returns string type for a message object of type '<cart_moveGoal>"
  "cwru_action/cart_moveGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cart_moveGoal)))
  "Returns string type for a message object of type 'cart_moveGoal"
  "cwru_action/cart_moveGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cart_moveGoal>)))
  "Returns md5sum for a message object of type '<cart_moveGoal>"
  "d2631f788d8e0cc2d280c449b075f8f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cart_moveGoal)))
  "Returns md5sum for a message object of type 'cart_moveGoal"
  "d2631f788d8e0cc2d280c449b075f8f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cart_moveGoal>)))
  "Returns full string definition for message of type '<cart_moveGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#This action message must specify desired pose for gripper1, jaw opening for gripper1,~%# desired pose for gripper2, jaw opening for gripper 2, and desired duration of move (in sec)~%#goal:~%geometry_msgs/PoseStamped des_pose_gripper1~%geometry_msgs/PoseStamped des_pose_gripper2~%float64 gripper_jaw_angle1~%float64 gripper_jaw_angle2~%float64 move_time~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cart_moveGoal)))
  "Returns full string definition for message of type 'cart_moveGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#This action message must specify desired pose for gripper1, jaw opening for gripper1,~%# desired pose for gripper2, jaw opening for gripper 2, and desired duration of move (in sec)~%#goal:~%geometry_msgs/PoseStamped des_pose_gripper1~%geometry_msgs/PoseStamped des_pose_gripper2~%float64 gripper_jaw_angle1~%float64 gripper_jaw_angle2~%float64 move_time~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cart_moveGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'des_pose_gripper1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'des_pose_gripper2))
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cart_moveGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'cart_moveGoal
    (cl:cons ':des_pose_gripper1 (des_pose_gripper1 msg))
    (cl:cons ':des_pose_gripper2 (des_pose_gripper2 msg))
    (cl:cons ':gripper_jaw_angle1 (gripper_jaw_angle1 msg))
    (cl:cons ':gripper_jaw_angle2 (gripper_jaw_angle2 msg))
    (cl:cons ':move_time (move_time msg))
))
