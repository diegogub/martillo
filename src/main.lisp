(defpackage martillo
  (:use :cl)
  (:export 
    :when-opt
    :msetf
    :ifn
    :gen-prefix-id
    :gen-uuid-id
    :sha1-hash
    ;;Conditions
    :def-conditions
    ;;Clos
    :make-instance-from

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
    :get-ip
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
