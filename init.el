

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)


;; (package-initialize)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;; 自动加载这个文件并且执行test-autoload
;; (autoload 'test-autoload "init-better-defaults")

;; (test-autoload)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
(put 'dired-find-alternate-file 'disabled nil)
