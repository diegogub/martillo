(defsystem "martillo"
  :version "0.1.0"
  :author "Diego Guraieb"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
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
