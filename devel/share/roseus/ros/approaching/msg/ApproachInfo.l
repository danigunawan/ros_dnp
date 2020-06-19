;; Auto-generated. Do not edit!


(when (boundp 'approaching::ApproachInfo)
  (if (not (find-package "APPROACHING"))
    (make-package "APPROACHING"))
  (shadow 'ApproachInfo (find-package "APPROACHING")))
(unless (find-package "APPROACHING::APPROACHINFO")
  (make-package "APPROACHING::APPROACHINFO"))

(in-package "ROS")
;;//! \htmlinclude ApproachInfo.msg.html


(defclass approaching::ApproachInfo
  :super ros::object
  :slots (_ids _coords _dists ))

(defmethod approaching::ApproachInfo
  (:init
   (&key
    ((:ids __ids) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:coords __coords) (let (r) (dotimes (i 0) (push (instance approaching::Coord :init) r)) r))
    ((:dists __dists) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _ids __ids)
   (setq _coords __coords)
   (setq _dists __dists)
   self)
  (:ids
   (&optional __ids)
   (if __ids (setq _ids __ids)) _ids)
  (:coords
   (&rest __coords)
   (if (keywordp (car __coords))
       (send* _coords __coords)
     (progn
       (if __coords (setq _coords (car __coords)))
       _coords)))
  (:dists
   (&optional __dists)
   (if __dists (setq _dists __dists)) _dists)
  (:serialization-length
   ()
   (+
    ;; string[] _ids
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _ids)) 4
    ;; approaching/Coord[] _coords
    (apply #'+ (send-all _coords :serialization-length)) 4
    ;; float32[] _dists
    (* 4    (length _dists)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _ids
     (write-long (length _ids) s)
     (dolist (elem _ids)
       (write-long (length elem) s) (princ elem s)
       )
     ;; approaching/Coord[] _coords
     (write-long (length _coords) s)
     (dolist (elem _coords)
       (send elem :serialize s)
       )
     ;; float32[] _dists
     (write-long (length _dists) s)
     (dotimes (i (length _dists))
       (sys::poke (elt _dists i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ids (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _ids i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; approaching/Coord[] _coords
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coords (let (r) (dotimes (i n) (push (instance approaching::Coord :init) r)) r))
     (dolist (elem- _coords)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32[] _dists
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dists (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _dists i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get approaching::ApproachInfo :md5sum-) "f6fccf8aff213da9b738fdf6be5c98c4")
(setf (get approaching::ApproachInfo :datatype-) "approaching/ApproachInfo")
(setf (get approaching::ApproachInfo :definition-)
      "string[] ids
Coord[] coords
float32[] dists

================================================================================
MSG: approaching/Coord
int16 x
int16 y

")



(provide :approaching/ApproachInfo "f6fccf8aff213da9b738fdf6be5c98c4")


