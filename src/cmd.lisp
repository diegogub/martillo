(in-package :martillo)

(defmacro when-opt ((options opt) val &body body)
  "Execure body if unix option exists."
  `(let ((,val (getf ,options ,opt)))
     (when ,val
       ,@body)))
