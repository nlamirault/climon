;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          climon.lisp
;;;; Purpose:       The Simon game.
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



(if *climon-directory*
    (progn
      (define-tags simon-base (load-image (concatenate 'string
                                                     *climon-directory*
                                                     +base-color+)
                                        t)                 
                   simon-yellow (load-image (concatenate 'string
                                                         *climon-directory*
                                                         +yellow-color+)
                                            t)
                   simon-blue (load-image (concatenate 'string
                                                       *climon-directory*
                                                       +blue-color+)  t)
                   simon-red (load-image (concatenate 'string
                                                      *climon-directory*
                                                      +red-color+) t)
                   simon-green (load-image (concatenate 'string
                                                        *climon-directory*
                                                        +green-color+) t))
      (setf *sounds*
            (list (cons :yellow (concatenate 'string
                                             *climon-directory*
                                             +yellow-sound+))
                  (cons :blue (concatenate 'string
                                             *climon-directory*
                                             +blue-sound+))
                  (cons :red (concatenate 'string
                                             *climon-directory*
                                             +red-sound+))
                  (cons :green (concatenate 'string
                                             *climon-directory*
                                             +green-sound+)))))
    (error "CLIMON directory isn't defined : *CLIMON-DIRECTORY*"))


(defclass simon ()
  ((image :accessor simon-image :initarg :image)))


(defgeneric draw (simon)
  (:documentation "Draw a Simon game with or not activate color."))


(defmethod draw ((s simon))
  (when *debug*
    (format t "~&Draw ~A : ~A" *simon* (simon-image s)))
  (draw-image (simon-image s) (v 0 0)))


