
(cl:in-package :asdf)

(defsystem "head_pose_estimation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Coord2D" :depends-on ("_package_Coord2D"))
    (:file "_package_Coord2D" :depends-on ("_package"))
    (:file "GazingInfo" :depends-on ("_package_GazingInfo"))
    (:file "_package_GazingInfo" :depends-on ("_package"))
  ))