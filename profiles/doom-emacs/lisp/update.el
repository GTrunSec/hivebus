(defmacro quiet! (&rest forms)
  "Run FORMS without making any noise."
  `(if nil
       (progn ,@forms)
     (fset 'doom--old-write-region-fn (symbol-function 'write-region))
     (cl-letf ((standard-output (lambda (&rest _)))
               ((symbol-function 'load-file) (lambda (file) (load file nil t)))
               ((symbol-function 'message) (lambda (&rest _)))
               ((symbol-function 'write-region)
                (lambda (start end filename &optional append visit lockname mustbenew)
                  (unless visit (setq visit 'no-message))
                  (doom--old-write-region-fn
                   start end filename append visit lockname mustbenew)))
               (inhibit-message t)
               (save-silently t))
       ,@forms)))

(defun get-version (name where)
  (let ((pkg (cadr (assq name where))))
    (when pkg
      (package-desc-version pkg))))

(defun get-available-updates ()
  (let (updates)
    (dolist (package (mapcar #'car package-alist))
      (let ((in-archive (get-version package package-archive-contents))
            (new-package (cadr (assq package package-archive-contents)))
            (old-package (cadr (assq package package-alist))))

        (when (and in-archive
                   (version-list-< (get-version package package-alist)
                                   in-archive))
          (push (list :new new-package :old old-package) updates))))
    updates))

(defun get-max-package-name-length (updates)
  (car (sort (mapcar (lambda (it) (length (format "%s" (package-desc-name (plist-get it :new)))))
                     updates)
             #'>)))

(setq package-user-dir (expand-file-name "~/.emacs.d/elpa"))

(require 'package)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))

(setq package-pinned-packages
      '((use-package . "melpa-stable")
        (evil . "melpa-stable")))

(quiet!
  (package-initialize)
  (package-refresh-contents))

(let ((updates (get-available-updates)))
  (when updates
    (message "\nFound %d Package Update%s:"
             (length updates)
             (if (= (length updates) 1) "" "s"))
    (let ((max-len (get-max-package-name-length updates)))
      (dolist (update updates)
        (message (format " + %%-%ds %%-%ds -> %%s" (+ max-len 2) 14)
                 (package-desc-name (plist-get update :new))
                 (package-version-join (package-desc-version (plist-get update :old)))
                 (package-version-join (package-desc-version (plist-get update :new)))))
      (when (y-or-n-p "\nProceed?")
        (message "")
        (save-window-excursion
          (dolist (update updates)
              (message "Updating %s" (package-desc-name (plist-get update :new)))
              (quiet!
               (package-install (plist-get update :new))
               (package-delete (plist-get update :old)))
              (message "  \e[32mDONE\e[0m"))))
    (message "\nFinished.")))

  (when (not updates)
    (message "Everything up to date.")))
