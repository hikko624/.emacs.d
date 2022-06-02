(use-package undo-tree
  :ensure t
  :diminish
  :init
  (global-undo-tree-mode)
  :custom (
           ;; (undo-tree-auto-save-history t)
           ;; (undo-tree-load-history t)
          (undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree"))))
)
