;; *GNU Emacs* を開かない
(setq inhibit-startup-message t)

;; ベルを鳴らす代わりにスクリーンを点滅する
(setq visible-bell t)

;; ダイアログを抑止
(setq use-dialog-box nil)

;; デフォルトではインデントにスペースを使う
(setq-default indent-tabs-mode nil)

;; 普通のエディタっぽく(?)範囲削除
(delete-selection-mode 1)

;; スクロール時に画面端までポイントを動かす
(setq scroll-error-top-bottom t)

;; 論理行で移動
(setq line-move-visual nil)

;; 対応する括弧を強調
(show-paren-mode 1)

;; モードラインに行数と桁数を表示
(line-number-mode 1)
(column-number-mode 1)

;; 日本語環境
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8)

;; ウインドウを分割しても行を折り返さない
(setq truncate-partial-width-windows nil) ; default 50

;; タイトルバー
;; (setq frame-title-format invocation-name)

(when window-system
  ;; ツールバーを非表示
  (tool-bar-mode 0)
  (setq default-frame-alist
        (append '((foreground-color . "white")
                  (background-color . "black")
                  ;; '(cursor-color . "white")
                  ;; (width . 150)
                  ;; (height . 50)
                  ;; (top . 22)
                  (internal-border-width . 0)
                  (scroll-bar-width . 14)
                  (alpha 90 75)
                  ;; (font . "ricty-13.5")
                  ;; (font . "ricty discord-13.5")
                  )
                default-frame-alist)))

;; (set-frame-height (selected-frame) 50)
(when (eq window-system 'ns)
  ;; open -a Emacs したときに新しいフレームを作らない
  (setq ns-pop-up-frames nil)
  ;; バッファにファイルをドラッグドロップしてファイルを開く
  (define-key global-map [ns-drag-file] 'ns-find-file)
  ;; フォントの設定
  (let* ((size 13.5)
         (asciifont "Monaco")
         ;; (asciifont "Ricty Discord")
         (jpfont "Hiragino Maru Gothic ProN")
         ;; (jpfont asciifont)
         (h (round (* size 10))))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont)))

(unless window-system
  (set-face-foreground 'default "white" (selected-frame))
  (set-face-background 'default "black" (selected-frame)))

;; 括弧を薄くする
(defvar paren-face 'paren-face)
(defface paren-face
  '((((class color) (background light)) :foreground "#666666")
    (((class color) (background dark)) :foreground "#999999")
    (t nil))
  "face for parentheses"
  :group 'basic-faces)

(setq lisp-font-lock-keywords-2
      (append '(("(\\|)" . paren-face))
              lisp-font-lock-keywords-2))

;; custom-set-variablesを外部ファイルに移動
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file)
;; 左に行数を表示
;; (use-package linum
;;   :init
;;   (global-linum-mode t)
;;   :custom
;;   (linum-delay t))

(use-package eldoc)

(use-package all-the-icons
  :ensure t)

;; foo.txt~ とかのバックアップファイルを作るけど一箇所のファイルに作っておく
(setq make-backup-files t)
(setq backup-directory-alist '((".*" . "~/.emacs.d/.backups/")))

;; .#foo.txt# とかの自動保存ファイルを作らない
(setq auto-save-default nil)

;; .#foo.txt とかのロックファイルを作らない
(setq create-lockfiles nil)

;; (require 'shell-command)
;; (shell-command-completion-mode 1)

;; シェルからエディタを起動するときに emacs-client を使う
;; 既に開いている Emacs をサーバとして利用する
;; .bashrc に
;; export EDITOR='emacsclient --alternate-editor vim'
;; などと書いておくとよい

;; mykieはキーの自動登録するパッケージ
;; (require 'mykie)
;; autoyasnippetのキー設定
;; (setq aya-create-with-newline t)
;; (mykie:global-set-key "C-x C-y"
;;   :default aya-expand
;;   :C-u! aya-create)

;; 括弧の自動補完
(electric-pair-mode 1)

;; バッファの自動更新
(global-auto-revert-mode 1)

;; インデントするコマンド自作
;; M-x file-indent
;; (defun all-indent ()
;;   (interactive)
;;   (save-excursion
;;     (indent-region (point-min) (point-max))))

;; (defun file-indent ()
;;   (interactive)
;;   (if (use-region-p)
;;       (indent-region (region-beginning) (region-end))
;;     (all-indent)))

;; directly tree
;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)

;; (require 'direx-project)
;; (push '(direx:direx-mode :position left :width 50 :dedicated t)
;;       popwin:special-display-config)
;; (global-set-key (kbd "C-x C-j") 'direx-project:jump-to-project-root-other-window)
;; (require 'dirtree)
;; (require 'eproject)
;; (defun ep-dirtree ()
;;   (interactive)
;;   (dirtree eproject-root t))

;; C/C++関連の設定
;; (require 'irony)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; (add-to-list 'company-backends 'company-irony)

;; (lsp-ui-peek-enable t)
;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
;; あとでみる
;; https://gist.github.com/kubo39/3274584
(use-package generic-x)
