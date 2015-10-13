;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          climon.asd
;;;; Purpose:       ASDF definition for Climon
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; climon users are granted the rights to distribute and use this software
;;;; as governed by the terms of the MIT License :
;;;; http://www.opensource.org/licenses/mit-license.php
;;;;
;;;; *************************************************************************



(in-package :asdf)



(defsystem climon
  :name "climon"
  :author "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :maintainer "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :version "0.7.0"
  :licence "MIT License"
  :description "The Simon game."
  :depends-on (:pal)
  :components
  ((:module :src
            :components
            ((:file "package")
             (:file "specials" :depends-on ("package"))
             (:file "climon" :depends-on ("specials"))))))
