
(cl:in-package :asdf)

(defsystem "smelling_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Coord2D" :depends-on ("_package_Coord2D"))
    (:file "_package_Coord2D" :depends-on ("_package"))
    (:file "ObjectStatus" :depends-on ("_package_ObjectStatus"))
    (:file "_package_ObjectStatus" :depends-on ("_package"))
    (:file "PickingInfo" :depends-on ("_package_PickingInfo"))
    (:file "_package_PickingInfo" :depends-on ("_package"))
    (:file "Rectangle" :depends-on ("_package_Rectangle"))
    (:file "_package_Rectangle" :depends-on ("_package"))
  ))