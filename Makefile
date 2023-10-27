RUN_LISP=sbcl --noinform --non-interactive
LISP=sbcl --noinform

repl:
	$(LISP)	--eval '(ql:quickload :key-of-e)'

build:
	$(RUN_LISP) --eval '(asdf:make :key-of-e)'

deps:
	$(RUN_LISP) --eval '(progn (ql:quickload :key-of-e) (uiop:quit))'

.PHONY: build repl deps
