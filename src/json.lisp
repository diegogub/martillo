(in-package :martillo)

(defmacro def-json (class)
  (closer-mop:ensure-finalized (find-class class))
  (let ((slots 
          (map 'list #'string 
               (map 'list #'closer-mop:slot-definition-name 
                    (closer-mop:class-slots (find-class class)))))
        )
    `(defmethod jonathan:%to-json ((obj ,class))
       (jonathan:with-object
         ,@(loop for s in slots
              collect `(jonathan:write-key-value ,(string-downcase s) (slot-value obj `,(read-from-string ,s))))))))
