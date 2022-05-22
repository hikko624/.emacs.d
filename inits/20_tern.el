;; 手動でインストールする場合はこれ
;; (use-package tern
;;   :load-path "site-lisp/tern-emacs"
;;   :ensure-system-package (tern . "npm i -g tern")
;;   :init
;;   (autoload 'tern-mode "tern.el" nil t)
;;   (use-package tern-auto-complete
;;     :no-require t
;;     :config
;;     (tern-ac-setup)))

;; (use-package tern
;;   :defer t
;;   :diminish tern-mode
;;   :ensure t
;;   :ensure-system-package (tern . "npm i -g tern")
;;   :hook (js-mode . tern-mode))

;; ;; auto-completion for Tern
;; (use-package tern-auto-complete
;;   :ensure t
;;   :after tern
;;   :config
;;   (tern-ac-setup))
