;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          runtests.lisp
;;;; Purpose:       Climon unit tests.
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; *************************************************************************


(in-package :cl-user)

(load "./.quicklisp/setup.lisp")

(ql:quickload "climon")
(climon:climon)

