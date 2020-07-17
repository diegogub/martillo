(in-package :martillo)

(defmacro valid-not (f &rest c)
  `(when (not ,@c)
     (return-from ,f nil)))

(defmacro mvalid-not (f conditions)
  `(progn ,@(mapcar (lambda (a)
                     `(valid-not ,f ,a)) conditions)))

(defmacro valid (f &rest c)
  `(when ,@c
     (return-from ,f nil)))

(defmacro mvalid (f conditions)
  `(progn ,@(mapcar (lambda (a)
                     `(valid ,f ,a)) conditions)))
