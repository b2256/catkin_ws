
(cl:in-package :asdf)

(defsystem "obdii_interface-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ObdiiState" :depends-on ("_package_ObdiiState"))
    (:file "_package_ObdiiState" :depends-on ("_package"))
  ))