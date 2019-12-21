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
  :bind (
         ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
         ("C-M-i" . company-complete)
         :map company-active-map
         ;; C-n, C-pで補完候補を次/前の候補を選択
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ;; C-sで絞り込む
         ("C-s" . company-filter-candidates)
         ;; TABで候補を設定
         ("<tab>" . company-complete-selection)
         :map company-search-map
         ;; C-n, C-pで補完候補を次/前の候補を選択
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)))
