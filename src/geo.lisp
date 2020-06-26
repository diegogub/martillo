(in-package :martillo)


(ql:quickload "cl-maxminddb")
(ql:quickload "cl-geoip")

(defun geo-get-value (index value vals)
  (if vals
  (let ((record (remove-if-not #'(lambda (val) (string= (first val) index)) vals)))
    (assoc value (rest (first record)) :test 'string=)) 
    '()))

(defun locate-ip (path ip)
  (let ((geo (cl-maxminddb:with-mmdb (mmdb path)  
              (cl-maxminddb:mmdb-query mmdb ip))))
    `((:country . ,(cdr (geo-get-value "country" "iso_code" geo)))
       (:continent . ,(cdr (assoc "en" (cdr (geo-get-value "continent" "names" geo)) :test 'string=)))
       (:timezone . ,(cdr (geo-get-value "location" "time_zone" geo)))
       (:city . ,(cdr (assoc "en" (cdr (geo-get-value "city" "names" geo)) :test 'string=))))))
