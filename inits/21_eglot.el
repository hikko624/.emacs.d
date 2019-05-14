;; (use-package eglot
;;   :ensure t
;;   :commands (eglot eglot-ensure)
;;   :hook ((c-mode . eglot-ensure)
;;          (c++-mode . eglot-ensure))
;;   )
;; (require 'eglot)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)
