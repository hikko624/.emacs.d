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
