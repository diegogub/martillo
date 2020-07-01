(in-package :martillo)

(deftype micro-money (x)
  (typep x 'number))

(defparameter *micro-precision* 1000000)

(defun to-micro (x)
  (round (* x *micro-precision*)))

(defun micro-to-float (x)
  (float (/ x *micro-precision*)))

(defmacro m* (a b)
  `(to-micro (* (micro-to-float ,a) (micro-to-float ,b))))

(defmacro m/ (a b)
  `(to-micro (/ (micro-to-float ,a) (micro-to-float ,b))))
