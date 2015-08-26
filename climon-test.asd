;;;; Name:          climon-test.asd
;;;; Purpose:       ASDF definition for Climon unit tests
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; This file, part of climc, is Copyright (c) 2013, 2015 by Nicolas Lamirault
;;;;
;;;; climc users are granted the rights to distribute and use this software
;;;; as governed by the terms of the MIT License :
;;;; http://www.opensource.org/licenses/mit-license.php
;;;;
;;;; *************************************************************************



(in-package :cl-user)
(defpackage climon-test-asd
  (:use :cl :asdf))
(in-package :climon-test-asd)

(defsystem climon-test
  :defsystem-depends-on (:prove-asdf)
  :depends-on (:climon
               :prove)
  :components ((:module "t"
                :components
                ((:file "package")
                 (:test-file "climon" :depends-on ("package")))))
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove) c)
                    (asdf:clear-system c)))
