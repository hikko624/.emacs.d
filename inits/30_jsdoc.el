;; [Minimal Type Inference] When default values are provided, then we can infer
;; the type of the arguments.
;;
;; Use: Run “M-x jsdoc” on a JS function.
;;
;; (use-package jsdoc
;;   :ensure t
;;   :quelpa (jsdoc
;;            :fetcher github
;;            :repo "isamert/jsdoc.el")
;;   :config
;;   (use-package tree-sitter
;;     :ensure t)        ;; Required dependencies
;;   (use-package tree-sitter-langs
;;     :ensure t)
;;   :hook (js-mode . tree-sitter-mode))
