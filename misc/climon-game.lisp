;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          climon-game.lisp
;;;; Purpose:       The Climon executable tool.
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; This file, part of climon, is Copyright (c) 2009 by Nicolas Lamirault
;;;;
;;;; climon users are granted the rights to distribute and use this software
;;;; as governed by the terms of the MIT License :
;;;; http://www.opensource.org/licenses/mit-license.php
;;;;
;;;; *************************************************************************


(in-package :cl-user)

(require 'asdf)
(require 'climon)


(defparameter *target-directory* "/tmp/")

(defparameter *executable-name*
  (format nil "climon-~A" climon:*version*))

(defun make-climon-executable ()
  "Creates a Climon executable."
  (sb-ext:save-lisp-and-die
   (merge-pathnames *executable-name* *target-directory*)
   :executable t
   :toplevel (lambda ()
               (climon:climon)
               (sb-ext:quit :unix-status 0))))

(make-climon-executable)

