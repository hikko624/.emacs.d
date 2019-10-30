(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize)
  ;; (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "SDKROOT")
  )
