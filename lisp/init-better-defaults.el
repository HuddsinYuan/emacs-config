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


;; defadvice
;; define-advice
;; difference

;; hide ^M (dos coding ) in unix coding system
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;; remove ^M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

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

;; highlight current line
(global-hl-line-mode t)

;; pop up window vertically
;;  (setq split-window-vertically 1)

;; dwim do what i mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;; set default encoding.
(set-language-environment "UTF-8")

(provide 'init-better-defaults)
