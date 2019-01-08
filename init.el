;; -*- lexical-binding: t -*-

;; Mac用
;; command キーをメタキーとして使い、 option キーは修飾キーとして扱わない
(when (eq window-system 'ns)
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta))

(setq help-char nil)
(global-set-key "\C-h" 'delete-backward-char)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

;; super キーがない人向け
;; kill-this-buffer はデフォルトでは s-k にバインドされている
(global-set-key "\C-ck" 'kill-this-buffer)

(when (eq system-type 'darwin)
  (define-key key-translation-map [(meta ?¥)] [(meta ?\\)])
  (define-key key-translation-map [(control ?¥)] [(control ?\\)])
  (define-key key-translation-map [(meta control ?¥)] [(meta control ?\\)]))
;; (define-key key-translation-map [(super ?¥)] [(super ?\\)])

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

;; ウインドウを分割しても行を折り返さない
(setq truncate-partial-width-windows nil) ; default 50

;; "package.el - Emacs JP" http://emacs-jp.github.io/packages/package-management/package-el.html
(require 'package)
;; https いける？
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
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; インストールしていないパッケージをまとめてインストール
(progn
  (package-refresh-contents)
  (dolist (package
           '(undo-tree popwin
             flycheck
             company
             yasnippet
             helm helm-c-yasnippet helm-company

             ))
    (unless (package-installed-p package)
      (package-install package))))



;; タイトルバー
;; (setq frame-title-format invocation-name)

(when window-system
  ;; ツールバーを非表示
  (tool-bar-mode 0)
  (setq default-frame-alist
        (append '((foreground-color . "white")
                  (background-color . "black")
                  ;; '(cursor-color . "white")
                  (width . 150)
                  (height . 50)
                  (top . 22)
                  (internal-border-width . 0)
                  (scroll-bar-width . 14)
                  (alpha 75 50)
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

;; 空白の可視化
;;	　
;;       "\\(\\( \\|ࢠ\\|ठ\\|ภ\\|༠\\)+\\)"
(require 'whitespace)

(setq whitespace-style '(facetabs spaces trailing space-before-tab::tab indentation empty space-mark tab-mark))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (space-mark ?\u200B [?\u2423])
        (space-mark ?\uFEFF [?\u2423])
        ;; WARNING: タブ幅が1文字分しかない状況ではタブ位置がずれる問題がある
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(setq whitespace-space-regexp "\\([\u2002-\u200B\u3000\uFEFF]+\\)")
(setq whitespace-hspace-regexp "\\(\\( \\|ࢠ\\|ठ\\|ภ\\|༠\\)+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
 '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
 '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
 '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
 '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t))))
 '(whitespace-empty ((((class color) (background dark)) :background "#200040" :foreground "darkgray") (((class color) (background light)) :background "khaki" :foreground "lightgray") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-hspace ((((class color) (background dark)) :background "DeepPink3" :foreground "pink") (((class color) (background light)) :background "DeepPink2" :foreground "MidnightBlue") (t nil)))
 '(whitespace-indentation ((((class color) (background dark)) :background "grey16" :foreground "DeepPink") (((class color) (background light)) :background "chartreuse" :foreground "DeepPink") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-space ((((class color) (background dark)) :background "DeepPink4" :foreground "pink") (((class color) (background light)) :background "DeepPink" :foreground "MidnightBlue") (t nil)))
 '(whitespace-space-before-tab ((((class color) (background dark)) :background "DeepPink" :foreground "firebrick") (((class color) (background light)) :background "DeepPink" :foreground "firebrick") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-tab ((((class color) (background dark)) :background "grey16" :foreground "darkgray") (((class color) (background light)) :background "chartreuse" :foreground "MidnightBlue") (t :inverse-video t)))
 '(whitespace-trailing ((((class color) (background dark)) :background "#400080") (((class color) (background light)) :background "LightGreen") (t :inverse-video t :weight bold :underline t))))

(global-whitespace-mode 1)


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



;; 左に行数を表示
(require 'linum)
(setq linum-delay t)
(global-linum-mode t)

(require 'eldoc)

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; 最近開いたファイル
(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 1000)
(recentf-load-list)

;; recentf を自動保存
(defvar recentf-auto-save-timer
  (run-with-idle-timer 300 t 'recentf-save-list))

;; https://melpa.org/#/recentf-ext
;; window configuration が変わる度に recentf を更新
;; dired で開いたディレクトリを recentf に追加
;; (require 'recentf-ext)

;; https://melpa.org/#/undo-tree
;; (global-undo-tree-mode 1)
;; (define-key undo-tree-map "\C-_" 'undo-tree-switch-branch)

;; 同一ファイル名を開いた時に, バッファ名をユニークにする
(require 'uniquify)
;; [ファイル名]<[ディレクトリ名]>
;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; [ディレクトリ名]/[ファイル名]
(setq uniquify-buffer-name-style 'forward)

;; shebangがあるとき実行可能属性を付加
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; デフォルトでは #! だけで script になるので #!/ に
(defadvice executable-make-buffer-file-executable-if-script-p
    (around my-script-p activate)
  (and (>= (buffer-size) 3)
       (save-restriction
         (widen)
         (string= "#!/" (buffer-substring (point-min) (+ 3 (point-min)))))
       ad-do-it))

;; (require 'shell-command)
;; (shell-command-completion-mode 1)

;; シェルからエディタを起動するときに emacs-client を使う
;; 既に開いている Emacs をサーバとして利用する
;; .bashrc に
;; export EDITOR='emacsclient --alternate-editor vim'
;; などと書いておくとよい

(require 'server)
(unless (server-running-p)
  ;; サーバ起動
  (server-start)
  ;; クライアントを終了するとき終了するかどうかを聞かない
  (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dirtree eproject tree-mode windata company-quickhelp company-irony company-irony-c-headers direx flycheck-color-mode-line projectile-rails helm-etags-plus ctags ctags-update flycheck point-undo company mykie auto-yasnippet el-autoyas helm-c-yasnippet popwin google-translate helm undo-tree))))

;; yasnippetの設定
(require 'yasnippet)
(setq yas-snippet-dirs
      '(
        ;; 自作のsnippets
        "~/.emacs.d/mysnippets"
        ;; ネッツから拾ってきたsnippets
        "~/.emacs.d/snippets"
        ))
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
;; yas起動
(yas-global-mode 1)

;; helmの設定
(require 'helm)
;; いつかやる予定

;; mykieはキーの自動登録するパッケージ
(require 'mykie)
;; autoyasnippetのキー設定
(setq aya-create-with-newline t)
(mykie:global-set-key "C-x C-y"
  :default aya-expand
  :C-u! aya-create)

;; companyはauto-comleteと同じような自動補完
(require 'company)
;; 全バッファで有効にする
(global-company-mode)
;; デフォルトは0.5，nil
(setq company-idle-delay 0)
;; デフォルトは4
(setq company-minimum-prefix-length 1)
;; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq company-selection-wrap-around t)

;; auto-completeみたいな色にする

(set-face-attribute 'company-tooltip nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")

(global-set-key (kbd "C-M-i") 'company-complete)

(company-quickhelp-mode +1)

;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;; TABで候補を設定
(define-key company-active-map (kbd "C-i") 'company-complete-selection)

;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

;; インデントするコマンド自作
;; M-x file-indent
(defun all-indent ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

(defun file-indent ()
  (interactive)
  (if (use-region-p)
      (indent-region (region-beginning) (region-end))
    (all-indent)))

;;  projectile
(require 'projectile)
(projectile-global-mode)

(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "/usr/local/bin/gosh -i")

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run Gauche on other window"
  (interactive)
  (split-window-horizontally (/ (frame-width) 2))
  (let ((buf-name (buffer-name (current-buffer))))
    (scheme-mode)
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme scheme-program-name)
    (switch-to-buffer-other-window
     (get-buffer-create buf-name))))
;; Ctrl+cを押したあとにShift+gでgoshのターミナル起動
;; C=x C-eでデバッグできる
(define-key global-map
  "\C-cG" 'scheme-other-window)

;; helmの機能を使ったetag機能
(require 'helm-etags-plus)
(global-set-key "\M-." 'helm-etags-plus-select)
;;list all visited tags
(global-set-key "\M-*" 'helm-etags-plus-history)
;;go back directly
(global-set-key "\M-," 'helm-etags-plus-history-go-back)
;;go forward directly
(global-set-key "\M-/" 'helm-etags-plus-history-go-forward)

;; directly tree
;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)

;; (require 'direx-project)
;; (push '(direx:direx-mode :position left :width 50 :dedicated t)
;;       popwin:special-display-config)
;; (global-set-key (kbd "C-x C-j") 'direx-project:jump-to-project-root-other-window)
(require 'dirtree)
(require 'eproject)
(defun ep-dirtree ()
  (interactive)
  (dirtree eproject-root t))


;;いつでもupdate (create) TAGS
(autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
(global-set-key "\C-cE" 'ctags-update)

;; C/C++関連の設定
(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-to-list 'company-backends 'company-irony) ; backend追加

;; flycheck c/c++設定
(require 'flycheck)
(add-hook 'c-mode-common-hook 'flycheck-mode)
