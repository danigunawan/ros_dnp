;; Auto-generated. Do not edit!


(when (boundp 'tfpose_ros::BodyPartElm)
  (if (not (find-package "TFPOSE_ROS"))
    (make-package "TFPOSE_ROS"))
  (shadow 'BodyPartElm (find-package "TFPOSE_ROS")))
(unless (find-package "TFPOSE_ROS::BODYPARTELM")
  (make-package "TFPOSE_ROS::BODYPARTELM"))

(in-package "ROS")
;;//! \htmlinclude BodyPartElm.msg.html


(defclass tfpose_ros::BodyPartElm
  :super ros::object
  :slots (_part_id _x _y _confidence ))

(defmethod tfpose_ros::BodyPartElm
  (:init
   (&key
    ((:part_id __part_id) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:confidence __confidence) 0.0)
    )
   (send-super :init)
   (setq _part_id (round __part_id))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _confidence (float __confidence))
   self)
  (:part_id
   (&optional __part_id)
   (if __part_id (setq _part_id __part_id)) _part_id)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; uint32 _part_id
    4
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _confidence
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _part_id
       (write-long _part_id s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _part_id
     (setq _part_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get tfpose_ros::BodyPartElm :md5sum-) "3c847bcc3820e970f5a4eb4a79b2b4d7")
(setf (get tfpose_ros::BodyPartElm :datatype-) "tfpose_ros/BodyPartElm")
(setf (get tfpose_ros::BodyPartElm :definition-)
      "uint32 part_id
float32 x
float32 y
float32 confidence
")



(provide :tfpose_ros/BodyPartElm "3c847bcc3820e970f5a4eb4a79b2b4d7")


