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
             '("melpa-stable" . "https://melpa-stable.milkbox.net/packages/") t)
;; MELPAを追加
(add-to-list 'package-archives
             '("melpa" . "https://melpa.milkbox.net/packages/") t)
;; MELPA-stableを追加
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
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

(setq whitespace-style '(face tabs spaces trailing space-before-tab::tab indentation empty space-mark tab-mark))

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
    (flycheck-color-mode-line rspec-mode ruby-end ruby-factory projectile-rails helm-etags-plus ctags ctags-update flycheck point-undo company mykie auto-yasnippet el-autoyas helm-c-yasnippet popwin google-translate helm undo-tree))))

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
;; (global-company-mode)
;; デフォルトは0.5，nil
(setq company-idle-delay 0)
;; デフォルトは4
(setq company-minimum-prefix-length 2)
;; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq company-selection-wrap-around t)

;; インデントするコマンド自作
;; M-x electric-indent
(defun all-indent ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

(defun electric-indent ()
  (interactive)
  (if (use-region-p)
      (indent-region (region-beginning) (region-end))
    (all-indent)))

;; FlycheckとRuby
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))

;;  projectile
(require 'projectile)
(projectile-global-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)


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
(define-key global-map
  "\C-cG" 'scheme-other-window)

;; PHPに特化したことにしたい
;; トップディレクトリに
;; touch .ac-php-conf.json
;; を事前にしておき，M-x ac-php-remake-tags-all
;; (require 'cl)
;; (require 'php-mode)
;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (require 'company-php)
;;              (company-mode t)
;;              (ac-php-core-eldoc-setup) ;; enable eldoc
;;              (make-local-variable 'company-backends)
;;              (add-to-list 'company-backends 'company-ac-php-backend)))

;; helmの機能を使ったetag機能
(require 'helm-etags-plus)
(global-set-key "\M-." 'helm-etags-plus-select)
;;list all visited tags
(global-set-key "\M-*" 'helm-etags-plus-history)
;;go back directly
(global-set-key "\M-," 'helm-etags-plus-history-go-back)
;;go forward directly
(global-set-key "\M-/" 'helm-etags-plus-history-go-forward)

;;いつでもupdate (create) TAGS
(autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
(global-set-key "\C-cE" 'ctags-update)

;; C++環境構築
(require 'cc-mode)
;; c-mode-common-hook は C/C++ の設定
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "k&r") ;; カーニハン・リッチースタイル
            (setq indent-tabs-mode nil)  ;; タブは利用しない
            (setq c-basic-offset 2)      ;; indent は 2 スペース
            ))
;; ヘッダファイルが c++ として認識される
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; 構文チェック
;; checker の変更は M-x flycheck-select-checker
;; helm-flycheck で helm i/f から エラーを選択
(require 'flycheck)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(defmacro flycheck-define-clike-checker (name command modes)
  `(flycheck-define-checker ,(intern (format "%s" name))
     ,(format "A %s checker using %s" name (car command))
     :command (,@command source-inplace)
     :error-patterns
     ((warning line-start (file-name) ":" line ":" column ": 警告:" (message) line-end)
      (error line-start (file-name) ":" line ":" column ": エラー:" (message) line-end))
     :modes ',modes))
(flycheck-define-clike-checker c-gcc-ja
                               ("gcc" "-fsyntax-only" "-Wall" "-Wextra")
                               c-mode)
(add-to-list 'flycheck-checkers 'c-gcc-ja)
(flycheck-define-clike-checker c++-g++-ja
                               ("g++" "-fsyntax-only" "-Wall" "-Wextra" "-std=c++11")
                               c++-mode)
(add-to-list 'flycheck-checkers 'c++-g++-ja)

;;リファクタリング
(require 'srefactor)
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)

;; C++補完
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(require 'auto-complete-c-headers)
;; (add-hook 'c++-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))
;; (add-hook 'c-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "clang-complete")
  (setq ac-sources (append ac-sources '(ac-source-clang-async)))
  (ac-clang-launch-completion-process))

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

(require 'function-args)
(fa-config-default)

(define-key function-args-mode-map (kbd "M-o") nil)
(define-key c-mode-map (kbd "C-M-:") 'moo-complete)
(define-key c++-mode-map (kbd "C-M-:") 'moo-complete)




;; ドキュメント表示
(require 'c-eldoc)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
(setq c-eldoc-buffer-regenerate-time 60)

;; デバッグ
(require 'realgud)

;; タグ
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

;; use helm
(setq ggtags-completing-read-function nil)

;; use eldoc
(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

;; imenu
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; 自動でプロジェクトのルートディレクトリを探して, それ以下のファイルを見つけたり色々できる.
(require  'projectile)
(projectile-global-mode)

;; windows indexing 高速化のおまじない.
(setq projectile-indexing-method 'alien)

;; 大きいプロジェクトだと劇的に速度が改善するらしい.
(setq projectile-enable-caching t)


;; make
(require 'helm-make)

(eval-after-load 'makefile-mode
  '(define-key makefile-mode-map (kbd "M-\"") 'helm-make-projectile))
(define-key c-mode-map (kbd "M-\"") 'helm-make-projectile)
(define-key c++-mode-map (kbd "M-\"") 'helm-make-projectile)
