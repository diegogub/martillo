(in-package :martillo)

;; generate new random state
(setf *random-state* (make-random-state t))
;; random number max
(defvar *max-random* 1000000000)

(defvar *counter-lock* (bt:make-lock))
;; max number of the counter
(defvar *max-counter* 1000000)
;; internal counter for IDs
(defvar *counter* 0)

(defun sha1-hash (data)
  (let ((sha1 (ironclad:make-digest 'ironclad:sha1))
        (bin-data (ironclad:ascii-string-to-byte-array data)))
    (ironclad:update-digest sha1 bin-data)
    (ironclad:byte-array-to-hex-string (ironclad:produce-digest sha1))))

(defun get-counter ()
  (bt:with-lock-held (*counter-lock*))
    (if (> *counter* *max-counter*)
        (setf *counter* 0)
        (setf *counter* (+ 1 *counter*))))

(defun gen-prefix-id (prefix)
  (concatenate 'string prefix (format nil "~36R~36R~36R" (get-universal-time) (random *max-random*) (get-counter))))

(defun gen-uuid-id (&key (len 20))
  (subseq (str:downcase (uuid:print-bytes nil (uuid:make-v4-uuid))) 0 len))
