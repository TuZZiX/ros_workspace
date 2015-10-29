; Auto-generated. Do not edit!


(cl:in-package example_trajectory-msg)


;//! \htmlinclude TrajActionMsgGoal.msg.html

(cl:defclass <TrajActionMsgGoal> (roslisp-msg-protocol:ros-message)
  ((trajectory
    :reader trajectory
    :initarg :trajectory
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory)))
)

(cl:defclass TrajActionMsgGoal (<TrajActionMsgGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajActionMsgGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajActionMsgGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name example_trajectory-msg:<TrajActionMsgGoal> is deprecated: use example_trajectory-msg:TrajActionMsgGoal instead.")))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <TrajActionMsgGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_trajectory-msg:trajectory-val is deprecated.  Use example_trajectory-msg:trajectory instead.")
  (trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajActionMsgGoal>) ostream)
  "Serializes a message object of type '<TrajActionMsgGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajActionMsgGoal>) istream)
  "Deserializes a message object of type '<TrajActionMsgGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajActionMsgGoal>)))
  "Returns string type for a message object of type '<TrajActionMsgGoal>"
  "example_trajectory/TrajActionMsgGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajActionMsgGoal)))
  "Returns string type for a message object of type 'TrajActionMsgGoal"
  "example_trajectory/TrajActionMsgGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajActionMsgGoal>)))
  "Returns md5sum for a message object of type '<TrajActionMsgGoal>"
  "2a0eff76c870e8595636c2a562ca298e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajActionMsgGoal)))
  "Returns md5sum for a message object of type 'TrajActionMsgGoal"
  "2a0eff76c870e8595636c2a562ca298e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajActionMsgGoal>)))
  "Returns full string definition for message of type '<TrajActionMsgGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%trajectory_msgs/JointTrajectory trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajActionMsgGoal)))
  "Returns full string definition for message of type 'TrajActionMsgGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%trajectory_msgs/JointTrajectory trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajActionMsgGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajActionMsgGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajActionMsgGoal
    (cl:cons ':trajectory (trajectory msg))
))