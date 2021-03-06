;;; -*- coding: utf-8 -*-
;;; init-go.el
;;
;; @autor: tabuyos
;; @since: 1.0
;; @date: 2021-06-27
;;
;;; Commentary:
;;
;; This is initial configuration for golang.
;;
;;; Code:

;; GoMode-
(use-package go-mode
  :ensure t
  :commands go-mode
  :bind (:map go-mode-map
  	 ("C-c C-j" . godef-jump)
  	 ("M-." . pop-tag-mark)
  	 ("C-c C-f" . gofmt)
  	 ("C-c C-k" . godoc)
  	 ("C-c C-g" . go-goto-imports)
  	 ("C-c C-d" . godef-describe)
  	 ("C-c C-a" . go-import-add)
		 ("C-c C-c" . go-run)
  	 )
  :hook ((go-mode . lsp-deferred)
				 ;; use goimports for format go code
  			 ;; (before-save . gofmt-before-save)
				 (before-save . (lambda ()
													(if (eq major-mode 'go-mode)
															(progn
																(lsp-format-buffer)
																(lsp-organize-imports)))))
				 )
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  (setq-default tab-width 2)
  (use-package godoctor)
  (setq gofmt-command "goimports")
  )
;; -GoMode

;; GoComplete-
(use-package go-complete
  :hook
  ((completion-at-point-functions . go-complete-at-point)))
(use-package go-autocomplete)
;; -GoComplete

;; FlycheckGometailinter-
(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))
;; -FlycheckGometailinter

;; GoPlayground-
(use-package go-playground
	:ensure t)
;; -GoPlayground

;; GoDLV-
(use-package go-dlv
  :ensure t)
;; -GoDLV

(provide 'init-go)
;;; init-fonts.el ends here.
