(in-package :cl-user)

(defpackage :key-of-e.server
  (:nicknames :e.server :server)
  (:use :cl :cl-skip-list)
  (:import-from :alexandria)
  (:import-from :serapeum)
  (:import-from :flexi-streams)
  (:export
   :->value
   :->key))

(defpackage :key-of-e.server.storage
  (:nicknames :e.server.storage :storage)
  (:use :cl)
  (:import-from :alexandria)
  (:import-from :serapeum))
