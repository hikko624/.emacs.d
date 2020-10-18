(use-package golden-ratio
  :straight t
  :init
  (golden-ratio-mode 1)
  :config
  ;; ウィンドウの大きさを変更しないメジャーモード
  (setq golden-ratio-exclude-modes '(calendar-mode))
  ;;; ウィンドウ選択系のコマンドで作用させる
  ;; (setq golden-ratio-extra-commands
  ;;       '(windmove-left windmove-right windmove-down windmove-up))
  ;; ウィンドウの大きさを変更しないバッファ名
  ;; (setq golden-ratio-exclude-buffer-names '(" *Org tags*" " *Org todo*"))
  ;; ウィンドウの大きさを変更しないバッファ名の正規表現
  ;; (setq golden-ratio-exclude-buffer-regexp '("\\*helm"))
  )
