; Auto-generated. Do not edit!


(cl:in-package smelling_detection-msg)


;//! \htmlinclude PickingInfo.msg.html

(cl:defclass <PickingInfo> (roslisp-msg-protocol:ros-message)
  ((is_pick
    :reader is_pick
    :initarg :is_pick
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (coords
    :reader coords
    :initarg :coords
    :type (cl:vector smelling_detection-msg:Coord2D)
   :initform (cl:make-array 0 :element-type 'smelling_detection-msg:Coord2D :initial-element (cl:make-instance 'smelling_detection-msg:Coord2D))))
)

(cl:defclass PickingInfo (<PickingInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickingInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickingInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name smelling_detection-msg:<PickingInfo> is deprecated: use smelling_detection-msg:PickingInfo instead.")))

(cl:ensure-generic-function 'is_pick-val :lambda-list '(m))
(cl:defmethod is_pick-val ((m <PickingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:is_pick-val is deprecated.  Use smelling_detection-msg:is_pick instead.")
  (is_pick m))

(cl:ensure-generic-function 'coords-val :lambda-list '(m))
(cl:defmethod coords-val ((m <PickingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:coords-val is deprecated.  Use smelling_detection-msg:coords instead.")
  (coords m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickingInfo>) ostream)
  "Serializes a message object of type '<PickingInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'is_pick))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'is_pick))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'coords))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'coords))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickingInfo>) istream)
  "Deserializes a message object of type '<PickingInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'is_pick) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'is_pick)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'coords) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'coords)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'smelling_detection-msg:Coord2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickingInfo>)))
  "Returns string type for a message object of type '<PickingInfo>"
  "smelling_detection/PickingInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickingInfo)))
  "Returns string type for a message object of type 'PickingInfo"
  "smelling_detection/PickingInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickingInfo>)))
  "Returns md5sum for a message object of type '<PickingInfo>"
  "4cd6626278c83bec5ea5cc54e9e1e510")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickingInfo)))
  "Returns md5sum for a message object of type 'PickingInfo"
  "4cd6626278c83bec5ea5cc54e9e1e510")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickingInfo>)))
  "Returns full string definition for message of type '<PickingInfo>"
  (cl:format cl:nil "bool[] is_pick~%Coord2D[] coords~%~%================================================================================~%MSG: smelling_detection/Coord2D~%int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickingInfo)))
  "Returns full string definition for message of type 'PickingInfo"
  (cl:format cl:nil "bool[] is_pick~%Coord2D[] coords~%~%================================================================================~%MSG: smelling_detection/Coord2D~%int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickingInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'is_pick) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'coords) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickingInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'PickingInfo
    (cl:cons ':is_pick (is_pick msg))
    (cl:cons ':coords (coords msg))
))
