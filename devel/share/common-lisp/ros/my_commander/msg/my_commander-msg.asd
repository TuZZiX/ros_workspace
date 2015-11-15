
(cl:in-package :asdf)

(defsystem "my_commander-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "commandAction" :depends-on ("_package_commandAction"))
    (:file "_package_commandAction" :depends-on ("_package"))
    (:file "commandResult" :depends-on ("_package_commandResult"))
    (:file "_package_commandResult" :depends-on ("_package"))
    (:file "commandActionResult" :depends-on ("_package_commandActionResult"))
    (:file "_package_commandActionResult" :depends-on ("_package"))
    (:file "commandActionFeedback" :depends-on ("_package_commandActionFeedback"))
    (:file "_package_commandActionFeedback" :depends-on ("_package"))
    (:file "commandGoal" :depends-on ("_package_commandGoal"))
    (:file "_package_commandGoal" :depends-on ("_package"))
    (:file "commandActionGoal" :depends-on ("_package_commandActionGoal"))
    (:file "_package_commandActionGoal" :depends-on ("_package"))
    (:file "commandFeedback" :depends-on ("_package_commandFeedback"))
    (:file "_package_commandFeedback" :depends-on ("_package"))
  ))