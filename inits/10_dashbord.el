(use-package dashboard
  :straight t
  :init
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
  (setq dashboard-set-navigator t)
  :config
  (dashboard-setup-startup-hook))
