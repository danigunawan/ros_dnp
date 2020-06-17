
(cl:in-package :asdf)

(defsystem "tfpose_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BodyPartElm" :depends-on ("_package_BodyPartElm"))
    (:file "_package_BodyPartElm" :depends-on ("_package"))
    (:file "Person" :depends-on ("_package_Person"))
    (:file "_package_Person" :depends-on ("_package"))
    (:file "Persons" :depends-on ("_package_Persons"))
    (:file "_package_Persons" :depends-on ("_package"))
  ))