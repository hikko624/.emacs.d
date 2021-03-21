(use-package org-bullets
  :ensure t
  :hook
  (org-mode . (lambda ()
                (org-bullets-mode 1))))
