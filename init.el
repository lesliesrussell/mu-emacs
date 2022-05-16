;; -*- lexical-binding: t; -*-
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(straight-use-package 'diminish)

(use-package general
  :straight t
  :commands (general-define-key
             general-def)
  :config )

(use-package modular-config
  :straight t
  :custom
  (modular-config-list '((none ())
                         ;; the most minimal config I can stand
                         (base (base/core-config
                                base/daemon-config
                                base/appearance-config
                                base/undo-config
                                base/keybindings-config
                                base/searching-config
                                base/git-config
                                base/completion-config
                                ;; base/which-config
                                base/howdoyou-config
                                ))
                         ;; my stable module group for daily use
                         (stable ((base)
                                  stable/mu-org-config
                                  stable/writing-config
                                  stable/org-roam-config
                                  stable/deft-extras-config
                                  ))
                         ;; just private configs that might not want in repo
                         (private ((stable)
                                   ;; private/keybinds-config
                                   ))
                         ;; if I add a new module I can test drive it
                         (testing ((private)
                                   testing/org-test-config
                                   testing/proced-config
                                   ;;testing/lambda-line-config
                                   ;;testing/feebleline-config
                                   testing/simple-modeline-config
                                   testing/esup-config
                                   ;; testing/go-config
                                   ;; testing/shr-eww-config
                                   ;; testing/evil-config
                                   testing/popper-config
                                   testing/fontaine-config
                                   ))
                         ))
  ;; I default to private but so far it has been both
  ;; comfortable and safe to change this to any of the other
  ;; module groups.
  (modular-config-default 'testing)

  ;; the developer of this package uses /lisp as his path
  ;; but I wanted something that makes more sense for me
  ;; since I use /lisp for something else
  ;; This probably ought to be a concat with emacs user directory
  (modular-config-path (concat user-emacs-directory "modules"))

  ;; I don't use this but I included it because other people might want
  ;; to use it and I might find a need for it later.
  ;; (modular-config-use-separate-bookmarks t)
  :config
  (modular-config-command-line-args-process))
