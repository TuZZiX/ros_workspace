; Auto-generated. Do not edit!


(cl:in-package cwru_srv-srv)


;//! \htmlinclude simple_bool_service_message-request.msg.html

(cl:defclass <simple_bool_service_message-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass simple_bool_service_message-request (<simple_bool_service_message-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <simple_bool_service_message-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'simple_bool_service_message-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<simple_bool_service_message-request> is deprecated: use cwru_srv-srv:simple_bool_service_message-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <simple_bool_service_message-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:req-val is deprecated.  Use cwru_srv-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <simple_bool_service_message-request>) ostream)
  "Serializes a message object of type '<simple_bool_service_message-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <simple_bool_service_message-request>) istream)
  "Deserializes a message object of type '<simple_bool_service_message-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<simple_bool_service_message-request>)))
  "Returns string type for a service object of type '<simple_bool_service_message-request>"
  "cwru_srv/simple_bool_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_bool_service_message-request)))
  "Returns string type for a service object of type 'simple_bool_service_message-request"
  "cwru_srv/simple_bool_service_messageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<simple_bool_service_message-request>)))
  "Returns md5sum for a message object of type '<simple_bool_service_message-request>"
  "c42a7ecd5bbbf1290f8a630b218058f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'simple_bool_service_message-request)))
  "Returns md5sum for a message object of type 'simple_bool_service_message-request"
  "c42a7ecd5bbbf1290f8a630b218058f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<simple_bool_service_message-request>)))
  "Returns full string definition for message of type '<simple_bool_service_message-request>"
  (cl:format cl:nil "bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'simple_bool_service_message-request)))
  "Returns full string definition for message of type 'simple_bool_service_message-request"
  (cl:format cl:nil "bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <simple_bool_service_message-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <simple_bool_service_message-request>))
  "Converts a ROS message object to a list"
  (cl:list 'simple_bool_service_message-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude simple_bool_service_message-response.msg.html

(cl:defclass <simple_bool_service_message-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass simple_bool_service_message-response (<simple_bool_service_message-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <simple_bool_service_message-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'simple_bool_service_message-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_srv-srv:<simple_bool_service_message-response> is deprecated: use cwru_srv-srv:simple_bool_service_message-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <simple_bool_service_message-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_srv-srv:resp-val is deprecated.  Use cwru_srv-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <simple_bool_service_message-response>) ostream)
  "Serializes a message object of type '<simple_bool_service_message-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resp) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <simple_bool_service_message-response>) istream)
  "Deserializes a message object of type '<simple_bool_service_message-response>"
    (cl:setf (cl:slot-value msg 'resp) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<simple_bool_service_message-response>)))
  "Returns string type for a service object of type '<simple_bool_service_message-response>"
  "cwru_srv/simple_bool_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_bool_service_message-response)))
  "Returns string type for a service object of type 'simple_bool_service_message-response"
  "cwru_srv/simple_bool_service_messageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<simple_bool_service_message-response>)))
  "Returns md5sum for a message object of type '<simple_bool_service_message-response>"
  "c42a7ecd5bbbf1290f8a630b218058f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'simple_bool_service_message-response)))
  "Returns md5sum for a message object of type 'simple_bool_service_message-response"
  "c42a7ecd5bbbf1290f8a630b218058f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<simple_bool_service_message-response>)))
  "Returns full string definition for message of type '<simple_bool_service_message-response>"
  (cl:format cl:nil "bool resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'simple_bool_service_message-response)))
  "Returns full string definition for message of type 'simple_bool_service_message-response"
  (cl:format cl:nil "bool resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <simple_bool_service_message-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <simple_bool_service_message-response>))
  "Converts a ROS message object to a list"
  (cl:list 'simple_bool_service_message-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'simple_bool_service_message)))
  'simple_bool_service_message-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'simple_bool_service_message)))
  'simple_bool_service_message-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_bool_service_message)))
  "Returns string type for a service object of type '<simple_bool_service_message>"
  "cwru_srv/simple_bool_service_message")