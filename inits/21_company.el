;; companyはauto-comleteと同じような自動補完

(use-package company
  :ensure t
  :init
  ;; 全バッファで有効にする
  (global-company-mode)
  (company-quickhelp-mode +1)
  :config
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
  :bind (
         ;; 各種メジャーモードでも C-M-iで company-modeの補完を使
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
