; Auto-generated. Do not edit!


(cl:in-package head_pose_estimation-msg)


;//! \htmlinclude GazingInfo.msg.html

(cl:defclass <GazingInfo> (roslisp-msg-protocol:ros-message)
  ((is_gazing
    :reader is_gazing
    :initarg :is_gazing
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (coords
    :reader coords
    :initarg :coords
    :type (cl:vector head_pose_estimation-msg:Coord2D)
   :initform (cl:make-array 0 :element-type 'head_pose_estimation-msg:Coord2D :initial-element (cl:make-instance 'head_pose_estimation-msg:Coord2D))))
)

(cl:defclass GazingInfo (<GazingInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GazingInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GazingInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name head_pose_estimation-msg:<GazingInfo> is deprecated: use head_pose_estimation-msg:GazingInfo instead.")))

(cl:ensure-generic-function 'is_gazing-val :lambda-list '(m))
(cl:defmethod is_gazing-val ((m <GazingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader head_pose_estimation-msg:is_gazing-val is deprecated.  Use head_pose_estimation-msg:is_gazing instead.")
  (is_gazing m))

(cl:ensure-generic-function 'coords-val :lambda-list '(m))
(cl:defmethod coords-val ((m <GazingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader head_pose_estimation-msg:coords-val is deprecated.  Use head_pose_estimation-msg:coords instead.")
  (coords m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GazingInfo>) ostream)
  "Serializes a message object of type '<GazingInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'is_gazing))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'is_gazing))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'coords))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'coords))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GazingInfo>) istream)
  "Deserializes a message object of type '<GazingInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'is_gazing) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'is_gazing)))
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
    (cl:setf (cl:aref vals i) (cl:make-instance 'head_pose_estimation-msg:Coord2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GazingInfo>)))
  "Returns string type for a message object of type '<GazingInfo>"
  "head_pose_estimation/GazingInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GazingInfo)))
  "Returns string type for a message object of type 'GazingInfo"
  "head_pose_estimation/GazingInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GazingInfo>)))
  "Returns md5sum for a message object of type '<GazingInfo>"
  "ab56e55ea0d34f912262cded1f939fc7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GazingInfo)))
  "Returns md5sum for a message object of type 'GazingInfo"
  "ab56e55ea0d34f912262cded1f939fc7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GazingInfo>)))
  "Returns full string definition for message of type '<GazingInfo>"
  (cl:format cl:nil "bool[] is_gazing~%Coord2D[] coords~%~%================================================================================~%MSG: head_pose_estimation/Coord2D~%int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GazingInfo)))
  "Returns full string definition for message of type 'GazingInfo"
  (cl:format cl:nil "bool[] is_gazing~%Coord2D[] coords~%~%================================================================================~%MSG: head_pose_estimation/Coord2D~%int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GazingInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'is_gazing) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'coords) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GazingInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'GazingInfo
    (cl:cons ':is_gazing (is_gazing msg))
    (cl:cons ':coords (coords msg))
))
