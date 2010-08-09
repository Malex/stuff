;;; link-menu
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
;;; 	(load-module "links-menu")
;;;
;;; ...into your  ~/.stumpwmrc
;;; Then you can bind the links-menu command

;;; CODE:
;;;
(in-package :stumpwm)

(export '(links-menu))
 (defun links-list ()
  (defparameter *links* (list '("http://goosh.org")))
  (let ((in (open "/tmp/stumplinks" :if-does-not-exist nil)))
   (when in
    (loop for line = (read-line in nil) while line do (push (list line) *links*)))))

 (defcommand links-menu () ()
  (links-list)
  (let ((selection (select-from-menu
                    (current-screen) *links* "Select link or type esc to close menu")))
   (if (null selection)
    (throw 'error "Abort.")
    (run-shell-command (format nil "uzbl-tabbed ~a"(car selection))))))
