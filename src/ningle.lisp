(in-package :martillo)

(defmacro redirect (url) "Redirect to other url"
  (when (not (typep url 'string))
    (error "URL must be string"))
  `(progn 
    (setf (lack.response:response-headers *response*)
      (append (lack.response:response-headers *response*)
              (list :location ,url)))
    (setf (lack.response:response-status *response*) 302)
    "redirect"))

(defmacro with-status (res status &rest body)
  "Executes body with one HTTP status"
  `(progn (setf (lack.response:response-status ,res) ,status)
      ,@body))

(defmacro query-param (req param)
  "Gets query parameter from request"
  `(progn (cdr (assoc ,param (lack.request:request-query-parameters ,req) :test 'string=))))

(defmacro param (name parameters)
  "Gets any parameter from request"
  `(progn (cdr (assoc ,name ,parameters :test 'string=))))

(defmacro header (req name)
  "Read Header value"
  `(gethash ,name (lack.request:request-headers ,req)))

(defmacro get-ip (req &key (proxy nil)) 
  "Returns IP from request"
  (if proxy
    `(header ,req "x-forwarded-for")
   `(progn (lack.request:request-remote-addr ,req))))


(defmacro is-method (req m)
  "Checks request method"
    `(eql (lack.request:request-method ,req) ,m))
