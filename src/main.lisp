(defpackage martillo
  (:use :cl)
  (:export 
    :when-opt
    :msetf
    :gen-id
    :sha1-hash
    ;;micro-money
    :to-micro
    :micro-to-float
    :m*
    :m/
    ;; Ningle helpers
    :redirect
    :with-status
    :query-param
    :param
    :header
    :get-ip
    :is-method
    :locate-ip
    :*maxminddb*
    :*maxmind-mw*)
  (:nicknames "mar"))
(in-package :martillo)


(defmacro msetf (accessor from to)
  "Copy value between objects with same accessors"
  `(setf (,accessor ,to) (,accessor ,from)))
