(in-package :key-of-e.client.tests)

(defsuite client-suite ())

(deftest it-runs (client-suite)
  (assert-true (= 1 1)))

(defun run-ci ()
  "Run the tests in CI"
  (let ((result (run-suite 'client-suite :report-progress nil)))
    (when (or (plusp (clunit::errors result))
              (plusp (clunit::failed result)))
      (uiop:quit 1))))
