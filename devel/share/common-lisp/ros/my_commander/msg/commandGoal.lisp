; Auto-generated. Do not edit!


(cl:in-package my_commander-msg)


;//! \htmlinclude commandGoal.msg.html

(cl:defclass <commandGoal> (roslisp-msg-protocol:ros-message)
  ((amplitude
    :reader amplitude
    :initarg :amplitude
    :type cl:float
    :initform 0.0)
   (frequency
    :reader frequency
    :initarg :frequency
    :type cl:float
    :initform 0.0)
   (cycles
    :reader cycles
    :initarg :cycles
    :type cl:integer
    :initform 0))
)

(cl:defclass commandGoal (<commandGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <commandGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'commandGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_commander-msg:<commandGoal> is deprecated: use my_commander-msg:commandGoal instead.")))

(cl:ensure-generic-function 'amplitude-val :lambda-list '(m))
(cl:defmethod amplitude-val ((m <commandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-msg:amplitude-val is deprecated.  Use my_commander-msg:amplitude instead.")
  (amplitude m))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <commandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-msg:frequency-val is deprecated.  Use my_commander-msg:frequency instead.")
  (frequency m))

(cl:ensure-generic-function 'cycles-val :lambda-list '(m))
(cl:defmethod cycles-val ((m <commandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_commander-msg:cycles-val is deprecated.  Use my_commander-msg:cycles instead.")
  (cycles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <commandGoal>) ostream)
  "Serializes a message object of type '<commandGoal>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cycles)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cycles)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'cycles)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'cycles)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <commandGoal>) istream)
  "Deserializes a message object of type '<commandGoal>"
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cycles)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cycles)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'cycles)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'cycles)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<commandGoal>)))
  "Returns string type for a message object of type '<commandGoal>"
  "my_commander/commandGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'commandGoal)))
  "Returns string type for a message object of type 'commandGoal"
  "my_commander/commandGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<commandGoal>)))
  "Returns md5sum for a message object of type '<commandGoal>"
  "53cd9af5df1979f7569a863ed25939dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'commandGoal)))
  "Returns md5sum for a message object of type 'commandGoal"
  "53cd9af5df1979f7569a863ed25939dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<commandGoal>)))
  "Returns full string definition for message of type '<commandGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#Goal messages~%float64 amplitude	#magnitude of the sine wave~%float64 frequency	#frequency of the sine wave~%uint32 cycles		#numbers of cycles to run~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'commandGoal)))
  "Returns full string definition for message of type 'commandGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#Goal messages~%float64 amplitude	#magnitude of the sine wave~%float64 frequency	#frequency of the sine wave~%uint32 cycles		#numbers of cycles to run~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <commandGoal>))
  (cl:+ 0
     8
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <commandGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'commandGoal
    (cl:cons ':amplitude (amplitude msg))
    (cl:cons ':frequency (frequency msg))
    (cl:cons ':cycles (cycles msg))
))
