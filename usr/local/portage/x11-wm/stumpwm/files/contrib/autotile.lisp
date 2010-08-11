;;; Basic tiling in stumpwm. Defines a new command, TILE, to tile
;;; windows in the current group. In addition, any group name added to
;;; the list *AUTOTILING-GROUPS* will tile automatically its windows.

;;; Initial author: jao@gnu.org.
;;; This code is in the public domain.

(in-package :stumpwm)

(defun do-auto-tile (group)
  (let* ((tlen (length (stumpwm::group-windows group)))
         (len (1- tlen)))
    (unless (zerop tlen)
      (stumpwm::call-interactively "only")
      (unless (current-window)
        (stumpwm::focus-next-window group)))
    (unless (zerop len)
      (stumpwm::split-frame group :column)
      (stumpwm::focus-next-frame group)
      (dotimes (n (1- len))
        (stumpwm::split-frame group :row (/ (- len n)))
        (stumpwm::focus-next-frame group))
      (stumpwm::focus-next-frame group))))

(defcommand auto-tile () ()
  "Tile windows in the current group."
  (do-auto-tile (current-group)))

(defvar *autotiling-groups* '()
  "Names of groups that will automatically tile their windows.")

(defun autotile-hook (&optional window)
  (unless (and window
               (stumpwm::window-transient-p window))
    (when (member (stumpwm::group-name (current-group))
                  *autotiling-groups*
                  :test #'equalp)
      (do-auto-tile (current-group)))))

(add-hook *new-window-hook* #'autotile-hook)
;(add-hook stumpwm::*unmap-window-hook* #'autotile-hook)
