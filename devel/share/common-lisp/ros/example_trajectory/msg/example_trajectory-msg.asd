
(cl:in-package :asdf)

(defsystem "example_trajectory-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "TrajActionGoal" :depends-on ("_package_TrajActionGoal"))
    (:file "_package_TrajActionGoal" :depends-on ("_package"))
    (:file "TrajActionActionGoal" :depends-on ("_package_TrajActionActionGoal"))
    (:file "_package_TrajActionActionGoal" :depends-on ("_package"))
    (:file "TrajActionMsgActionFeedback" :depends-on ("_package_TrajActionMsgActionFeedback"))
    (:file "_package_TrajActionMsgActionFeedback" :depends-on ("_package"))
    (:file "TrajActionActionFeedback" :depends-on ("_package_TrajActionActionFeedback"))
    (:file "_package_TrajActionActionFeedback" :depends-on ("_package"))
    (:file "TrajActionAction" :depends-on ("_package_TrajActionAction"))
    (:file "_package_TrajActionAction" :depends-on ("_package"))
    (:file "TrajActionResult" :depends-on ("_package_TrajActionResult"))
    (:file "_package_TrajActionResult" :depends-on ("_package"))
    (:file "TrajActionMsgFeedback" :depends-on ("_package_TrajActionMsgFeedback"))
    (:file "_package_TrajActionMsgFeedback" :depends-on ("_package"))
    (:file "TrajActionActionResult" :depends-on ("_package_TrajActionActionResult"))
    (:file "_package_TrajActionActionResult" :depends-on ("_package"))
    (:file "TrajActionFeedback" :depends-on ("_package_TrajActionFeedback"))
    (:file "_package_TrajActionFeedback" :depends-on ("_package"))
    (:file "TrajActionMsgResult" :depends-on ("_package_TrajActionMsgResult"))
    (:file "_package_TrajActionMsgResult" :depends-on ("_package"))
    (:file "TrajActionMsgActionGoal" :depends-on ("_package_TrajActionMsgActionGoal"))
    (:file "_package_TrajActionMsgActionGoal" :depends-on ("_package"))
    (:file "TrajActionMsgActionResult" :depends-on ("_package_TrajActionMsgActionResult"))
    (:file "_package_TrajActionMsgActionResult" :depends-on ("_package"))
    (:file "TrajActionMsgGoal" :depends-on ("_package_TrajActionMsgGoal"))
    (:file "_package_TrajActionMsgGoal" :depends-on ("_package"))
    (:file "TrajActionMsgAction" :depends-on ("_package_TrajActionMsgAction"))
    (:file "_package_TrajActionMsgAction" :depends-on ("_package"))
  ))