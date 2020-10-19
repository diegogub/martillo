(defclass test ()
  ((testing
     :initform "1")
   (count-it
     :initform '(1 2 3 4))
   (human
     :initform 0)
   (super-flag
     :initform :false)
   (other-flag
     :initform t)
   ))

(setf jonathan:*false-value* nil)

(def-json test)

(jonathan:to-json (make-instance 'test))

(when :false
  (print "j"))
