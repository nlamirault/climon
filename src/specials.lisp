
;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          specials.lisp
;;;; Purpose:       Some specials variables of the Simon game
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; This file, part of climon, is Copyright (c) 2007 by Nicolas Lamirault
;;;;
;;;; climon users are granted the rights to distribute and use this software
;;;; as governed by the terms of the MIT License :
;;;; http://www.opensource.org/licenses/mit-license.php
;;;;
;;;; *************************************************************************


(in-package :climon)


(defparameter *version* (asdf:component-version (asdf:find-system "climon")))

(defparameter *climon-directory*
  (namestring (asdf:component-relative-pathname (asdf:find-system :climon)))
  "Directory with contains CLIMON source files.")

(defparameter *simons* nil "All Simons.")

(defparameter *sounds* nil "All sound assiocated with the color.")

(defparameter *simon* nil "The current Simon image.")

(defparameter *sound* nil "The current Simon sound.")

(defparameter *random* '() "The random sequence.")

(defparameter *debug* nil "When T, active some logs for debugging.")

(defparameter *user* 0 "Rank of the user's answer.")

(defparameter *score* 0 "The user's score.")

(defparameter *speed* 2)

;; screen

(unless (boundp '+width+)
  (defconstant +width+ 640 "The default width."))

(unless (boundp '+height+)
  (defconstant +height+ 480 "The default height."))

(unless (boundp '+red-area+)
  (defconstant  +red-area+
    '((100 . 116) (220 . 116) (100 . 200) (220 . 200))))

(unless (boundp '+green-area+)
  (defconstant  +green-area+
    '((310 . 70) (460 . 70) (310 . 130) (460 . 130))))

(unless (boundp '+blue-area+)
  (defconstant +blue-area+
    '((138 . 281) (315 . 271) (138 . 350) (315 . 350))))

(unless (boundp '+yellow-area+)
  (defconstant +yellow-area+
    '((442 . 200) (576 . 200) (442 . 300) (576 . 300))))

;; multimedia files

(unless (boundp '+yellow-sound+)
  (defconstant +yellow-sound+ "sound/yellow.wav"))

(unless (boundp '+blue-sound+)
  (defconstant +blue-sound+ "sound/blue.wav"))

(unless (boundp '+red-sound+)
  (defconstant +red-sound+ "sound/red.wav"))

(unless (boundp '+green-sound+)
  (defconstant +green-sound+ "sound/green.wav"))

(unless (boundp '+base-color+)
  (defconstant +base-color+ "img/simon01.png"))

(unless (boundp '+yellow-color+)
  (defconstant +yellow-color+ "img/simon01_jaune.png"))

(unless (boundp '+blue-color+)
  (defconstant +blue-color+ "img/simon01_bleu.png"))

(unless (boundp '+red-color+)
  (defconstant +red-color+ "img/simon01_rouge.png"))

(unless (boundp '+green-color+)
  (defconstant +green-color+ "img/simon01_vert.png"))

