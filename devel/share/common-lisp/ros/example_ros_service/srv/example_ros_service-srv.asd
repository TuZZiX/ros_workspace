
(cl:in-package :asdf)

(defsystem "example_ros_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "example_server_msg" :depends-on ("_package_example_server_msg"))
    (:file "_package_example_server_msg" :depends-on ("_package"))
  ))