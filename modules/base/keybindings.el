(use-package general
  :straight t
  :commands (general-define-key
             general-def)
  :config )

(general-define-key
 "C->" #'end-of-buffer
 "C-<" #'beginning-of-buffer
 "C-z" #'zap-up-to-char
 "M-o f" #'other-frame
 "C-c r" #'reload-config
 "C-x C-b" #'ibuffer
 "C-x C-j" #'dired-jump)

(general-define-key
 :prefix "C-h"
 "M" #'consult-man)
