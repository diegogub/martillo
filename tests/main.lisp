(defpackage martillo/tests/main
  (:use :cl
        :martillo
        :rove))
(in-package :martillo/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :martillo)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
