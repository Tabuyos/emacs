;;; -*- coding: utf-8 -*-
;;; init-package.el
;;
;; @autor: tabuyos
;; @since: 1.0
;; @date: 2021-06-27
;;
;;; Commentary:
;;
;; This is package file.
;;
;;; Code:

;; Packages-
(unless (bound-and-true-p package-user-dir)
  (defvar package-user-dir nil
    "package user's directory for elpa."))

(unless (bound-and-true-p package-archives)
  (defvar package-archives nil
    "package archives address."))

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
      package-archives
      '(("gnu-tsinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa-tsinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("melpa-stable-tshinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
        ("org-tsinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ;; ("gnu-tencent" . "http://mirrors.cloud.tencent.com/elpa/gnu/")
        ;; ("melpa-tencent" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
        ;; ("melpa-stable-tencent" . "http://mirrors.cloud.tencent.com/elpa/melpa-stable/")
        ;; ("org-tencent" . "http://mirrors.cloud.tencent.com/elpa/org/")
        ;; ("gnu-emacs-china" . "http://elpa.emacs-china.org/gnu/")
        ;; ("melpa-emacs-china" . "http://elpa.emacs-china.org/melpa/")
        ;; ("melpa-stable-emacs-china" . "http://elpa.emacs-china.org/melpa-stable/")
        ;; ("org-emacs-china" . "http://elpa.emacs-china.org/org/")
        ("cselpa" . "https://elpa.thecybershadow.net/packages/")))
;; -Packages

;; ConfigurePackageManager-
(unless (bound-and-true-p package--initialized)
  ; To prevent initializing twice
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-verbose (not (bound-and-true-p byte-compile-current-file)))
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t)
  (setq use-package-compute-statistics t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package)
  (require 'bind-key))
;; -ConfigurePackageManager

;; PackageAutoUpdate-
(use-package auto-package-update
  :if (not (daemonp))
  :custom
  ;; in days
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-delete-old-versions t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))
;; -PackageAutoUpdate

;; DimPac
(use-package diminish)
;; -DimPac

(provide 'init-package)
;;; init-package.el ends here.
