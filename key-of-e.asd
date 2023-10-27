(in-package :asdf-user)

(asdf:defsystem "key-of-e"
  :description "A key-value store that's fast and easy to use"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/key-of-e.git")
  :depends-on (#:key-of-e/server
               #:key-of-e/client))

(asdf:defsystem "key-of-e/server"
  :description "The server side of key-of-e"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/key-of-e.git")

  :in-order-to ((test-op (test-op :key-of-e/server/tests)))

  :depends-on (:alexandria
               :serapeum
               :trivia
               :closer-mop
               :log4cl

               :fast-io
               :flexi-streams
               :cl-skip-list)

  :pathname "src/server"
  :serial t
  :components ((:file "packages")
               (:file "kv")
               (:file "engine")))

(asdf:defsystem "key-of-e/server/tests"
  :description "Unit tests for the key-of-e server"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/key-of-e.git")

  :depends-on (:clunit2 :key-of-e/server)

  :pathname "tests/server"
  :serial t
  :components ((:file "packages")
               (:file "suites"))

  :perform (test-op (o c)
                    (declare (ignore o c))
                    (uiop:symbol-call :key-of-e.server.tests :run-ci)))


(asdf:defsystem "key-of-e/client"
  :description "The client side of key-of-e"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/key-of-e.git")

  :in-order-to ((test-op (test-op :key-of-e/client/tests)))

  :depends-on (:alexandria
               :serapeum
               :trivia
               :closer-mop
               :log4cl)

  :pathname "src/client"
  :serial t
  :components ((:file "packages")))

(asdf:defsystem "key-of-e/client/tests"
  :description "Unit tests for the key-of-e client"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/key-of-e.git")

  :depends-on (:clunit2 :key-of-e/client)

  :pathname "tests/client"
  :serial t
  :components ((:file "packages")
               (:file "suites"))
  :perform (test-op (o c)
                    (declare (ignore o c))
                    (uiop:symbol-call :key-of-e.client.tests :run-ci)))
