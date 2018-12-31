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
			 counsel
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

(setq custom-safe-themes t)

;; (package-initialize)

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; open line number
(global-linum-mode t)

;; electric indent mode off
(electric-indent-mode t)

(setq-default cursor-type 'hbar)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files) 

;; global auto-company-mode on 
(global-company-mode t)

;; don't back up filesOB
(setq-default make-backup-files -1)
(setq auto-save-default nil)

;; add hook for () pareness match.
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; show current line
(global-hl-line-mode t)

;; add theme for monokai
(load-theme 'monokai t)

;; config for hungry-delete
;; 1. search this package on melpa
;; 2. goto package github
;; 3. read the usage in the readme 
(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for smex : enhance M-x
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; config for swiper
;; (require 'swiper)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 3)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
