; Auto-generated. Do not edit!


(cl:in-package example_ros_service-srv)


;//! \htmlinclude example_server_msg-request.msg.html

(cl:defclass <example_server_msg-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass example_server_msg-request (<example_server_msg-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <example_server_msg-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'example_server_msg-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name example_ros_service-srv:<example_server_msg-request> is deprecated: use example_ros_service-srv:example_server_msg-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <example_server_msg-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_service-srv:name-val is deprecated.  Use example_ros_service-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <example_server_msg-request>) ostream)
  "Serializes a message object of type '<example_server_msg-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <example_server_msg-request>) istream)
  "Deserializes a message object of type '<example_server_msg-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<example_server_msg-request>)))
  "Returns string type for a service object of type '<example_server_msg-request>"
  "example_ros_service/example_server_msgRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'example_server_msg-request)))
  "Returns string type for a service object of type 'example_server_msg-request"
  "example_ros_service/example_server_msgRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<example_server_msg-request>)))
  "Returns md5sum for a message object of type '<example_server_msg-request>"
  "f97a354dfffac1c8b57b631851a700a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'example_server_msg-request)))
  "Returns md5sum for a message object of type 'example_server_msg-request"
  "f97a354dfffac1c8b57b631851a700a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<example_server_msg-request>)))
  "Returns full string definition for message of type '<example_server_msg-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'example_server_msg-request)))
  "Returns full string definition for message of type 'example_server_msg-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <example_server_msg-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <example_server_msg-request>))
  "Converts a ROS message object to a list"
  (cl:list 'example_server_msg-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude example_server_msg-response.msg.html

(cl:defclass <example_server_msg-response> (roslisp-msg-protocol:ros-message)
  ((on_the_list
    :reader on_the_list
    :initarg :on_the_list
    :type cl:boolean
    :initform cl:nil)
   (good_guy
    :reader good_guy
    :initarg :good_guy
    :type cl:boolean
    :initform cl:nil)
   (age
    :reader age
    :initarg :age
    :type cl:integer
    :initform 0)
   (nickname
    :reader nickname
    :initarg :nickname
    :type cl:string
    :initform ""))
)

(cl:defclass example_server_msg-response (<example_server_msg-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <example_server_msg-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'example_server_msg-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name example_ros_service-srv:<example_server_msg-response> is deprecated: use example_ros_service-srv:example_server_msg-response instead.")))

(cl:ensure-generic-function 'on_the_list-val :lambda-list '(m))
(cl:defmethod on_the_list-val ((m <example_server_msg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_service-srv:on_the_list-val is deprecated.  Use example_ros_service-srv:on_the_list instead.")
  (on_the_list m))

(cl:ensure-generic-function 'good_guy-val :lambda-list '(m))
(cl:defmethod good_guy-val ((m <example_server_msg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_service-srv:good_guy-val is deprecated.  Use example_ros_service-srv:good_guy instead.")
  (good_guy m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <example_server_msg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_service-srv:age-val is deprecated.  Use example_ros_service-srv:age instead.")
  (age m))

(cl:ensure-generic-function 'nickname-val :lambda-list '(m))
(cl:defmethod nickname-val ((m <example_server_msg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader example_ros_service-srv:nickname-val is deprecated.  Use example_ros_service-srv:nickname instead.")
  (nickname m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <example_server_msg-response>) ostream)
  "Serializes a message object of type '<example_server_msg-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on_the_list) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'good_guy) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'age)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nickname))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nickname))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <example_server_msg-response>) istream)
  "Deserializes a message object of type '<example_server_msg-response>"
    (cl:setf (cl:slot-value msg 'on_the_list) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'good_guy) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'age) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nickname) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nickname) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<example_server_msg-response>)))
  "Returns string type for a service object of type '<example_server_msg-response>"
  "example_ros_service/example_server_msgResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'example_server_msg-response)))
  "Returns string type for a service object of type 'example_server_msg-response"
  "example_ros_service/example_server_msgResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<example_server_msg-response>)))
  "Returns md5sum for a message object of type '<example_server_msg-response>"
  "f97a354dfffac1c8b57b631851a700a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'example_server_msg-response)))
  "Returns md5sum for a message object of type 'example_server_msg-response"
  "f97a354dfffac1c8b57b631851a700a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<example_server_msg-response>)))
  "Returns full string definition for message of type '<example_server_msg-response>"
  (cl:format cl:nil "bool on_the_list~%bool good_guy~%int32 age~%string nickname~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'example_server_msg-response)))
  "Returns full string definition for message of type 'example_server_msg-response"
  (cl:format cl:nil "bool on_the_list~%bool good_guy~%int32 age~%string nickname~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <example_server_msg-response>))
  (cl:+ 0
     1
     1
     4
     4 (cl:length (cl:slot-value msg 'nickname))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <example_server_msg-response>))
  "Converts a ROS message object to a list"
  (cl:list 'example_server_msg-response
    (cl:cons ':on_the_list (on_the_list msg))
    (cl:cons ':good_guy (good_guy msg))
    (cl:cons ':age (age msg))
    (cl:cons ':nickname (nickname msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'example_server_msg)))
  'example_server_msg-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'example_server_msg)))
  'example_server_msg-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'example_server_msg)))
  "Returns string type for a service object of type '<example_server_msg>"
  "example_ros_service/example_server_msg")