(defpackage martillo
  (:use :cl
        :ningle)
  (:export 
    :when-opt
    :msetf
    :ifn
    :gen-id
    :sha1-hash
    ;;Conditions
    :def-conditions

    ;;validation
    :return-if-not
    :return-if
    :m-return-if-not
    :m-return-if

    ;; JSON jonathan
    :def-json

    ;;micro-money
    :to-micro
    :micro-to-float
    :m*
    :m/
    ;; Ningle helpers
    :define-routes
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

(defmacro ifn (body default)
  `(if ,body
      ,body
      ,default))

(defmacro msetf (from to &rest params)
  "Copy value between objects with same accessors"
    (let ((inst (loop for p in params
        collect `(setf (,p ,to) (,p ,from)))))
      (push 'progn inst)))
