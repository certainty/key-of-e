RUN_LISP=sbcl --noinform --non-interactive
LISP=sbcl --noinform

test: test-server test-client

test-server:
	$(RUN_LISP) --eval '(asdf:test-system :key-of-e/server)'

test-client:
	$(RUN_LISP) --eval '(asdf:test-system :key-of-e/client)'

repl:
	$(LISP)	--eval '(ql:quickload :key-of-e)'

build:
	$(RUN_LISP) --eval '(asdf:make :key-of-e)'

deps:
	$(RUN_LISP) --eval '(progn (ql:quickload :key-of-e) (uiop:quit))'

.PHONY: build repl deps
