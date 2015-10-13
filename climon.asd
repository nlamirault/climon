;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          climon.asd
;;;; Purpose:       ASDF definition for Climon
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; This file, part of climon, is Copyright (c) 2007, 2015 by Nicolas Lamirault
;;;;
;;;; climon users are granted the rights to distribute and use this software
;;;; as governed by the terms of the Lisp Lesser GNU Public License
;;;; (http://opensource.franz.com/preamble.html), also known as the LLGPL.
;;;;
;;;; *************************************************************************


(in-package :asdf)



(defsystem climon
  :name "climon"
  :author "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :maintainer "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :version "0.6.0"
  :licence "Lisp Lesser GNU General Public License"
  :description "The Simon game."
  :depends-on (:pal)
  :components
  ((:module :src
            :components
            ((:file "package")
             (:file "specials" :depends-on ("package"))
             (:file "climon" :depends-on ("specials"))))))
