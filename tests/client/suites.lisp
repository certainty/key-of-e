(in-package :key-of-e.client.tests)

(defsuite client-suite ())

(deftest it-runs (client-suite)
  (assert-true (= 1 1)))
