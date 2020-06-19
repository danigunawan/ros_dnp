;; Auto-generated. Do not edit!


(when (boundp 'smelling_detection::ObjectStatus)
  (if (not (find-package "SMELLING_DETECTION"))
    (make-package "SMELLING_DETECTION"))
  (shadow 'ObjectStatus (find-package "SMELLING_DETECTION")))
(unless (find-package "SMELLING_DETECTION::OBJECTSTATUS")
  (make-package "SMELLING_DETECTION::OBJECTSTATUS"))

(in-package "ROS")
;;//! \htmlinclude ObjectStatus.msg.html


(defclass smelling_detection::ObjectStatus
  :super ros::object
  :slots (_exists _objects _object_rect ))

(defmethod smelling_detection::ObjectStatus
  (:init
   (&key
    ((:exists __exists) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:objects __objects) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:object_rect __object_rect) (let (r) (dotimes (i 0) (push (instance smelling_detection::Rectangle :init) r)) r))
    )
   (send-super :init)
   (setq _exists __exists)
   (setq _objects __objects)
   (setq _object_rect __object_rect)
   self)
  (:exists
   (&optional __exists)
   (if __exists (setq _exists __exists)) _exists)
  (:objects
   (&optional __objects)
   (if __objects (setq _objects __objects)) _objects)
  (:object_rect
   (&rest __object_rect)
   (if (keywordp (car __object_rect))
       (send* _object_rect __object_rect)
     (progn
       (if __object_rect (setq _object_rect (car __object_rect)))
       _object_rect)))
  (:serialization-length
   ()
   (+
    ;; bool[] _exists
    (* 1    (length _exists)) 4
    ;; string[] _objects
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _objects)) 4
    ;; smelling_detection/Rectangle[] _object_rect
    (apply #'+ (send-all _object_rect :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _exists
     (write-long (length _exists) s)
     (dotimes (i (length _exists))
       (if (elt _exists i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; string[] _objects
     (write-long (length _objects) s)
     (dolist (elem _objects)
       (write-long (length elem) s) (princ elem s)
       )
     ;; smelling_detection/Rectangle[] _object_rect
     (write-long (length _object_rect) s)
     (dolist (elem _object_rect)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _exists
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _exists (make-list n))
     (dotimes (i n)
     (setf (elt _exists i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; string[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _objects i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; smelling_detection/Rectangle[] _object_rect
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_rect (let (r) (dotimes (i n) (push (instance smelling_detection::Rectangle :init) r)) r))
     (dolist (elem- _object_rect)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get smelling_detection::ObjectStatus :md5sum-) "ec083db445abfdb1937e2845ae57c0ea")
(setf (get smelling_detection::ObjectStatus :datatype-) "smelling_detection/ObjectStatus")
(setf (get smelling_detection::ObjectStatus :definition-)
      "bool[] exists
string[] objects
Rectangle[] object_rect

================================================================================
MSG: smelling_detection/Rectangle
int16 x1
int16 y1
int16 x2
int16 y2

")



(provide :smelling_detection/ObjectStatus "ec083db445abfdb1937e2845ae57c0ea")


