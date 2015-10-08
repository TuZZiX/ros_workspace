; Auto-generated. Do not edit!


(cl:in-package my_commander-msg)


;//! \htmlinclude action_commandGoal.msg.html

(cl:defclass <action_commandGoal> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:boolean
    :initform cl:nil)
   (amplitude
    :reader amplitude
    :initarg :amplitude
    :type cl:float
    :initform 0.0)
   (frequency
    :reader frequency
    :initarg :frequency
    :type cl:float
    :initform 0.0))
)

(cl:defclass action_commandGoal (<action_commandGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <action_commandGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'action_commandGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_commander-msg:<action_commandGoal> is deprecated: use my_commander-msg:action_commandGoal instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <action_commandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-msg:start-val is deprecated.  Use my_commander-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'amplitude-val :lambda-list '(m))
(cl:defmethod amplitude-val ((m <action_commandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-msg:amplitude-val is deprecated.  Use my_commander-msg:amplitude instead.")
  (amplitude m))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <action_commandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-msg:frequency-val is deprecated.  Use my_commander-msg:frequency instead.")
  (frequency m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <action_commandGoal>) ostream)
  "Serializes a message object of type '<action_commandGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'amplitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <action_commandGoal>) istream)
  "Deserializes a message object of type '<action_commandGoal>"
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
    (cl:setf (cl:slot-value msg 'amplitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frequency) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<action_commandGoal>)))
  "Returns string type for a message object of type '<action_commandGoal>"
  "my_commander/action_commandGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'action_commandGoal)))
  "Returns string type for a message object of type 'action_commandGoal"
  "my_commander/action_commandGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<action_commandGoal>)))
  "Returns md5sum for a message object of type '<action_commandGoal>"
  "052e3b1c760a0b55150a984e9cb579f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'action_commandGoal)))
  "Returns md5sum for a message object of type 'action_commandGoal"
  "052e3b1c760a0b55150a984e9cb579f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<action_commandGoal>)))
  "Returns full string definition for message of type '<action_commandGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%bool start~%float64 amplitude~%float64 frequency~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'action_commandGoal)))
  "Returns full string definition for message of type 'action_commandGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%bool start~%float64 amplitude~%float64 frequency~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <action_commandGoal>))
  (cl:+ 0
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <action_commandGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'action_commandGoal
    (cl:cons ':start (start msg))
    (cl:cons ':amplitude (amplitude msg))
    (cl:cons ':frequency (frequency msg))
))
