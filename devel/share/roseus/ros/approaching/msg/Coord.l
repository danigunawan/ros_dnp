;; Auto-generated. Do not edit!


(when (boundp 'approaching::Coord)
  (if (not (find-package "APPROACHING"))
    (make-package "APPROACHING"))
  (shadow 'Coord (find-package "APPROACHING")))
(unless (find-package "APPROACHING::COORD")
  (make-package "APPROACHING::COORD"))

(in-package "ROS")
;;//! \htmlinclude Coord.msg.html


(defclass approaching::Coord
  :super ros::object
  :slots (_x _y ))

(defmethod approaching::Coord
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

(setf (get approaching::Coord :md5sum-) "6d78a6b8c9650c754bf0432d3d1707c3")
(setf (get approaching::Coord :datatype-) "approaching/Coord")
(setf (get approaching::Coord :definition-)
      "int16 x
int16 y

")



(provide :approaching/Coord "6d78a6b8c9650c754bf0432d3d1707c3")


