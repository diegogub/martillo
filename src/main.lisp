(defpackage martillo
  (:use :cl)
  (:export 
    :when-opt
    :msetf
    :gen-id
    :sha1-hash
    ;;validation
    : return-if-not
    : return-if
    : m-return-if-not
    : m-return-if

    ;;micro-money
    :to-micro
    :micro-to-float
    :m*
    :m/
    ;; Ningle helpers
    :redirect
    :with-status
    :set-header
    :set-cookie
    :set-content-type
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
