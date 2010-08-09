;;; CPU formatters for the mode-line
;;;
;;; Copyright 2010 Nicola Mometto.
;;;
;;; Maintainer: Nicola Mometto 
;;;
;;; This module is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; This module is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this software; see the file COPYING.  If not, write to
;;; the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
;;; Boston, MA 02111-1307 USA
;;;

;;; USAGE:
;;;
;;; Put:
;;; 
;;; 	(load-module "uptime")
;;;
;;; ...into your  ~/.stumpwmrc
;;; Then you can use "%u" in your mode line format.

;;; CODE:
;;;
(defpackage :stumpwm.contrib.uptime
 (:use :common-lisp :stumpwm :cl-ppcre))

(in-package :stumpwm.contrib.uptime)

(pushnew '(#\U uptime) *screen-mode-line-formatters* :test 'equal)

(defun uptime (ml)
 (declare (ignore ml))
 (let* ((n (parse-integer (car (cl-ppcre:split "\\." (read-line (open "/proc/uptime"))))))
       (seconds (mod (mod n 60) 60))
       (minutes (floor (nth-value 1(floor (/ n 60) 60))))
       (hours (floor n 3600)))
 (format nil "~2,'0d:~2,'0d:~2,'0d" hours minutes seconds)))

