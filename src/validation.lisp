(in-package :martillo)

(defmacro return-if-not (f &rest c)
  `(unless ,@c
     (return-from ,f nil)))

(defmacro m-return-if-not (f conditions)
  `(progn ,@(mapcar (lambda (a)
                     `(return-if-not ,f ,a)) conditions)))

(defmacro return-if (f &rest c)
  `(when ,@c
     (return-from ,f nil)))

(defmacro m-return-if (f conditions)
  `(progn ,@(mapcar (lambda (a)
                     `(return-if ,f ,a)) conditions)))
