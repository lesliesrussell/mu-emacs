(general-define-key
 "C->" #'end-of-buffer
 "C-<" #'beginning-of-buffer
 "C-z" #'zap-up-to-char
 "C-c r" #'reload-config
 "C-x C-b" #'ibuffer
 "C-x C-j" #'dired-jump
 "M-o f" #'other-frame
 )

(general-define-key
 :prefix "C-h"
 "M" #'consult-man)
