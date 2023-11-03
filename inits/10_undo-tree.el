(use-package undo-tree
  :ensure t
  :diminish
  :init
  (global-undo-tree-mode)
  :custom (
           (undo-tree-auto-save-history nil)
           (undo-tree-load-history nil)
          (undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree"))))
)
