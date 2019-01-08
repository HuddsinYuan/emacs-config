
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)

      )
  )

;; open line number
(global-linum-mode t)

;; electric indent mode off
(electric-indent-mode t)

(when (memq window-system '(mac ns))
  (setq initial-frame-alist (quote ((fullscreen . maximized))))
  )

(setq-default cursor-type 'hbar)

(setq inhibit-splash-screen 1)

(provide 'init-ui)
