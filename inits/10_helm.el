(use-package helm
  :straight t
  :diminish
  ;; https://github.com/emacs-helm/helm/wiki/Fuzzy-matching
  :bind (
         ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-s" . helm-occur)
         ("C-x C-b" . helm-elscreen)
         ("C-x C-r". helm-recentf)
         :map helm-map
         ;; helm-select-actionと交換
         ("<tab>"   . helm-execute-persistent-action)
         ("C-i"     . helm-execute-persistent-action)
         ("C-z"     . helm-select-action)
         )
  :config
  (helm-mode 1)
  :init
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t))


