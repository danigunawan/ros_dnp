;; Auto-generated. Do not edit!


(when (boundp 'smelling_detection::Rectangle)
  (if (not (find-package "SMELLING_DETECTION"))
    (make-package "SMELLING_DETECTION"))
  (shadow 'Rectangle (find-package "SMELLING_DETECTION")))
(unless (find-package "SMELLING_DETECTION::RECTANGLE")
  (make-package "SMELLING_DETECTION::RECTANGLE"))

(in-package "ROS")
;;//! \htmlinclude Rectangle.msg.html


(defclass smelling_detection::Rectangle
  :super ros::object
  :slots (_x1 _y1 _x2 _y2 ))

(defmethod smelling_detection::Rectangle
  (:init
   (&key
    ((:x1 __x1) 0)
    ((:y1 __y1) 0)
    ((:x2 __x2) 0)
    ((:y2 __y2) 0)
    )
   (send-super :init)
   (setq _x1 (round __x1))
   (setq _y1 (round __y1))
   (setq _x2 (round __x2))
   (setq _y2 (round __y2))
   self)
  (:x1
   (&optional __x1)
   (if __x1 (setq _x1 __x1)) _x1)
  (:y1
   (&optional __y1)
   (if __y1 (setq _y1 __y1)) _y1)
  (:x2
   (&optional __x2)
   (if __x2 (setq _x2 __x2)) _x2)
  (:y2
   (&optional __y2)
   (if __y2 (setq _y2 __y2)) _y2)
  (:serialization-length
   ()
   (+
    ;; int16 _x1
    2
    ;; int16 _y1
    2
    ;; int16 _x2
    2
    ;; int16 _y2
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _x1
       (write-word _x1 s)
     ;; int16 _y1
       (write-word _y1 s)
     ;; int16 _x2
       (write-word _x2 s)
     ;; int16 _y2
       (write-word _y2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _x1
     (setq _x1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _y1
     (setq _y1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _x2
     (setq _x2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _y2
     (setq _y2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get smelling_detection::Rectangle :md5sum-) "941a022bd67bae4c5b403bdabd31e17c")
(setf (get smelling_detection::Rectangle :datatype-) "smelling_detection/Rectangle")
(setf (get smelling_detection::Rectangle :definition-)
      "int16 x1
int16 y1
int16 x2
int16 y2

")



(provide :smelling_detection/Rectangle "941a022bd67bae4c5b403bdabd31e17c")


