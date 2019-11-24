; -*- lexical-binding: t -*-
;; Mac用
;; "package.el - Emacs JP" http://emacs-jp.github.io/packages/package-management/package-el.html
(require 'package)
;; MELPA-stableを追加
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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
  :init
  (exec-path-from-shell-initialize)
  :config
  ;; (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "SDKROOT")
  )

(use-package init-loader
  :ensure t
  :config
  (init-loader-load "~/.emacs.d/inits"))
