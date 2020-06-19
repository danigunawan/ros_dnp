
(cl:in-package :asdf)

(defsystem "smelling_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ObjectStatus" :depends-on ("_package_ObjectStatus"))
    (:file "_package_ObjectStatus" :depends-on ("_package"))
    (:file "Rectangle" :depends-on ("_package_Rectangle"))
    (:file "_package_Rectangle" :depends-on ("_package"))
  ))