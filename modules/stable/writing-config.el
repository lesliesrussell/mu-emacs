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
  :defer t
  ;; :init (global-flycheck-mode)
  )

(add-hook 'emacs-startup-hook
          (lambda ()
            (global-flycheck-mode)))

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
