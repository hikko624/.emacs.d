(use-package rspec-mode
  :straight t
  :after (inf-ruby)
  :hook
  (inf-ruby-switch-setup)
  :config
  (rspec-install-snippets))
