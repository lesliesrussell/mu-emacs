(use-package mixed-pitch
  :straight t
  :hook
  (text-mode . mixed-pitch-mode)
  :config
  (set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 100)
  (set-face-attribute 'fixed-pitch nil :font "DejaVu Sans Mono")
  (set-face-attribute 'variable-pitch nil :font "DejaVu Sans"))

(use-package company-posframe
  :straight t
  :diminish company-posframe-mode
  :config
  (company-posframe-mode 1))

(setq org-startup-indented t
      org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300))

(use-package org-appear
  :straight t
  :hook (org-mode . org-appear-mode))

(use-package org-superstar
  :straight t
  :defer t
  :config
  (setq org-superstar-special-todo-items t)
  )

(add-hook 'org-mode-hook (lambda ()
                           (org-superstar-mode 1)))

(setq-default line-spacing 1)
