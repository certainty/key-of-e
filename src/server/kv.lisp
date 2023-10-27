(in-package :key-of-e.server)

(deftype tpe-key () '(array (unsigned-byte 8)))
(deftype tpe-value () '(array (unsigned-byte 8)))

(defclass data-key ()
  ((data :initarg :data :reader key-data :type tpe-key)))

(defclass data-value ()
  ((data :initarg :data :reader value-data :type tpe-value)))

(defclass data-tombstone (data-value) ())

(defgeneric ->value (data)
  (:documentation
   "Generic function to create a value of `data-value' from the provided data.
The system can only manage data as values if it implements this method")
  (:method ((data data-value))
    data)

  (:method ((data string))
    (make-instance 'data-value :data (flexi-streams:string-to-octets data :external-format :utf-8))))

(defgeneric ->key (data)
  (:documentation
   "Generic function to create a value of `data-key' from the provided data.
The system can only manage data as keys if it implements this method")
  (:method ((data data-key))
    data)

  (:method ((data string))
    (make-instance 'data-key :data (flexi-streams:string-to-octets data :external-format :utf-8))))

(defgeneric %store (container key value)
  (:documentation "Add the `key' with the provided `value' to the container. You only need implement the method that already receives `data-key' and `data-value'.
 This method takes care of converting both if necessary using the and `->key' and `->value' generics."))

(defmethod %store (container (key data-key) value)
  (%store container key (->value value)))

(defmethod %store (container key (value data-value))
  (%store container (->key key) value))

(defmethod %store (container key value)
  (%store container (->key key) (->value value)))

(defgeneric %fetch (container key)
  (:documentation "Retrieve the value associated with `key' from the container.
Returns two values:
1. The value that has been associated
2. NIL or T depending on whether or not the key was present."))

(defmethod %fetch (container key)
  (%fetch container (->key key)))

(defgeneric %remove (container key)
  (:documentation "Removes the entry with the given `key' from the container.
Returns two values:
1. The value that has been removed
@. NIL or T depending on whether or not the key was present."))

(defmethod %remove (container key)
  (%remove container (->key key)))
