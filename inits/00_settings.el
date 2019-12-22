;; *GNU Emacs* を開かない
(setq inhibit-startup-message t)

;; ベルを鳴らす代わりにスクリーンを点滅する
(setq visible-bell t)

;; ダイアログを抑止
(setq use-dialog-box nil)

;; ファイルの終端は必ず改行を入れる
(setq require-final-newline t)

;; 普通のエディタっぽく(?)範囲削除
(delete-selection-mode 1)

;; デフォルトではインデントにスペースを使う
(setq-default indent-tabs-mode nil)

;; 対応する括弧を強調
(show-paren-mode 1)

;; モードラインに行数と桁数を表示
(line-number-mode 1)
(column-number-mode 1)

;; ツールバーを非表示
(tool-bar-mode 0)

;; メニューバーを非表示
(menu-bar-mode 0)

;; command キーをメタキーとして使い、 option キーは修飾キーとして扱わない
(when (eq window-system 'ns)
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta))

(when (eq system-type 'darwin)
  (define-key key-translation-map [(meta ?¥)] [(meta ?\\)])
  (define-key key-translation-map [(control ?¥)] [(control ?\\)])
  (define-key key-translation-map [(meta control ?¥)] [(meta control ?\\)]))
 ;; (define-key key-translation-map [(super ?¥)] [(super ?\\)])

;; 日本語環境
;; (set-language-environment "Japanese")
;; (prefer-coding-system 'utf-8)
;; (set-default 'buffer-file-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)

(when window-system
  ;; ツールバーを非表示
  (tool-bar-mode 0)
  (setq default-frame-alist
        (append '(
                  ;; (foreground-color . "white")
                  ;; (background-color . "black")
                  ;; '(cursor-color . "white")
                  ;; (width . 150)
                  ;; (height . 50)
                  ;; (top . 22)
                  ;; (internal-border-width . 0)
                  ;; (scroll-bar-width . 14)
                  (alpha 90 60)
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
         ;; (asciifont "Monaco")
         (asciifont "Ricty Diminished Discord for Powerline")
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


;; 括弧の自動補完
(electric-pair-mode 1)

;; バッファの自動更新
(global-auto-revert-mode 1)
