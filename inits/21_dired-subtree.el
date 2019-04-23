(use-package dired-subtree
  :ensure t
  :config
  (bind-keys
   :map dired-mode-map
   ;; iを置き換え(展開する)
   ("i" . dired-subtree-insert)
   ;; org-modeのようにTABで折り畳む
   ("<tab>" . dired-subtree-remove)))
