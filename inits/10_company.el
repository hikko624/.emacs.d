(use-package company
  :straight t
  :diminish
  :init
  ;; 全バッファで有効にする
  (global-company-mode)
  :config
  ;; デフォルトは4、2文字目で補完開始
  (setq company-minimum-prefix-length 2)
  ;; 候補の一番下でさらに下に行こうとすると一番上に戻る
  (setq company-selection-wrap-around t)
  )

