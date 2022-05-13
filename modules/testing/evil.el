(use-package general
  :straight t
  :commands (general-define-key
             general-def))

(use-package evil
  :straight t
  :commands (evil-mode)
  :custom ((evil-undo-system 'undo-fu)
           (evil-want-C-i-jump nil))
  :init
  (evil-mode 1)
  (general-evil-setup t)
  )

(use-package evil-org
  :straight t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(general-create-definer global-definer
  :keymaps 'override
  :states  '(insert emacs normal hybrid motion visual operator)
  :prefix  "SPC"
  :non-normal-prefix "S-SPC")

(global-definer
 "!"   'shell-command
 ":"   'eval-expression)

(defmacro +general-global-menu! (name infix-key &rest body)
  "Create a definer named +general-global-NAME wrapping global-definer.
Create prefix map: +general-global-NAME. Prefix bindings in BODY with INFIX-KEY."
  (declare (indent 2))
  `(progn
     (general-create-definer ,(intern (concat "+general-global-" name))
       :wrapping global-definer
       :prefix-map (quote ,(intern (concat "+general-global-" name "-map")))
       :infix ,infix-key
       :wk-full-keys nil
       "" '(:ignore t :which-key ,name))
     (,(intern (concat "+general-global-" name))
      ,@body)))

(general-create-definer global-leader
  :keymaps 'override
  :states '(emacs normal hybrid motion visual operator)
  :prefix "SPC m"
  "" '(:ignore t :which-key (lambda (arg) `(,(cadr (split-string (car arg) " ")) . ,(replace-regexp-in-string "-mode$" "" (symbol-name major-mode))))))

(use-package elisp-mode
  ;;this is a built in package, so we don't want to try and install it
  :ensure nil
  :general
  (global-leader
    ;;specify the major modes these should apply to:
    :major-modes
    '(emacs-lisp-mode lisp-interaction-mode t)
    ;;and the keymaps:
    :keymaps
    '(emacs-lisp-mode-map lisp-interaction-mode-map)
    "e" '(:ignore t :which-key "eval")
    "eb" 'eval-buffer
    "ed" 'eval-defun
    "ee" 'eval-expression
    "ep" 'pp-eval-last-sexp
    "es" 'eval-last-sexp
    "i" 'elisp-index-search))

(+general-global-menu! "buffer" "b"
                       "b"	'consult-buffer
                       "d"	'kill-current-buffer
                       "o"	'((lambda () (interactive) (switch-to-buffer nil))
                               :which-key "other-buffer")
                       "p"	'previous-buffer
                       "r"	'rename-buffer
                       "M"	'((lambda () (interactive) (switch-to-buffer "*Messages*"))
                               :which-key "messages-buffer")
                       "n"	'next-buffer
                       "s"	'((lambda () (interactive) (switch-to-buffer "*scratch*"))
                               :which-key "scratch-buffer")
                       "TAB"	'((lambda () (interactive) (switch-to-buffer nil))
                                  :which-key "other-buffer")
                       "q"     'bury-buffer
                       )

(+general-global-menu! "custom" "c"
                       "a" 'org-agenda
                       "b" 'consult-bookmark
                       "c" 'org-capture
                       "e" 'eval-buffer
                       "g" 'gnus
                       "h" 'consult-history
                       "k" 'consult-macro
                       "l" 'caps-lock-mode
                       "m" 'consult-mode-command
                       "q" 'vr/query-replace
                       "r" 'reload-config
                       "t" 'consult-theme)

(general-def evil-normal-state-map
  "." #'consult-complex-command
  "z+" #'text-scale-adjust
  "zu" #'zap-up-to-char
  "zp" #'consult-yank-pop
  )

(general-def evil-motion-state-map
  "M-d" #'evil-scroll-up)

(general-def
  :prefix "C-h"
  "M" #'consult-man)

(general-define-key
 :keymaps 'normal
 "E" #'evil-end-of-line-or-visual-line)

(general-def dired-mode-map
  "z a" #'dired-omit-mode)
