; Auto-generated. Do not edit!


(cl:in-package tfpose_ros-msg)


;//! \htmlinclude BodyPartElm.msg.html

(cl:defclass <BodyPartElm> (roslisp-msg-protocol:ros-message)
  ((part_id
    :reader part_id
    :initarg :part_id
    :type cl:integer
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (confidence
    :reader confidence
    :initarg :confidence
    :type cl:float
    :initform 0.0))
)

(cl:defclass BodyPartElm (<BodyPartElm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BodyPartElm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BodyPartElm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tfpose_ros-msg:<BodyPartElm> is deprecated: use tfpose_ros-msg:BodyPartElm instead.")))

(cl:ensure-generic-function 'part_id-val :lambda-list '(m))
(cl:defmethod part_id-val ((m <BodyPartElm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfpose_ros-msg:part_id-val is deprecated.  Use tfpose_ros-msg:part_id instead.")
  (part_id m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <BodyPartElm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfpose_ros-msg:x-val is deprecated.  Use tfpose_ros-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <BodyPartElm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfpose_ros-msg:y-val is deprecated.  Use tfpose_ros-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'confidence-val :lambda-list '(m))
(cl:defmethod confidence-val ((m <BodyPartElm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tfpose_ros-msg:confidence-val is deprecated.  Use tfpose_ros-msg:confidence instead.")
  (confidence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BodyPartElm>) ostream)
  "Serializes a message object of type '<BodyPartElm>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'part_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'part_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'part_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'part_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'confidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BodyPartElm>) istream)
  "Deserializes a message object of type '<BodyPartElm>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'part_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'part_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'part_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'part_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'confidence) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BodyPartElm>)))
  "Returns string type for a message object of type '<BodyPartElm>"
  "tfpose_ros/BodyPartElm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BodyPartElm)))
  "Returns string type for a message object of type 'BodyPartElm"
  "tfpose_ros/BodyPartElm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BodyPartElm>)))
  "Returns md5sum for a message object of type '<BodyPartElm>"
  "3c847bcc3820e970f5a4eb4a79b2b4d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BodyPartElm)))
  "Returns md5sum for a message object of type 'BodyPartElm"
  "3c847bcc3820e970f5a4eb4a79b2b4d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BodyPartElm>)))
  "Returns full string definition for message of type '<BodyPartElm>"
  (cl:format cl:nil "uint32 part_id~%float32 x~%float32 y~%float32 confidence~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BodyPartElm)))
  "Returns full string definition for message of type 'BodyPartElm"
  (cl:format cl:nil "uint32 part_id~%float32 x~%float32 y~%float32 confidence~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BodyPartElm>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BodyPartElm>))
  "Converts a ROS message object to a list"
  (cl:list 'BodyPartElm
    (cl:cons ':part_id (part_id msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':confidence (confidence msg))
))
