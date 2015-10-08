
(cl:in-package :asdf)

(defsystem "my_commander-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "interface_cmd" :depends-on ("_package_interface_cmd"))
    (:file "_package_interface_cmd" :depends-on ("_package"))
  ))