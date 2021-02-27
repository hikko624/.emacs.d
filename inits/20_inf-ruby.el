(use-package inf-ruby
  :straight t
  :config
  (setq inf-ruby-default-implementation "pry")
  (setq inf-ruby-eval-binding "Pry.toplevel_binding")
  :hook
  (ruby-mode . inf-ruby-minor-mode)
  (inf-ruby-mode . ansi-color-for-comint-mode-on)
  )
