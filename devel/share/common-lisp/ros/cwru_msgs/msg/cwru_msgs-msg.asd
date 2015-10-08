
(cl:in-package :asdf)

(defsystem "cwru_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Pose" :depends-on ("_package_Pose"))
    (:file "_package_Pose" :depends-on ("_package"))
    (:file "DesiredState" :depends-on ("_package_DesiredState"))
    (:file "_package_DesiredState" :depends-on ("_package"))
    (:file "NavSatStatus" :depends-on ("_package_NavSatStatus"))
    (:file "_package_NavSatStatus" :depends-on ("_package"))
    (:file "PathSegment" :depends-on ("_package_PathSegment"))
    (:file "_package_PathSegment" :depends-on ("_package"))
    (:file "cRIOSensors" :depends-on ("_package_cRIOSensors"))
    (:file "_package_cRIOSensors" :depends-on ("_package"))
    (:file "Path" :depends-on ("_package_Path"))
    (:file "_package_Path" :depends-on ("_package"))
    (:file "Sonar" :depends-on ("_package_Sonar"))
    (:file "_package_Sonar" :depends-on ("_package"))
    (:file "PowerState" :depends-on ("_package_PowerState"))
    (:file "_package_PowerState" :depends-on ("_package"))
    (:file "ErrorCode" :depends-on ("_package_ErrorCode"))
    (:file "_package_ErrorCode" :depends-on ("_package"))
    (:file "NavSatFix" :depends-on ("_package_NavSatFix"))
    (:file "_package_NavSatFix" :depends-on ("_package"))
  ))