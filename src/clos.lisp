(in-package :martillo)

(defmacro map-obj-alist (obj params)
  `(defmethod decode-obj ()
     ,params))

(defmacro make-instance-from (class parent obj  params)
  (closer-mop:ensure-finalized (find-class parent))
  (let ((slots (closer-mop:class-slots (find-class parent)))
         (key-list '()))
      (loop for s in slots
                        do (progn 
                             (let ( (iarg (car (closer-mop:slot-definition-initargs s)))) 
                               (handler-case 
                                   (when iarg
                                     (let ((val `(handler-case 
                                                     (slot-value ,obj ',(closer-mop:slot-definition-name s))
                                                  (t () nil))))
                                       (push val key-list)
                                       (push iarg key-list)))
                                (t () ())))
                             ))
      `(make-instance ,class ,@key-list ,@params)))
