(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
  )

(require 'cl)

;; add packages
(defvar ychen/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 swiper
			 smartparens
			 exec-path-from-shell
			 counsel
			 popwin
			 highlight-parentheses
			 ) "Default packages")

(setq package-selected-packages ychen/packages)

(defun ychen/packages-installed-p ()
  (loop for pkg in ychen/packages ;; for-each in common lisp
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t))
  )

(unless (ychen/packages-installed-p )
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (dolist (pkg ychen/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg)))
  )


;; config for hungry-delete
;; 1. search this package on melpa
;; 2. goto package github
;; 3. read the usage in the readme
(require 'hungry-delete)
(global-hungry-delete-mode)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;; remove right-' in emacs-lisp-mode
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; global auto-company-mode on 
(global-company-mode t)

(setq custom-safe-themes t)

;; add theme for monokai
(load-theme 'monokai t)

(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
