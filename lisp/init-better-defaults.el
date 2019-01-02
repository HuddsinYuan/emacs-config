(setq ring-bell-function 'ignore)


;; open line number
(global-linum-mode t)

(global-auto-revert-mode t)

;; abbrev mode on
;; seem no effect
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8zl" "ychen")
					    ("8ms" "Microsoft")
					    ))


;; don't back up filesOB
(setq make-backup-files nil)
(setq auto-save-default nil)

;; open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(defun test-autoload()
  (interactive)
  (message "test auto load")
  )

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


;; yes no / y n
(fset 'yes-or-no-p 'y-or-n-p)

;; always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; dired mode
(put 'dired-find-alternate-file 'disabled nil)

;; C-x C-j open current folder
(require 'dired-x)

(setq dired-dwim-target t)

(provide 'init-better-defaults)
