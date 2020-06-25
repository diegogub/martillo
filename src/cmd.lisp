(in-package :martillo)

(defmacro when-opt ((options opt) &body body)
  "Execure body if unix option exists."
  `(let ((it (getf ,options ,opt)))
     (when it
       ,@body)))
