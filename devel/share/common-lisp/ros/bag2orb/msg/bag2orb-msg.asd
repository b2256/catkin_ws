
(cl:in-package :asdf)

(defsystem "bag2orb-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Sync_orb" :depends-on ("_package_Sync_orb"))
    (:file "_package_Sync_orb" :depends-on ("_package"))
    (:file "TatBry" :depends-on ("_package_TatBry"))
    (:file "_package_TatBry" :depends-on ("_package"))
  ))