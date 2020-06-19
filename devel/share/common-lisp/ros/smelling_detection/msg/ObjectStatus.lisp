; Auto-generated. Do not edit!


(cl:in-package smelling_detection-msg)


;//! \htmlinclude ObjectStatus.msg.html

(cl:defclass <ObjectStatus> (roslisp-msg-protocol:ros-message)
  ((exists
    :reader exists
    :initarg :exists
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (object_rect
    :reader object_rect
    :initarg :object_rect
    :type (cl:vector smelling_detection-msg:Rectangle)
   :initform (cl:make-array 0 :element-type 'smelling_detection-msg:Rectangle :initial-element (cl:make-instance 'smelling_detection-msg:Rectangle))))
)

(cl:defclass ObjectStatus (<ObjectStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name smelling_detection-msg:<ObjectStatus> is deprecated: use smelling_detection-msg:ObjectStatus instead.")))

(cl:ensure-generic-function 'exists-val :lambda-list '(m))
(cl:defmethod exists-val ((m <ObjectStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:exists-val is deprecated.  Use smelling_detection-msg:exists instead.")
  (exists m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <ObjectStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:objects-val is deprecated.  Use smelling_detection-msg:objects instead.")
  (objects m))

(cl:ensure-generic-function 'object_rect-val :lambda-list '(m))
(cl:defmethod object_rect-val ((m <ObjectStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smelling_detection-msg:object_rect-val is deprecated.  Use smelling_detection-msg:object_rect instead.")
  (object_rect m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectStatus>) ostream)
  "Serializes a message object of type '<ObjectStatus>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'exists))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'exists))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
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
   (cl:slot-value msg 'objects))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object_rect))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object_rect))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectStatus>) istream)
  "Deserializes a message object of type '<ObjectStatus>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'exists) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'exists)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
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
  (cl:setf (cl:slot-value msg 'object_rect) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object_rect)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'smelling_detection-msg:Rectangle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectStatus>)))
  "Returns string type for a message object of type '<ObjectStatus>"
  "smelling_detection/ObjectStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectStatus)))
  "Returns string type for a message object of type 'ObjectStatus"
  "smelling_detection/ObjectStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectStatus>)))
  "Returns md5sum for a message object of type '<ObjectStatus>"
  "ec083db445abfdb1937e2845ae57c0ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectStatus)))
  "Returns md5sum for a message object of type 'ObjectStatus"
  "ec083db445abfdb1937e2845ae57c0ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectStatus>)))
  "Returns full string definition for message of type '<ObjectStatus>"
  (cl:format cl:nil "bool[] exists~%string[] objects~%Rectangle[] object_rect~%~%================================================================================~%MSG: smelling_detection/Rectangle~%int16 x1~%int16 y1~%int16 x2~%int16 y2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectStatus)))
  "Returns full string definition for message of type 'ObjectStatus"
  (cl:format cl:nil "bool[] exists~%string[] objects~%Rectangle[] object_rect~%~%================================================================================~%MSG: smelling_detection/Rectangle~%int16 x1~%int16 y1~%int16 x2~%int16 y2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectStatus>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'exists) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object_rect) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectStatus
    (cl:cons ':exists (exists msg))
    (cl:cons ':objects (objects msg))
    (cl:cons ':object_rect (object_rect msg))
))
