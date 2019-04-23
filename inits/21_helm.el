;; helmの設定
(use-package helm
  :config
  ;; helmのあいまい一致
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t
        helm-M-x-fuzzy-match        t)
  :bind (
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("M-x" . helm-M-x)
         ("C-x C-b" . helm-buffers-list)
         :map helm-map
         ;; helm-select-actionと交換
         ("<tab>"   . helm-execute-persistent-action)
         ("C-i"     . helm-execute-persistent-action)
         ("C-z"     . helm-select-action)
         ("C-c y" . helm-yas-complete)
         )
  :init
  (helm-mode 1)
  (helm-autoresize-mode t))

;; helmでyasnippet選択
(use-package helm-c-yasnippet
  :ensure t
  :init
  (setq helm-yas-space-match-any-greedy t))

(use-package helm-swoop
  :ensure t
  :bind (
         ("C-s" . helm-swoop)))
