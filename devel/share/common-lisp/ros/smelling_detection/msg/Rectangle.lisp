; Auto-generated. Do not edit!


(cl:in-package smelling_detection-msg)


;//! \htmlinclude Rectangle.msg.html

(cl:defclass <Rectangle> (roslisp-msg-protocol:ros-message)
  ((x1
    :reader x1
    :initarg :x1
    :type cl:fixnum
    :initform 0)
   (y1
    :reader y1
    :initarg :y1
    :type cl:fixnum
    :initform 0)
   (x2
    :reader x2
    :initarg :x2
    :type cl:fixnum
    :initform 0)
   (y2
    :reader y2
    :initarg :y2
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Rectangle (<Rectangle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Rectangle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Rectangle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name smelling_detection-msg:<Rectangle> is deprecated: use smelling_detection-msg:Rectangle instead.")))

(cl:ensure-generic-function 'x1-val :lambda-list '(m))
(cl:defmethod x1-val ((m <Rectangle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:x1-val is deprecated.  Use smelling_detection-msg:x1 instead.")
  (x1 m))

(cl:ensure-generic-function 'y1-val :lambda-list '(m))
(cl:defmethod y1-val ((m <Rectangle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:y1-val is deprecated.  Use smelling_detection-msg:y1 instead.")
  (y1 m))

(cl:ensure-generic-function 'x2-val :lambda-list '(m))
(cl:defmethod x2-val ((m <Rectangle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:x2-val is deprecated.  Use smelling_detection-msg:x2 instead.")
  (x2 m))

(cl:ensure-generic-function 'y2-val :lambda-list '(m))
(cl:defmethod y2-val ((m <Rectangle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:y2-val is deprecated.  Use smelling_detection-msg:y2 instead.")
  (y2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Rectangle>) ostream)
  "Serializes a message object of type '<Rectangle>"
  (cl:let* ((signed (cl:slot-value msg 'x1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Rectangle>) istream)
  "Deserializes a message object of type '<Rectangle>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Rectangle>)))
  "Returns string type for a message object of type '<Rectangle>"
  "smelling_detection/Rectangle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rectangle)))
  "Returns string type for a message object of type 'Rectangle"
  "smelling_detection/Rectangle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Rectangle>)))
  "Returns md5sum for a message object of type '<Rectangle>"
  "941a022bd67bae4c5b403bdabd31e17c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Rectangle)))
  "Returns md5sum for a message object of type 'Rectangle"
  "941a022bd67bae4c5b403bdabd31e17c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Rectangle>)))
  "Returns full string definition for message of type '<Rectangle>"
  (cl:format cl:nil "int16 x1~%int16 y1~%int16 x2~%int16 y2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Rectangle)))
  "Returns full string definition for message of type 'Rectangle"
  (cl:format cl:nil "int16 x1~%int16 y1~%int16 x2~%int16 y2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Rectangle>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Rectangle>))
  "Converts a ROS message object to a list"
  (cl:list 'Rectangle
    (cl:cons ':x1 (x1 msg))
    (cl:cons ':y1 (y1 msg))
    (cl:cons ':x2 (x2 msg))
    (cl:cons ':y2 (y2 msg))
))
