; Auto-generated. Do not edit!


(cl:in-package my_commander-srv)


;//! \htmlinclude interface_cmd-request.msg.html

(cl:defclass <interface_cmd-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:boolean
    :initform cl:nil)
   (amp_cmd
    :reader amp_cmd
    :initarg :amp_cmd
    :type cl:float
    :initform 0.0)
   (feq_cmd
    :reader feq_cmd
    :initarg :feq_cmd
    :type cl:float
    :initform 0.0))
)

(cl:defclass interface_cmd-request (<interface_cmd-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <interface_cmd-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'interface_cmd-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_commander-srv:<interface_cmd-request> is deprecated: use my_commander-srv:interface_cmd-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <interface_cmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-srv:start-val is deprecated.  Use my_commander-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'amp_cmd-val :lambda-list '(m))
(cl:defmethod amp_cmd-val ((m <interface_cmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-srv:amp_cmd-val is deprecated.  Use my_commander-srv:amp_cmd instead.")
  (amp_cmd m))

(cl:ensure-generic-function 'feq_cmd-val :lambda-list '(m))
(cl:defmethod feq_cmd-val ((m <interface_cmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-srv:feq_cmd-val is deprecated.  Use my_commander-srv:feq_cmd instead.")
  (feq_cmd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <interface_cmd-request>) ostream)
  "Serializes a message object of type '<interface_cmd-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'amp_cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'feq_cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <interface_cmd-request>) istream)
  "Deserializes a message object of type '<interface_cmd-request>"
    (cl:setf (cl:slot-value msg 'start) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'amp_cmd) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'feq_cmd) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<interface_cmd-request>)))
  "Returns string type for a service object of type '<interface_cmd-request>"
  "my_commander/interface_cmdRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'interface_cmd-request)))
  "Returns string type for a service object of type 'interface_cmd-request"
  "my_commander/interface_cmdRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<interface_cmd-request>)))
  "Returns md5sum for a message object of type '<interface_cmd-request>"
  "ece6299263d227b65ea798b52ee8ac88")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'interface_cmd-request)))
  "Returns md5sum for a message object of type 'interface_cmd-request"
  "ece6299263d227b65ea798b52ee8ac88")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<interface_cmd-request>)))
  "Returns full string definition for message of type '<interface_cmd-request>"
  (cl:format cl:nil "bool start~%float64 amp_cmd~%float64 feq_cmd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'interface_cmd-request)))
  "Returns full string definition for message of type 'interface_cmd-request"
  (cl:format cl:nil "bool start~%float64 amp_cmd~%float64 feq_cmd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <interface_cmd-request>))
  (cl:+ 0
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <interface_cmd-request>))
  "Converts a ROS message object to a list"
  (cl:list 'interface_cmd-request
    (cl:cons ':start (start msg))
    (cl:cons ':amp_cmd (amp_cmd msg))
    (cl:cons ':feq_cmd (feq_cmd msg))
))
;//! \htmlinclude interface_cmd-response.msg.html

(cl:defclass <interface_cmd-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass interface_cmd-response (<interface_cmd-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <interface_cmd-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'interface_cmd-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_commander-srv:<interface_cmd-response> is deprecated: use my_commander-srv:interface_cmd-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <interface_cmd-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-srv:success-val is deprecated.  Use my_commander-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <interface_cmd-response>) ostream)
  "Serializes a message object of type '<interface_cmd-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <interface_cmd-response>) istream)
  "Deserializes a message object of type '<interface_cmd-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<interface_cmd-response>)))
  "Returns string type for a service object of type '<interface_cmd-response>"
  "my_commander/interface_cmdResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'interface_cmd-response)))
  "Returns string type for a service object of type 'interface_cmd-response"
  "my_commander/interface_cmdResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<interface_cmd-response>)))
  "Returns md5sum for a message object of type '<interface_cmd-response>"
  "ece6299263d227b65ea798b52ee8ac88")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'interface_cmd-response)))
  "Returns md5sum for a message object of type 'interface_cmd-response"
  "ece6299263d227b65ea798b52ee8ac88")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<interface_cmd-response>)))
  "Returns full string definition for message of type '<interface_cmd-response>"
  (cl:format cl:nil "bool success~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'interface_cmd-response)))
  "Returns full string definition for message of type 'interface_cmd-response"
  (cl:format cl:nil "bool success~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <interface_cmd-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <interface_cmd-response>))
  "Converts a ROS message object to a list"
  (cl:list 'interface_cmd-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'interface_cmd)))
  'interface_cmd-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'interface_cmd)))
  'interface_cmd-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'interface_cmd)))
  "Returns string type for a service object of type '<interface_cmd>"
  "my_commander/interface_cmd")