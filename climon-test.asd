;;;; Name:          climon-test.asd
;;;; Purpose:       ASDF definition for Climon unit tests
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; This file, part of climc, is Copyright (c) 2013 by Nicolas Lamirault
;;;;
;;;; climc users are granted the rights to distribute and use this software
;;;; as governed by the terms of the MIT License :
;;;; http://www.opensource.org/licenses/mit-license.php
;;;;
;;;; *************************************************************************

(asdf:defsystem #:climon-test
  :serial t
  :description "Climon unit tests"
  :author "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :license "MIT"
  :depends-on (#:climon
	       #:lisp-unit)
  :components
  ((:module :test
	    :components ((:file "package")))))
