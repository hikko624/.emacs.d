;; companyはauto-comleteと同じような自動補完
(use-package company
  :ensure t
  :init
  ;; 全バッファで有効にする
  (global-company-mode)
  ;; ヘルプモード
  (company-quickhelp-mode)
  :config
  ;; 1個目を自動的に補完
  (setq company-auto-expand t)
  ;; デフォルトは0.5
  (setq company-idle-delay 0.5)
  ;; デフォルトは4、2文字目で補完開始
  (setq company-minimum-prefix-length 2)
  ;; 候補の一番下でさらに下に行こうとすると一番上に戻る
  (setq company-selection-wrap-around t)
  ;; auto-completeみたいな色にする
  ;; (set-face-attribute 'company-tooltip nil
  ;;                     :foreground "black" :background "lightgrey")
  ;; (set-face-attribute 'company-tooltip-common nil
  ;;                     :foreground "black" :background "lightgrey")
  ;; (set-face-attribute 'company-tooltip-common-selection nil
  ;;                     :foreground "white" :background "steelblue")
  ;; (set-face-attribute 'company-tooltip-selection nil
  ;;                     :foreground "black" :background "steelblue")
  ;; (set-face-attribute 'company-preview-common nil
  ;;                     :background nil :foreground "lightgrey" :underline t)
  ;; (set-face-attribute 'company-scrollbar-fg nil
  ;;                     :background "orange")
  ;; (set-face-attribute 'company-scrolnlbar-bg nil
  ;;                     :background "gray40")
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

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))
(use-package company-quickhelp
  :ensure t)
(use-package helm-company
  :ensure t
  :bind
  (:map company-mode-map
        ("C-:" . helm-company))
  (:map company-active-map
        ("C-:" . helm-company)))
;; (use-package phpactor :ensure t)
;; (use-package company-phpactor :ensure t)
;; (use-package company-php
;;   :ensure t
;;   :init
;;   (add-to-list 'company-backends 'company-ac-php-backend)
;;   (add-to-list 'company-backends 'company-dabbrev-code)
;;   (add-to-list 'company-backends 'company-capf)
;;   (add-to-list 'company-backends 'company-phpactor)
;;   (add-to-list 'company-backends 'company-files))
