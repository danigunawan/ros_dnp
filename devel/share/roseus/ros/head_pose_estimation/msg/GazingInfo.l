;; Auto-generated. Do not edit!


(when (boundp 'head_pose_estimation::GazingInfo)
  (if (not (find-package "HEAD_POSE_ESTIMATION"))
    (make-package "HEAD_POSE_ESTIMATION"))
  (shadow 'GazingInfo (find-package "HEAD_POSE_ESTIMATION")))
(unless (find-package "HEAD_POSE_ESTIMATION::GAZINGINFO")
  (make-package "HEAD_POSE_ESTIMATION::GAZINGINFO"))

(in-package "ROS")
;;//! \htmlinclude GazingInfo.msg.html


(defclass head_pose_estimation::GazingInfo
  :super ros::object
  :slots (_is_gazing _coords ))

(defmethod head_pose_estimation::GazingInfo
  (:init
   (&key
    ((:is_gazing __is_gazing) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:coords __coords) (let (r) (dotimes (i 0) (push (instance head_pose_estimation::Coord2D :init) r)) r))
    )
   (send-super :init)
   (setq _is_gazing __is_gazing)
   (setq _coords __coords)
   self)
  (:is_gazing
   (&optional __is_gazing)
   (if __is_gazing (setq _is_gazing __is_gazing)) _is_gazing)
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
    ;; bool[] _is_gazing
    (* 1    (length _is_gazing)) 4
    ;; head_pose_estimation/Coord2D[] _coords
    (apply #'+ (send-all _coords :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _is_gazing
     (write-long (length _is_gazing) s)
     (dotimes (i (length _is_gazing))
       (if (elt _is_gazing i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; head_pose_estimation/Coord2D[] _coords
     (write-long (length _coords) s)
     (dolist (elem _coords)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _is_gazing
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _is_gazing (make-list n))
     (dotimes (i n)
     (setf (elt _is_gazing i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; head_pose_estimation/Coord2D[] _coords
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coords (let (r) (dotimes (i n) (push (instance head_pose_estimation::Coord2D :init) r)) r))
     (dolist (elem- _coords)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get head_pose_estimation::GazingInfo :md5sum-) "ab56e55ea0d34f912262cded1f939fc7")
(setf (get head_pose_estimation::GazingInfo :datatype-) "head_pose_estimation/GazingInfo")
(setf (get head_pose_estimation::GazingInfo :definition-)
      "bool[] is_gazing
Coord2D[] coords

================================================================================
MSG: head_pose_estimation/Coord2D
int16 x
int16 y

")



(provide :head_pose_estimation/GazingInfo "ab56e55ea0d34f912262cded1f939fc7")


