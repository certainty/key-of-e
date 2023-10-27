(in-package :key-of-e.server.tests)

(defsuite server-suite ())

(deftest it-works (server-suite)
  (assert-true (= 1 1)))

(defun run-ci ()
  "Run the tests in CI"
  (let ((result (run-suite 'server-suite :report-progress nil)))
    (when (or (plusp (clunit::errors result))
              (plusp (clunit::failed result)))
      (uiop:quit 1))))
