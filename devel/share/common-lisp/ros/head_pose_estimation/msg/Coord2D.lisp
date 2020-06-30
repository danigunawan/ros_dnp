; Auto-generated. Do not edit!


(cl:in-package head_pose_estimation-msg)


;//! \htmlinclude Coord2D.msg.html

(cl:defclass <Coord2D> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:fixnum
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Coord2D (<Coord2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Coord2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Coord2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name head_pose_estimation-msg:<Coord2D> is deprecated: use head_pose_estimation-msg:Coord2D instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Coord2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader head_pose_estimation-msg:x-val is deprecated.  Use head_pose_estimation-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Coord2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader head_pose_estimation-msg:y-val is deprecated.  Use head_pose_estimation-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Coord2D>) ostream)
  "Serializes a message object of type '<Coord2D>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Coord2D>) istream)
  "Deserializes a message object of type '<Coord2D>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Coord2D>)))
  "Returns string type for a message object of type '<Coord2D>"
  "head_pose_estimation/Coord2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Coord2D)))
  "Returns string type for a message object of type 'Coord2D"
  "head_pose_estimation/Coord2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Coord2D>)))
  "Returns md5sum for a message object of type '<Coord2D>"
  "6d78a6b8c9650c754bf0432d3d1707c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Coord2D)))
  "Returns md5sum for a message object of type 'Coord2D"
  "6d78a6b8c9650c754bf0432d3d1707c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Coord2D>)))
  "Returns full string definition for message of type '<Coord2D>"
  (cl:format cl:nil "int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Coord2D)))
  "Returns full string definition for message of type 'Coord2D"
  (cl:format cl:nil "int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Coord2D>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Coord2D>))
  "Converts a ROS message object to a list"
  (cl:list 'Coord2D
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
