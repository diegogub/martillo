(in-package :martillo)

(setf *random-state* (make-random-state t))

(defvar *seed* (random 999999999999999))

(defvar *counter-lock* (bt:make-lock))
(defvar *counter* 0)

(setf *counter* (+ 1 *counter*))

(defun sha1-hash (data)
  (let ((sha1 (ironclad:make-digest 'ironclad:sha1))
        (bin-data (ironclad:ascii-string-to-byte-array data)))
    (ironclad:update-digest sha1 bin-data)
    (ironclad:byte-array-to-hex-string (ironclad:produce-digest sha1))))

(defun gen-id (prefix)
  (bt:with-lock-held (*counter-lock*)
      (concatenate 'string prefix "-" (sha1-hash (format nil "~A~A~A" (setf *counter* (+ 1 *counter*)) prefix *seed*)))))

(loop for i from 1 to 100000000
  do (print (gen-id "tr"))) 
  
*counter*


