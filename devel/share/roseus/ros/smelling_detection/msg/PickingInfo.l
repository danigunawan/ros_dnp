;; Auto-generated. Do not edit!


(when (boundp 'smelling_detection::PickingInfo)
  (if (not (find-package "SMELLING_DETECTION"))
    (make-package "SMELLING_DETECTION"))
  (shadow 'PickingInfo (find-package "SMELLING_DETECTION")))
(unless (find-package "SMELLING_DETECTION::PICKINGINFO")
  (make-package "SMELLING_DETECTION::PICKINGINFO"))

(in-package "ROS")
;;//! \htmlinclude PickingInfo.msg.html


(defclass smelling_detection::PickingInfo
  :super ros::object
  :slots (_is_pick _coords ))

(defmethod smelling_detection::PickingInfo
  (:init
   (&key
    ((:is_pick __is_pick) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:coords __coords) (let (r) (dotimes (i 0) (push (instance smelling_detection::Coord2D :init) r)) r))
    )
   (send-super :init)
   (setq _is_pick __is_pick)
   (setq _coords __coords)
   self)
  (:is_pick
   (&optional __is_pick)
   (if __is_pick (setq _is_pick __is_pick)) _is_pick)
  (:coords
   (&rest __coords)
   (if (keywordp (car __coords))
       (send* _coords __coords)
     (progn
       (if __coords (setq _coords (car __coords)))
       _coords)))
  (:serialization-length
   ()
   (+
    ;; bool[] _is_pick
    (* 1    (length _is_pick)) 4
    ;; smelling_detection/Coord2D[] _coords
    (apply #'+ (send-all _coords :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _is_pick
     (write-long (length _is_pick) s)
     (dotimes (i (length _is_pick))
       (if (elt _is_pick i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; smelling_detection/Coord2D[] _coords
     (write-long (length _coords) s)
     (dolist (elem _coords)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _is_pick
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _is_pick (make-list n))
     (dotimes (i n)
     (setf (elt _is_pick i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; smelling_detection/Coord2D[] _coords
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coords (let (r) (dotimes (i n) (push (instance smelling_detection::Coord2D :init) r)) r))
     (dolist (elem- _coords)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get smelling_detection::PickingInfo :md5sum-) "4cd6626278c83bec5ea5cc54e9e1e510")
(setf (get smelling_detection::PickingInfo :datatype-) "smelling_detection/PickingInfo")
(setf (get smelling_detection::PickingInfo :definition-)
      "bool[] is_pick
Coord2D[] coords

================================================================================
MSG: smelling_detection/Coord2D
int16 x
int16 y

")



(provide :smelling_detection/PickingInfo "4cd6626278c83bec5ea5cc54e9e1e510")


