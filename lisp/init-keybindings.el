;; config for swiper
;; (require 'swiper)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-s o") 'occur-dwim)
;; (global-set-key (kbd "C-SPC") 'set-mark-command)

(global-set-key (kbd "M-0") 'er/expand-region)

(global-set-key (kbd "M-s e") 'iedit-mode)

(defun split-window-horizontally()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  )

(defun split-window-vertically()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  )


(global-set-key (kbd "C-c h") 'split-window-horizontally)
(global-set-key (kbd "C-c v") 'split-window-vertically)

(global-set-key (kbd "C-c a") 'helm-do-ag-project-root)


;;(require 'dired)
;; 避免用require 全部加载进来, 在开启dired mode之后才开始执行按键绑定 
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  )

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-keybindings)
