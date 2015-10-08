; Auto-generated. Do not edit!


(cl:in-package cartesian_moves-msg)


;//! \htmlinclude cartTrajAction.msg.html

(cl:defclass <cartTrajAction> (roslisp-msg-protocol:ros-message)
  ((action_goal
    :reader action_goal
    :initarg :action_goal
    :type cartesian_moves-msg:cartTrajActionGoal
    :initform (cl:make-instance 'cartesian_moves-msg:cartTrajActionGoal))
   (action_result
    :reader action_result
    :initarg :action_result
    :type cartesian_moves-msg:cartTrajActionResult
    :initform (cl:make-instance 'cartesian_moves-msg:cartTrajActionResult))
   (action_feedback
    :reader action_feedback
    :initarg :action_feedback
    :type cartesian_moves-msg:cartTrajActionFeedback
    :initform (cl:make-instance 'cartesian_moves-msg:cartTrajActionFeedback)))
)

(cl:defclass cartTrajAction (<cartTrajAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cartTrajAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cartTrajAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cartesian_moves-msg:<cartTrajAction> is deprecated: use cartesian_moves-msg:cartTrajAction instead.")))

(cl:ensure-generic-function 'action_goal-val :lambda-list '(m))
(cl:defmethod action_goal-val ((m <cartTrajAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_moves-msg:action_goal-val is deprecated.  Use cartesian_moves-msg:action_goal instead.")
  (action_goal m))

(cl:ensure-generic-function 'action_result-val :lambda-list '(m))
(cl:defmethod action_result-val ((m <cartTrajAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_moves-msg:action_result-val is deprecated.  Use cartesian_moves-msg:action_result instead.")
  (action_result m))

(cl:ensure-generic-function 'action_feedback-val :lambda-list '(m))
(cl:defmethod action_feedback-val ((m <cartTrajAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_moves-msg:action_feedback-val is deprecated.  Use cartesian_moves-msg:action_feedback instead.")
  (action_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cartTrajAction>) ostream)
  "Serializes a message object of type '<cartTrajAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_result) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cartTrajAction>) istream)
  "Deserializes a message object of type '<cartTrajAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_result) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cartTrajAction>)))
  "Returns string type for a message object of type '<cartTrajAction>"
  "cartesian_moves/cartTrajAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cartTrajAction)))
  "Returns string type for a message object of type 'cartTrajAction"
  "cartesian_moves/cartTrajAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cartTrajAction>)))
  "Returns md5sum for a message object of type '<cartTrajAction>"
  "6772530a311c1d576a37e156463bc006")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cartTrajAction)))
  "Returns md5sum for a message object of type 'cartTrajAction"
  "6772530a311c1d576a37e156463bc006")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cartTrajAction>)))
  "Returns full string definition for message of type '<cartTrajAction>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%cartTrajActionGoal action_goal~%cartTrajActionResult action_result~%cartTrajActionFeedback action_feedback~%~%================================================================================~%MSG: cartesian_moves/cartTrajActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%cartTrajGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: cartesian_moves/cartTrajGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%#the lines with the hash signs are merely comments~%#goal, result and feedback are defined by this fixed order, and separated by 3 hyphens~%#trajectory_msgs/JointTrajectory trajectory~%int32 traj_id~%float64 x~%float64 y~%float64 z~%float64 speed~%~%================================================================================~%MSG: cartesian_moves/cartTrajActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%cartTrajResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: cartesian_moves/cartTrajResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%#return_val = 1 for traj complete; traj_id should echo the input traj_id~%int32 return_val~%int32 traj_id~%~%================================================================================~%MSG: cartesian_moves/cartTrajActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%cartTrajFeedback feedback~%~%================================================================================~%MSG: cartesian_moves/cartTrajFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback: optional; could declare step number of trajectory in progress~%int32 fdbk~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cartTrajAction)))
  "Returns full string definition for message of type 'cartTrajAction"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%cartTrajActionGoal action_goal~%cartTrajActionResult action_result~%cartTrajActionFeedback action_feedback~%~%================================================================================~%MSG: cartesian_moves/cartTrajActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%cartTrajGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: cartesian_moves/cartTrajGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%#the lines with the hash signs are merely comments~%#goal, result and feedback are defined by this fixed order, and separated by 3 hyphens~%#trajectory_msgs/JointTrajectory trajectory~%int32 traj_id~%float64 x~%float64 y~%float64 z~%float64 speed~%~%================================================================================~%MSG: cartesian_moves/cartTrajActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%cartTrajResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: cartesian_moves/cartTrajResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%#return_val = 1 for traj complete; traj_id should echo the input traj_id~%int32 return_val~%int32 traj_id~%~%================================================================================~%MSG: cartesian_moves/cartTrajActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%cartTrajFeedback feedback~%~%================================================================================~%MSG: cartesian_moves/cartTrajFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback: optional; could declare step number of trajectory in progress~%int32 fdbk~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cartTrajAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_result))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cartTrajAction>))
  "Converts a ROS message object to a list"
  (cl:list 'cartTrajAction
    (cl:cons ':action_goal (action_goal msg))
    (cl:cons ':action_result (action_result msg))
    (cl:cons ':action_feedback (action_feedback msg))
))
