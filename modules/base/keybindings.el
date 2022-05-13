(use-package general
  :straight t
  :commands (general-define-key
             general-def)
  :config )

(general-define-key
 ;; "C->" #'indent-rigidly-right-to-tab-stop
 ;; "C-<" #'indent-rigidly-left-to-tab-stop
 "C->" #'end-of-buffer
 "C-<" #'beginning-of-buffer
 "M-DEL" #'sanemacs/backward-kill-word
 "C-DEL" #'sanemacs/backward-kill-word
 "C-x C-b" #'electric-buffer-list
 "C-z" #'zap-up-to-char
 "M-o f" #'other-frame
 "C-c p" #'package-list-packages
 "C-c r" #'reload-config
 "C-x C-b" #'ibuffer
 "C-x C-j" #'dired-jump)

(general-define-key
 :prefix "C-h"
 "M" #'consult-man)