(defclass simon-base (simon)
  ()
  (:default-initargs :image (tag 'simon-base)))

(defclass simon-yellow (simon)
  ()
  (:default-initargs :image (tag 'simon-yellow)))

(defclass simon-blue (simon)
  ()
  (:default-initargs :image (tag 'simon-blue)))

(defclass simon-red (simon)
  ()
  (:default-initargs :image (tag 'simon-red)))

(defclass simon-green (simon)
  ()
  (:default-initargs :image (tag 'simon-green)))



(defun initialize-simon ()
  "Creates all Simons."
  (setf *user* 0)
  (setf *random* '())
  (loop for choice in '((:base . simon-base)
                        (:yellow . simon-yellow)
                        (:blue . simon-blue)
                        (:red . simon-red)
                        (:green . simon-green))
     do (let ((simon (make-instance (cdr choice))))
          (push (cons (car choice) simon) *simons*)))
  (setf *simon* (cdr (find :base *simons* :key #'car))))


(defun set-simon (color)
  "Set current Simon sound and image with the specified COLOR which
could be :yellow, :blue, :red or :green."
  ;;(format t "~&Sequence : ~A" color)
  (setf *simon* (cdr (find color *simons* :key #'car))
        *sound* (cdr (find color *sounds* :key #'car))))


(defun add-random-simon ()
  "Get a new random sequence."
  (let ((number (1+ (random 4))))
    (when *debug*
      (format t "~&Number : ~A" number))
    (cond ((= 1 number) (setf *random* (append *random* (list :yellow))))
          ((= 2 number) (setf *random* (append *random* (list :blue))))
          ((= 3 number) (setf *random* (append *random* (list :red))))
          ((= 4 number) (setf *random* (append *random* (list :green)))))))


(defun play-sequence ()
  "Draw the current color, and play the associated sound."
  (when *debug*
    (format t "~&Play new sequence :~&~A" *random*))
  (setf *user* -1)
  (loop for color in *random*
     do
       (when *debug*
         (format t "~&Play ~A~%" color))
       (set-simon color)
       (draw *simon*)
       (pal::update-screen)
       (play-music (load-music *sound*) :loops nil :volume 255)
       (sleep (/ 1 *speed*))
       (set-simon :base)
       (draw *simon*)
       (pal::update-screen))
  (set-simon :base)
  (draw *simon*)
  (setf *user* 0))


(defun good-answer-p (color)
  "Verify if the current COLOR is correct."
  (when *debug*
    (format t "~&User ~A:~A pour ~A" color *user* *random*))
  (when (>= *user* 0)
    (equal color (nth (1- *user*) *random*))))


(defun check-user-answer (color)
  "Check the current user COLOR from the random sequence."
  (set-simon color)
  (draw *simon*)
  (play-music (load-music *sound*) :loops nil :volume 255)
  (when (> (length *random*) 0)
    (incf *user*)
    (unless (good-answer-p color)
      (when *debug*
        (format t "~&User failed for ~A ~A" *user* *random*))
      (setf *user* -1)
      (setf *random* '())
      (pal:draw-text (format nil "You lost. Score ~A" *score*) (v 100 200))
      (pal::update-screen)
      (sleep 1))))


(defun mouse-in-area-p (area x y)
  "Check if the mouse with X and Y coordonates is over the AREA."
  (and (and (> x (car (first area)))
            (> y (cdr (first area))))
       (and (< x (car (second area)))
            (> y (cdr (second area))))
       (and (> x (car (third area)))
            (< y (cdr (third area))))
       (and (< x (car (fourth area)))
            (< y (cdr (fourth area))))))


(defun check-area-from-mouse (x y)
  "If the mouse is over a color, update the screen."
  (let ((color 
         (cond ((mouse-in-area-p +red-area+ x y)
                :red)
               ((mouse-in-area-p +green-area+ x y)
                :green)
               ((mouse-in-area-p +blue-area+ x y)
                :blue)
               ((mouse-in-area-p +yellow-area+ x y)
                :yellow))))
    color))


(defun climon ()
  "Start the SIMON game."
  (setf *random-state* (make-random-state t))
  (with-pal (:width +width+ :height +height+ :fullscreenp nil ;:fps 60
                    :paths (concatenate 'string *climon-directory* "font/"))

    (initialize-simon)
    (draw *simon*)
    (event-loop
        (:key-down-fn (lambda (key)
                        (when *debug*
                          (format t "~&Key down ~A" key))
                        (cond ((eq key :key-q)
                               (return-from event-loop))
                              ((eq key :key-y)
                               (when (>= *user* 0)
                                 (check-user-answer :yellow)))
                              ((eq key :key-b)
                               (when (>= *user* 0)
                                 (check-user-answer :blue)))
                              ((eq key :key-r)
                               (when (>= *user* 0)
                                 (check-user-answer :red)))
                              ((eq key :key-g)
                               (when (>= *user* 0)
                                 (check-user-answer :green)))
                              ((or (eq key :key-mouse-1)
                                   (eq key :key-mouse-2)
                                   (eq key :key-mouse-3))
                               (when (>= *user* 0)
                                 (let ((pos (get-mouse-pos)))
                                   (when *debug*
                                     (format t "~&Mouse pos : ~A x ~A"
                                             (vx pos) (vy pos)))
                                   (let ((color
                                          (check-area-from-mouse (vx pos) (vy pos))))
                                     (when color
                                       (check-user-answer color))))))
                              ((eq key :key-space)
                               (unless (or (> (length *random*) 0)
                                           (> *user* 0))
                                 (add-random-simon)
                                 (play-sequence)))))
        :key-up-fn (lambda (key)
                     (when *debug*
                       (format t "~&Key up ~A" key))
                     (cond ((eq key :key-q)
                            (return-from event-loop))
                           ((or (eq key :key-y)
                                (eq key :key-b)
                                (eq key :key-r)
                                (eq key :key-g)
                                (eq key :key-mouse-1)
                                (eq key :key-mouse-2)
                                (eq key :key-mouse-3))
                            (set-simon :base)
                            (draw *simon*)
                            (pal::update-screen)
                            (when (and (> (length *random*) 0)
                                       (= *user* (length *random*)))
                              (sleep 1)
                              (incf *score*)
                              (add-random-simon)
                              (play-sequence)))))
        :mouse-motion-fn (lambda (x y)
;;                            (when *debug*
;;                              (format t "~&Mouse ~A ~A" x y))
                           (let ((color (check-area-from-mouse x y)))
                             (unless color
                               (setf color :base))
                             (set-simon color)
                             (draw *simon*)))

        )))
  0) ;; for sb-executable


(defun climon-test ()
  "Some test with the SIMON game."
  (setf *random-state* (make-random-state t))
  (with-pal (:width +width+ :height +height+ :fullscreenp nil ;:fps 60
                    :paths (concatenate 'string *climon-directory* "font/"))

    (initialize-simon)
    (draw *simon*)
    (event-loop
        (:key-down-fn (lambda (key)
                        ;;(pal:message key)
                        (cond ((eq key :key-q)
                               (return-from event-loop))
                              ((eq key :key-y)
                               (when (>= *user* 0)
                                 (set-simon :yellow)
                                 (draw *simon*)
                                 (play-music (load-music *sound*)
                                             :loops nil :volume 255)))
                              ((eq key :key-b)
                               (when (>= *user* 0)
                                 (set-simon :blue)
                                 (draw *simon*)
                                 (play-music (load-music *sound*)
                                             :loops nil :volume 255)))
                              ((eq key :key-r)
                               (when (>= *user* 0)
                                 (set-simon :red)
                                 (draw *simon*)
                                 (play-music (load-music *sound*)
                                             :loops nil :volume 255)))
                              ((eq key :key-g)
                               (when (>= *user* 0)
                                 (set-simon :green)
                                 (draw *simon*)
                                 (play-music (load-music *sound*)
                                             :loops nil :volume 255)))
                              ((eq key :key-space)
                               (add-random-simon)
                               (play-sequence))))
        :key-up-fn (lambda (key)
                     ;;(pal:message key)
                     (cond ((eq key :key-q)
                            (return-from event-loop))
                           ((or (eq key :key-y)
                                (eq key :key-b)
                                (eq key :key-r)
                                (eq key :key-g))
                            (set-simon :base)
                            (draw *simon*))))
        ))))


(defun climon-sequence (&optional (sequence
                                   '(:blue :yellow :red :blue :green :blue :green
                                     :red :red :blue :red)))
  "Start a test : Press SPACE to start a sequence of sound and color."
  (with-pal (:width +width+ :height +height+ :fullscreenp nil
                    :paths (concatenate 'string *climon-directory* "font/"))
    (initialize-simon)
    (draw *simon*)
    (setf *random* sequence)
    (event-loop ()
      (test-keys
        (:key-space  (play-sequence))
        (:key-q  (return-from event-loop))))))

