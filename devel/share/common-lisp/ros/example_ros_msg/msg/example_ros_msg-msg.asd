
(cl:in-package :asdf)

(defsystem "example_ros_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "example_message" :depends-on ("_package_example_message"))
    (:file "_package_example_message" :depends-on ("_package"))
  ))