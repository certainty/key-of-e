(in-package :key-of-e.server.tests)

(defsuite server-suite ())

(deftest it-works (server-suite)
  (assert-true (= 1 1)))
