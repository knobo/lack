#|
  This file is a part of lack project.
  Copyright (c) 2015 Eitaro Fukamachi (e.arrows@gmail.com)
|#

#|
  A minimal Clack

  Author: Eitaro Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage lack-asd
  (:use :cl :asdf))
(in-package :lack-asd)

(defsystem lack
  :version "0.1"
  :author "Eitaro Fukamachi"
  :license "LLGPL"
  :depends-on (:lack-util
               :bordeaux-threads
               :alexandria)
  :components ((:module "src"
                :components
                ((:file "lack" :depends-on ("builder" "handler"))
                 (:file "builder")
                 (:file "handler"))))
  :description "A minimal Clack"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op lack-test))))
