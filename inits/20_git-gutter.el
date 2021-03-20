(use-package git-gutter
  :ensure t
  :diminish
  :bind
  (
   ("C-x C-g" . git-gutter)
   ("C-x v =" . git-gutter:popup-hunk)
   ("C-x p" . git-gutter:previous-hunk)
   ("C-x n" . git-gutter:next-hunk)
   ("C-x v s" . git-gutter:stage-hunk)
   ("C-x v r" . git-gutter:revert-hunk)
   ("C-x v SPC" . #'git-gutter:mark-hunk)
   )
  :config
  (global-git-gutter-mode t))
