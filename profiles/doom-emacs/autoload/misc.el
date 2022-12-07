;;; ~/.doom.d/autoload/misc.el -*- lexical-binding: t; -*-

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"

  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

;;;###autoload
(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       ;;(insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       )


(defvar current-date-time-format-inactive "[%Y-%m-%d %a %H:%M]"


  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

;;;###autoload
(defun insert-current-date-time-inactive
 ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       ;;(insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format-inactive (current-time)))
       ;;(insert "\n")
       )



(defvar current-date-time-format-active "<%Y-%m-%d %a %H:%M>"


  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

;;;###autoload
(defun insert-current-date-time-active
 ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       ;;(insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format-active (current-time)))
       ;;(insert "\n")
       )
