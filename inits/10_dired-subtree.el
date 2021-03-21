(use-package dired-subtree
  :ensure t
  :bind (
         :map dired-mode-map
         ;; iを置き換え(展開する)
         ("i" . dired-subtree-insert)
         ;; org-modeのようにTABで折り畳む(magitのようにtabで展開もできるようにする)
         ("<tab>" . dired-subtree-remove)
         ;; ("<tab>" . dired-subtree-toggle)
         ))
