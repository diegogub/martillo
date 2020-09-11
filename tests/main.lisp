(defpackage martillo/tests/main
  (:use :cl
        :martillo
        :rove))
(in-package :martillo/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :martillo)' in your Lisp.
(defclass a ()
  ((name
     :initarg :name
     :initform ""
     :accessor name)
   (age
     :initarg :age
     :initform 0
     :accessor age)))

(defclass b (a)
  ())

(deftest test-msetf
  (testing "Testing mserf")

  (let ((a (make-instance 'a :name "Diego" :age 10))
        (b (make-instance 'b)))
        (msetf a b name age)
        (ok (string= (name a) (name b)))
    ))

