;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          climon.lisp
;;;; Purpose:       Climon unit tests.
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; This file, part of climon, is Copyright (c) 2007, 2015 by Nicolas Lamirault
;;;;
;;;; climon users are granted the rights to distribute and use this software
;;;; as governed by the terms of the Lisp Lesser GNU Public License
;;;; (http://opensource.franz.com/preamble.html), also known as the LLGPL.
;;;;
;;;; *************************************************************************


(in-package :climon-test)


(plan 8)


(ok (climon::mouse-in-area-p climon::+red-area+ 150 185))

(ok (climon::mouse-in-area-p climon::+green-area+ 350 100))

(ok (climon::mouse-in-area-p climon::+blue-area+ 210 310))

(ok (climon::mouse-in-area-p climon::+yellow-area+ 510 250))

(is :red (climon::check-area-from-mouse 150 185))

(is :green (climon::check-area-from-mouse 350 100))

(is :blue (climon::check-area-from-mouse 210 310))

(is :yellow (climon::check-area-from-mouse 510 250))




(finalize)
