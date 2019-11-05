; -*- lexical-binding: t -*-
;; Mac用
;; "package.el - Emacs JP" http://emacs-jp.github.io/packages/package-management/package-el.html
(require 'package)
;; MELPA-stableを追加
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; MELPAを追加
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; MARMALADEを追加
;; (add-to-list 'package-archives
;;            '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
;; (add-to-list 'package-archives
;;              '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; update package
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
;; init-loader
(setq debug-on-error t)
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize)
  ;; (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "SDKROOT")
  )

(use-package init-loader
  :ensure t
  :config
  (init-loader-load "~/.emacs.d/inits"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dracula-theme ruby-end php-mode go-mode which-key undo-tree rubocop rspec-mode helm-projectile projectile-rails projectile powerline nyan-mode nlinum dap-mode lsp-treemacs helm-lsp company-lsp lsp-ui lsp-mode helm-ls-git helm-swoop helm-c-yasnippet flycheck-golangci-lint flycheck exec-path-from-shell dumb-jump dired-subtree ctags-update helm-company company-quickhelp company-box company init-loader use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-empty ((((class color) (background dark)) :background "#200040" :foreground "darkgray") (((class color) (background light)) :background "khaki" :foreground "lightgray") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-hspace ((((class color) (background dark)) :background "DeepPink3" :foreground "pink") (((class color) (background light)) :background "DeepPink2" :foreground "MidnightBlue") (t nil)))
 '(whitespace-indentation ((((class color) (background dark)) :background "grey16" :foreground "DeepPink") (((class color) (background light)) :background "chartreuse" :foreground "DeepPink") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-space ((((class color) (background dark)) :background "DeepPink4" :foreground "pink") (((class color) (background light)) :background "DeepPink" :foreground "MidnightBlue") (t nil)))
 '(whitespace-space-before-tab ((((class color) (background dark)) :background "DeepPink" :foreground "firebrick") (((class color) (background light)) :background "DeepPink" :foreground "firebrick") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-tab ((((class color) (background dark)) :background "grey16" :foreground "darkgray") (((class color) (background light)) :background "chartreuse" :foreground "MidnightBlue") (t :inverse-video t)))
 '(whitespace-trailing ((((class color) (background dark)) :background "#400080") (((class color) (background light)) :background "LightGreen") (t :inverse-video t :weight bold :underline t))))
