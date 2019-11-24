;; helmの設定
(use-package helm
  :ensure t
  :config
  ;; helmのあいまい一致
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t
        helm-M-x-fuzzy-match        t
        helm-apropos-fuzzy-match    t
        )
  :bind (
         ("C-x b"   . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("M-x" . helm-M-x)
         ("C-x C-b" . helm-buffers-list)
         ("C-; h". helm-apropos)
         :map helm-map
         ;; helm-select-actionと交換
         ("<tab>"   . helm-execute-persistent-action)
         ("C-i"     . helm-execute-persistent-action)
         ("C-z"     . helm-select-action)
         ("C-c y"   . helm-yas-complete)
         )
  :init
  (helm-mode 1)
  (helm-autoresize-mode t))

;; helmでyasnippet選択
(use-package helm-c-yasnippet
  :ensure t
  :init
  (setq helm-yas-space-match-any-greedy t)
  :bind (
         ("C-c y" . helm-yas-complete)))

(use-package helm-swoop
  :ensure t
  :bind (
         ("C-s" . helm-swoop)))

;; (use-package helm-ls-git
;;   :ensure t
;;   :bind (
;;          ("C-x C-d" . helm-browse-project)))
