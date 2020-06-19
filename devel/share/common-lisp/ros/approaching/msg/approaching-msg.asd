
(cl:in-package :asdf)

(defsystem "approaching-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ApproachInfo" :depends-on ("_package_ApproachInfo"))
    (:file "_package_ApproachInfo" :depends-on ("_package"))
    (:file "Coord" :depends-on ("_package_Coord"))
    (:file "_package_Coord" :depends-on ("_package"))
  ))