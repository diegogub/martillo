(defpackage martillo
  (:use :cl)
  (:export 
    :when-opt
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
