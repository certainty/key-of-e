(in-package :key-of-e.server)

(defclass storage () ())

(defclass lsm (storage)
  ((c0 :initform (make-skip-list))
   (c1 :initform nil)))

(defmethod %store ((storage lsm) (key data-key) (value data-value))
  (with-slots (c0) storage
    (skip-list-add c0 key value)))

(defclass engine ()
  ((storage :initform (make-instance 'lsm))))

(defmethod %store ((ngin engine) (key data-key) (value data-value))
  ;; store the data in storage
  (with-slots (storage) ngin
    (%store storage key value)))
