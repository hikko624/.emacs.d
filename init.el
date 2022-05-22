;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

;; Melpaを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; gnuを追加
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

;; (package-initialize)

;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; if you use :diminish
(unless (package-installed-p 'diminish)
  (package-refresh-contents)
  (package-install 'diminish))
(eval-when-compile
  (require 'diminish))

;; if you use any :bind variant
(unless (package-installed-p 'bind-key)
  (package-refresh-contents)
  (package-install 'bind-key))
(eval-when-compile
  (require 'bind-key))

;; use-packageのルール
;; :init パッケージを起動する前に設定するもの
;; :config パッケージを起動したあとに設定するもの
;; (straight-use-package 'use-package)
;; (straight-use-package 'diminish)
;; (straight-use-package 'bind-key)

;; straight.elを呼び出して自動インストールをする(:ensure tが要らない
;; (setq straight-use-package-by-default t)

;; foo.txt~ とかのバックアップファイルを作るけど一箇所のファイルに作っておく
(setq make-backup-files t)
(setq backup-directory-alist '((".*" . "~/.emacs.d/.backups/")))

;; .#foo.txt# とかの自動保存ファイルを作らない
(setq auto-save-default nil)

;; .#foo.txt とかのロックファイルを作らない
(setq create-lockfiles nil)

;; custom-set-variablesを外部ファイルに移動
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file)

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(use-package use-package-ensure-system-package
  :ensure t)

;; init.el外にも設定ファイルを記述できるようにする設定
(use-package init-loader
  :ensure t)
(init-loader-load "~/.emacs.d/inits")
