(use-package org-bullets
  :straight t
  :hook
  (org-mode . (lambda ()
                (org-bullets-mode 1))))
