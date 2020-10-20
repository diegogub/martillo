(in-package :martillo)

(defmacro def-conditions (conditions)
  (let ((defs (loop for c in conditions
      collect `(define-condition ,c (error)
                 ((text :initarg :text :reader text))))))
  `(progn
     ,@defs
     nil)))

(def-conditions (test
                  err-test))
