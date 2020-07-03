(defsystem "martillo"
  :version "0.1.0"
  :author "Diego Guraieb"
  :license ""
  :depends-on (vlime lack lack-request lack-response cl-maxminddb ironclad bordeaux-threads)
  :components ((:module "src"
                :components
                ((:file "main")
                 (:file "id")
                 (:file "cmd")
                 (:file "geo")
                 (:file "money")
                 (:file "ningle"))))
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
