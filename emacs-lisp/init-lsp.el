;;; package --- tabuyos-init --- init-lsp.el
;;; Commentary:
;; This configuration for lsp
;;; Code:

;; LSPMode-
(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  :custom
  (lsp-auto-guess-root nil)
  (lsp-prefer-flymake nil)
  (lsp-file-watch-threshold 2000)
  (read-process-output-max (* 1024 1024))
  (lsp-eldoc-hook nil)
  (lsp-enable-snippet t)
  (lsp-keep-workspace-alive t)
  (lsp-enable-xref t)
  (lsp-enable-imenu t)
  (lsp-enable-completion-at-point t)
  :bind
  (:map lsp-mode-map ("C-c C-f" . lsp-format-buffer))
  :hook
  ((java-mode .lsp)
   (python-mode . lsp)
   (go-modejs-mode . lsp)
   (js2-mode . lsp)
   (typescript-mode . lsp)
   (web-mode . lsp)
   (c-mode . lsp)
   (c++-mode . lsp)
   (objc-mode . lsp)
   (go-mode . lsp-deferred)
	 ;; (before-save . lsp-format-buffer)
	 ;; (before-save . lsp-organize-imports)
	 ))
;; -LSPMode

;; LSPUI-
(use-package lsp-ui
  :after lsp-mode
  :diminish
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	([remap xref-find-references] . lsp-ui-peek-find-references)
	("C-c u" . lsp-ui-imenu)
	("M-i" . lsp-ui-doc-focus-frame))
  (:map lsp-mode-map
	("M-n" . forward-paragraph)
	("M-p" . backward-paragraph))
  :custom
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  (if (display-graphic-p)
      (setq lsp-ui-doc-use-webkit t))
  (define-advice lsp-ui-imenu (:after nil hide-lsp-ui-imenu-mode-line)
    (setq mode-line-format nil)))
;; -LSPUI

;; DAPMode-
(use-package dap-mode
  :diminish
  :bind
  (:map dap-mode-map
	(("<f12>" . dap-debug)
	 ("<f8>" . dap-continue)
	 ("<f9>" . dap-next)
	 ("M-<f11>" . dap-step-in)
	 ("C-M-<f11>" . dap-step-out)
	 ("<f7>" . dap-breakpoint-toggle))))
;; -DAPMode

(provide 'init-lsp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp.el ends here
