; Auto-generated. Do not edit!


(cl:in-package cwru_msgs-msg)


;//! \htmlinclude ErrorCode.msg.html

(cl:defclass <ErrorCode> (roslisp-msg-protocol:ros-message)
  ((val
    :reader val
    :initarg :val
    :type cl:integer
    :initform 0))
)

(cl:defclass ErrorCode (<ErrorCode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ErrorCode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ErrorCode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cwru_msgs-msg:<ErrorCode> is deprecated: use cwru_msgs-msg:ErrorCode instead.")))

(cl:ensure-generic-function 'val-val :lambda-list '(m))
(cl:defmethod val-val ((m <ErrorCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cwru_msgs-msg:val-val is deprecated.  Use cwru_msgs-msg:val instead.")
  (val m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ErrorCode>)))
    "Constants for message type '<ErrorCode>"
  '((:PLANNING_FAILED . -1)
    (:SUCCESS . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ErrorCode)))
    "Constants for message type 'ErrorCode"
  '((:PLANNING_FAILED . -1)
    (:SUCCESS . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ErrorCode>) ostream)
  "Serializes a message object of type '<ErrorCode>"
  (cl:let* ((signed (cl:slot-value msg 'val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ErrorCode>) istream)
  "Deserializes a message object of type '<ErrorCode>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ErrorCode>)))
  "Returns string type for a message object of type '<ErrorCode>"
  "cwru_msgs/ErrorCode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ErrorCode)))
  "Returns string type for a message object of type 'ErrorCode"
  "cwru_msgs/ErrorCode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ErrorCode>)))
  "Returns md5sum for a message object of type '<ErrorCode>"
  "c82f63c84d402abe94fbefc7f5feebf6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ErrorCode)))
  "Returns md5sum for a message object of type 'ErrorCode"
  "c82f63c84d402abe94fbefc7f5feebf6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ErrorCode>)))
  "Returns full string definition for message of type '<ErrorCode>"
  (cl:format cl:nil "int32 PLANNING_FAILED=-1~%int32 SUCCESS=1~%int32 val~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ErrorCode)))
  "Returns full string definition for message of type 'ErrorCode"
  (cl:format cl:nil "int32 PLANNING_FAILED=-1~%int32 SUCCESS=1~%int32 val~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ErrorCode>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ErrorCode>))
  "Converts a ROS message object to a list"
  (cl:list 'ErrorCode
    (cl:cons ':val (val msg))
))
