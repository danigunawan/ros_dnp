; Auto-generated. Do not edit!


(cl:in-package approaching-msg)


;//! \htmlinclude ApproachInfo.msg.html

(cl:defclass <ApproachInfo> (roslisp-msg-protocol:ros-message)
  ((ids
    :reader ids
    :initarg :ids
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (coords
    :reader coords
    :initarg :coords
    :type (cl:vector approaching-msg:Coord)
   :initform (cl:make-array 0 :element-type 'approaching-msg:Coord :initial-element (cl:make-instance 'approaching-msg:Coord)))
   (dists
    :reader dists
    :initarg :dists
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ApproachInfo (<ApproachInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ApproachInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ApproachInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name approaching-msg:<ApproachInfo> is deprecated: use approaching-msg:ApproachInfo instead.")))

(cl:ensure-generic-function 'ids-val :lambda-list '(m))
(cl:defmethod ids-val ((m <ApproachInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader approaching-msg:ids-val is deprecated.  Use approaching-msg:ids instead.")
  (ids m))

(cl:ensure-generic-function 'coords-val :lambda-list '(m))
(cl:defmethod coords-val ((m <ApproachInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader approaching-msg:coords-val is deprecated.  Use approaching-msg:coords instead.")
  (coords m))

(cl:ensure-generic-function 'dists-val :lambda-list '(m))
(cl:defmethod dists-val ((m <ApproachInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader approaching-msg:dists-val is deprecated.  Use approaching-msg:dists instead.")
  (dists m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ApproachInfo>) ostream)
  "Serializes a message object of type '<ApproachInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'ids))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'coords))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'coords))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'dists))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'dists))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ApproachInfo>) istream)
  "Deserializes a message object of type '<ApproachInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'coords) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'coords)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'approaching-msg:Coord))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'dists) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'dists)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ApproachInfo>)))
  "Returns string type for a message object of type '<ApproachInfo>"
  "approaching/ApproachInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ApproachInfo)))
  "Returns string type for a message object of type 'ApproachInfo"
  "approaching/ApproachInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ApproachInfo>)))
  "Returns md5sum for a message object of type '<ApproachInfo>"
  "f6fccf8aff213da9b738fdf6be5c98c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ApproachInfo)))
  "Returns md5sum for a message object of type 'ApproachInfo"
  "f6fccf8aff213da9b738fdf6be5c98c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ApproachInfo>)))
  "Returns full string definition for message of type '<ApproachInfo>"
  (cl:format cl:nil "string[] ids~%Coord[] coords~%float32[] dists~%~%================================================================================~%MSG: approaching/Coord~%int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ApproachInfo)))
  "Returns full string definition for message of type 'ApproachInfo"
  (cl:format cl:nil "string[] ids~%Coord[] coords~%float32[] dists~%~%================================================================================~%MSG: approaching/Coord~%int16 x~%int16 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ApproachInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'coords) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'dists) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ApproachInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'ApproachInfo
    (cl:cons ':ids (ids msg))
    (cl:cons ':coords (coords msg))
    (cl:cons ':dists (dists msg))
))
