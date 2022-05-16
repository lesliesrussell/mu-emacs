;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216 ; 16mb
                  gc-cons-percentage 0.1)
            ))

(use-package emacs
  :custom ((inhibit-startup-screen t)
           (inhibit-startup-echo-area-message user-login-name)
           (inhibit-default-init t)
           (initial-major-mode 'fundamental-mode)
           (initial-scratch-message "")
           (dired-dwim-target t)
           (frame-title-format '("%b"))
           (ring-bell-function 'ignore)
           (linum-format "%4d ")                ; Line number format
           (auto-mode-case-fold nil)
           (bidi-inhibit-bpa t)  ; Emacs 27 only
           (highlight-nonselected-windows nil)
           (fast-but-imprecise-scrolling t)
           (browse-url-browser-function 'eww-browse-url)
           (x-select-enable-clipboard t)
           (save-interprogram-paste-before-kill t)
           (ffap-machine-p-known 'reject)
           (frame-inhibit-implied-resize t)
           (idle-update-delay 1.0)  ; default is 0.5
           (inhibit-compacting-font-caches t)
           (pgtk-wait-for-event-timeout 0.001)
           (read-process-output-max (* 64 1024))  ; 64kb
           (redisplay-skip-fontification-on-input t)
           (disabled-command-function nil)
           (command-line-ns-option-alist nil)
           (ad-redefinition-action 'accept)
           (debug-on-error init-file-debug
                           jka-compr-verbose init-file-debug)
           (abbrev-file-name (concat user-emacs-directory "abbrev_defs"))
           (save-abbrevs 'silent)
           (abbrev-mode t)
           (help-window-select t)))

(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(delete-selection-mode 1)
(global-auto-revert-mode t)
(electric-pair-mode t)
(recentf-mode)
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(setq-default cursor-type 'bar)
(setq-default frame-title-format '("%b"))
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
(setq-default cursor-in-non-selected-windows nil)

;; for a less cluttered dired
(setq dired-omit-files
      (rx (or (seq bol (? ".") "#")     ;; emacs autosave files
              (seq bol "." (not (any "."))) ;; dot-files
              (seq "~" eol)                 ;; backup-files
              (seq bol "CVS" eol)           ;; CVS dirs
              )))

(setq custom-file (concat user-emacs-directory "custom.el"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
  ;;; Load custom file. Don't hide errors. Hide success message
(load custom-file nil t)

(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq
 backup-by-copying t                                        ; Avoid symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 auto-save-list-file-prefix emacs-tmp-dir
 auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))  ; Change autosave dir to tmp
 backup-directory-alist `((".*" . ,emacs-tmp-dir)))

(setq create-lockfiles nil)

;; Just found out about these.
;; (setq completion-styles '(initials partial-completion flex)) ; > Emacs 27.1
;; (setq completion-cycle-threshold 10)

(setq view-read-only t)

(diminish 'abbrev-mode)

(setenv "GCM_CREDENTIAL_STORE" "gpg")

(add-hook 'prog-mode-hook
          (if (and (fboundp 'display-line-numbers-mode) (display-graphic-p))
              #'display-line-numbers-mode
            #'linum-mode))

(unless (daemonp)
  (advice-add #'tty-run-terminal-initialization :override #'ignore)
  (add-hook 'window-setup-hook
            (lambda ()
              (advice-remove #'tty-run-terminal-initialization #'ignore)
              (tty-run-terminal-initialization (selected-frame) nil t))))

(unless (daemonp)
  (advice-add #'display-startup-echo-area-message :override #'ignore))

(add-hook 'occur-hook (lambda () (switch-to-buffer-other-window "*Occur*")))

;; Sensible line breaking
(add-hook 'text-mode-hook 'visual-line-mode)

(add-hook 'eshell-mode-hook
          (lambda ()
           (setenv "PAGER" "cat")
           (setenv "EDITOR" "emacsclient")))

(use-package org-defaults
  :defer t
  :custom ((org-src-window-setup 'current-window)))

(setq use-package-compute-statistics t)

(defun mu/backward-kill-word ()
  (interactive "*")
  (push-mark)
  (backward-word)
  (delete-region (point) (mark)))

(defun mu--save-module-buffer ()
  (write-file (concat modular-config-path "/"
                      (completing-read "Module dir: "
                                       '("base" "stable" "private" "testing")) "/" (buffer-name))))

(defun mu--insert-module-org-headings (mu-mod-name)
  "Insert module headings"

  (setq mu-mod-head (concat "#+title: " mu-mod-name "\n"
                            "#+OPTIONS: num:nil" "\n"
                            "#+PROPERTY: header-args :tangle yes" "\n" "\n"))
        (save-excursion
          (save-restriction
            (widen)
            (goto-char (point-min))
            (insert mu-mod-head))))

  (defun mu-new-module-buffer ()
    "Create a new empty buffer."
    (interactive)
    (setq mu-module-name (completing-read "Name module: " nil))
    (let (($buf (generate-new-buffer (concat mu-module-name "-config.org"))))
      (switch-to-buffer $buf)
      ;; (funcall (intern org-mode))
      (org-mode)
      (mu--insert-module-org-headings mu-module-name)
      (mu--save-module-buffer)
      $buf
      ))

(defun mu--generate-org-git-change-log-buffer ()
  "Generate an org-mode changelog for current project"
  (setq mu--git-log-command
        "git --no-pager log --pretty=")

  (setq mu--git-log-format-string
        "'** %s %n %an <%ae> %n %b %n %N'")

  (setq total-cmd (concat
                   mu--git-log-command
                   mu--git-log-format-string))

  (shell-command total-cmd (generate-new-buffer "*Formatted Git Log*")))

(defun reload-config ()
  (interactive)
  (load-file (concat user-emacs-directory "init.el")))

(defun mu-open-modules-dir ()
  (interactive)
  (dired-jump nil (concat user-emacs-directory "modules/")))
;; (global-set-key (kbd "S-<f8>") #'mu-open-modules-dir)
(general-define-key "S-<f8>" #'mu-open-emacs-dir)

(defun mu-open-emacs-dir ()
  (interactive)
  (dired-jump nil user-emacs-directory))
;; (global-set-key (kbd "S-<f9>") #'mu-open-emacs-dir)
(general-define-key "S-<f9>" #'mu-open-emacs-dir)

(defun mu-find-modules ()
  (interactive)
  (consult-find (concat user-emacs-directory "modules/")))
;; (global-set-key (kbd "M-s f") #'mu-find-modules)
(general-define-key "M-s f" #'mu-find-modules)

(use-package gcmh
  :straight t
  :custom
  (gcmh-idle-delay 'auto "Default is 15s")
  (gcmh-auto-idle-delay-factor 10)
  (gcmh-high-cons-threshold (* 16 1024 1024) "16MB"))

(require 'eshell)

(defun my-custom-func ()
  (when (not (one-window-p))
    (delete-window)))

(advice-add 'eshell-life-is-too-much :after 'my-custom-func)

(defun eshell/z (&optional regexp)
  "Navigate to a previously visited directory in eshell, or to
any directory proferred by `consult-dir'."
  (let ((eshell-dirs (delete-dups
                      (mapcar 'abbreviate-file-name
                              (ring-elements eshell-last-dir-ring)))))
    (cond
     ((and (not regexp) (featurep 'consult-dir))
      (let* ((consult-dir--source-eshell `(:name "Eshell"
                                                 :narrow ?e
                                                 :category file
                                                 :face consult-file
                                                 :items ,eshell-dirs))
             (consult-dir-sources (cons consult-dir--source-eshell
                                        consult-dir-sources)))
        (eshell/cd (substring-no-properties
                    (consult-dir--pick "Switch directory: ")))))
     (t (eshell/cd (if regexp (eshell-find-previous-directory regexp)
                     (completing-read "cd: " eshell-dirs)))))))

(defun mu-tangle-modules ()
  (interactive)
  " Recursively tangle all modules under the default module directory"
  (setq tangl-modul-lst
        ;; (directory-files-recursively (concat user-emacs-directory )"modules/"  "\\.org\\'" t)
        (directory-files-recursively modular-config-path  "\\.org\\'" t))

  (dolist (element tangl-modul-lst)
    (print element)
    (org-babel-tangle-file element)))
