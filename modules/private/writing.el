(use-package olivetti
  :straight t
  :init
  (setq olivetti-body-width .67)
  :config
  (defun distraction-free ()
    "Distraction-free writing environment"
    (interactive)
    (if (equal olivetti-mode nil)
        (progn
          (window-configuration-to-register 1)
          (delete-other-windows)
          (text-scale-increase 2)
          (olivetti-mode t))
      (progn
        (jump-to-register 1)
        (olivetti-mode 0)
        (text-scale-decrease 2))))
  :bind
  (("<f9>" . distraction-free)))

(use-package caps-lock
  :straight t
  :bind ("C-c l" . #'caps-lock-mode))

(use-package fountain-mode
  :straight t
  :mode "\\.fountain\\'")

(use-package flyspell
  :straight t
  :config
  (setq ispell-program-name "hunspell"
	ispell-default-dictionary "en_AU")
  :hook (text-mode . flyspell-mode)
  :bind (("M-<f7>" . flyspell-buffer)
	 ("<f7>" . flyspell-word)
	 ("C-;" . flyspell-auto-correct-previous-word)))

(use-package deft
  :straight t
  :custom ((custom-deft-extensions '("org" "md" "text" "tex"))
           (deft-directory "~/Dropbox/org")
           (deft-recursive t))
  :bind (("<f8>" . deft)
         ("C-x C-g" . deft-find-file))
  :commands (deft deft-find-file)
  :init)
  (global-set-key (kbd "M-s F") #'mu-deft-modules)

(defun mu-deft-modules ()
  (interactive)
  (require 'deft)
  (setq hold-deft-dir deft-directory)
  ;; (setq deft-directory "~/.repos/github.com/lesliesrussell/mu-emacs/modules")
  (setq deft-directory (concat user-emacs-directory "modules/"))
  (deft)
  (setq deft-directory hold-deft-dir))

(global-set-key (kbd "M-s F") #'mu-deft-modules)

(use-package flycheck
  :straight t
  :init (global-flycheck-mode))

;; (flycheck-define-checker proselint
;; 			 "A linter for prose."
;; 			 :command ("proselint" source-inplace)
;; 			 :error-patterns
;; 			 ((warning line-start (file-name) ":" line ":" column ": "
;; 				   (id (one-or-more (not (any " "))))
;; 				   (message) line-end))
;; 			 :modes (text-mode markdown-mode gfm-mode))

;; (add-to-list 'flycheck-checkers 'proselint)

(use-package markdown-mode
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;; (use-package flymd
;;   :straight t
;;   :hook (gfm-mode . (flymd)))

(use-package writegood-mode
  :straight t
  :bind (("C-c C-g w" . #'writegood-mode)
	 ("C-c C-g g" . #'writegood-grade-level)
	 ("C-c C-g e" . #'writegood-reading-ease)))

(use-package git-timemachine
  :straight t
  :bind (("C-c C-g t" . #'git-timemachine-toggle)))
