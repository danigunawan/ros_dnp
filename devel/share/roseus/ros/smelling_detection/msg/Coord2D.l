;; Auto-generated. Do not edit!


(when (boundp 'smelling_detection::Coord2D)
  (if (not (find-package "SMELLING_DETECTION"))
    (make-package "SMELLING_DETECTION"))
  (shadow 'Coord2D (find-package "SMELLING_DETECTION")))
(unless (find-package "SMELLING_DETECTION::COORD2D")
  (make-package "SMELLING_DETECTION::COORD2D"))

(in-package "ROS")
;;//! \htmlinclude Coord2D.msg.html


(defclass smelling_detection::Coord2D
  :super ros::object
  :slots (_x _y ))

(defmethod smelling_detection::Coord2D
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; int16 _x
    2
    ;; int16 _y
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _x
       (write-word _x s)
     ;; int16 _y
       (write-word _y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _x
     (setq _x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _y
     (setq _y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get smelling_detection::Coord2D :md5sum-) "6d78a6b8c9650c754bf0432d3d1707c3")
(setf (get smelling_detection::Coord2D :datatype-) "smelling_detection/Coord2D")
(setf (get smelling_detection::Coord2D :definition-)
      "int16 x
int16 y

")



(provide :smelling_detection/Coord2D "6d78a6b8c9650c754bf0432d3d1707c3")


