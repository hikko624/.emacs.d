;; (use-package company-flow
;;   :ensure t
;;   :init
;;   (add-to-list 'company-backends 'company-flow)
;;   :config
;;   (defun flow/set-flow-executable ()
;;   (interactive)
;;   (let* ((os (pcase system-type
;;                ('darwin "osx")
;;                ('gnu/linux "linux64")
;;                (_ nil)))
;;          (root (locate-dominating-file  buffer-file-name  "node_modules/flow-bin"))
;;          (executable (car (file-expand-wildcards
;;                            (concat root "node_modules/flow-bin/*" os "*/flow")))))
;;     (setq-local company-flow-executable executable)
;;     ;; These are not necessary for this package, but a good idea if you use
;;     ;; these other packages
;;     (setq-local flow-minor-default-binary executable)
;;     (setq-local flycheck-javascript-flow-executable executable)))

;; ;; Set this to the mode you use, I use rjsx-mode
;; (add-hook 'rjsx-mode-hook #'flow/set-flow-executable t)
;;   )
