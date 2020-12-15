(defsystem "martillo"
  :version "0.1.0"
  :author "Diego Guraieb"
  :license ""
  :depends-on (lack lack-request lack-response ironclad bordeaux-threads ningle closer-mop jonathan)
  :components ((:module "src"
                :components
                ((:file "main")
                 (:file "id")
                 (:file "validation")
                 (:file "cmd")
                 (:file "money")
                 (:file "ningle")
                 (:file "conditions")
                 )))
  :description "Macros and usefull functions."
  :in-order-to ((test-op (test-op "martillo/tests"))))

(defsystem "martillo/tests"
  :author "Diego Guraieb"
  :license ""
  :depends-on ("martillo"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for martillo"
  :perform (test-op (op c) (symbol-call :rove :run c)))
