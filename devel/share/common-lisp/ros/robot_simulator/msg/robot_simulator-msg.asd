
(cl:in-package :asdf)

(defsystem "robot_simulator-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "TrajMsgGoal" :depends-on ("_package_TrajMsgGoal"))
    (:file "_package_TrajMsgGoal" :depends-on ("_package"))
    (:file "TrajMsgResult" :depends-on ("_package_TrajMsgResult"))
    (:file "_package_TrajMsgResult" :depends-on ("_package"))
    (:file "TrajMsgActionResult" :depends-on ("_package_TrajMsgActionResult"))
    (:file "_package_TrajMsgActionResult" :depends-on ("_package"))
    (:file "TrajMsgActionFeedback" :depends-on ("_package_TrajMsgActionFeedback"))
    (:file "_package_TrajMsgActionFeedback" :depends-on ("_package"))
    (:file "TrajMsgActionGoal" :depends-on ("_package_TrajMsgActionGoal"))
    (:file "_package_TrajMsgActionGoal" :depends-on ("_package"))
    (:file "TrajMsgFeedback" :depends-on ("_package_TrajMsgFeedback"))
    (:file "_package_TrajMsgFeedback" :depends-on ("_package"))
    (:file "TrajMsgAction" :depends-on ("_package_TrajMsgAction"))
    (:file "_package_TrajMsgAction" :depends-on ("_package"))
  ))