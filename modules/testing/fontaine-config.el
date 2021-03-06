(defun mu--load-fontaine ()
  (use-package fontaine
    :straight `(:package "fontaine" :host nil :type git
                         :repo "https://git.sr.ht/~protesilaos/fontaine"))

  (require 'fontaine)
  (setq fontaine-presets
        '((regular
           :default-family "DejaVu Sans Mono"
           :default-weight normal
           :default-height 80
           :fixed-pitch-family "DejaVu Sans Mono"
           :fixed-pitch-weight nil ; falls back to :default-weight
           :fixed-pitch-height 1.0
           :variable-pitch-family "DejaVu Sans"
           :variable-pitch-weight normal
           :variable-pitch-height 1.0
           :bold-family nil ; use whatever the underlying face has
           :bold-weight bold
           :italic-family "DejaVu Sans"
           :italic-slant italic
           :line-spacing 1)
          (large
           :default-family "DejaVu Sans Mono"
           :default-weight normal
           :default-height 150
           :fixed-pitch-family nil ; falls back to :default-family
           :fixed-pitch-weight nil ; falls back to :default-weight
           :fixed-pitch-height 1.0
           :variable-pitch-family "DejaVu Sans"
           :variable-pitch-weight normal
           :variable-pitch-height 1.05
           :bold-family nil ; use whatever the underlying face has
           :bold-weight bold
           :italic-family nil ; use whatever the underlying face has
           :italic-slant italic
           :line-spacing 1)))

  ;; Recover last preset or fall back to desired style from
  ;; `fontaine-presets'.
  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))

  ;; The other side of `fontaine-restore-latest-preset'.
  (add-hook 'kill-emacs-hook #'fontaine-store-latest-preset)

  ;; fontaine does not define any key bindings.  This is just a sample that
  ;; respects the key binding conventions.  Evaluate:
  ;;
  ;;     (info "(elisp) Key Binding Conventions")
  (define-key global-map (kbd "C-c f") #'fontaine-set-preset)
  (define-key global-map (kbd "C-c F") #'fontaine-set-face-font)

  ;; (set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 80)
  ;; (set-face-attribute 'fixed-pitch nil :font "DejaVu Sans Mono")
  ;; (set-face-attribute 'variable-pitch nil :font "DejaVu Sans")

  ;;use larger font
  ;; (setq default-frame-alist '((font . "DejaVu Sans-10")))
  ;; (set-frame-font "DejaVu Sans Mono-9" nil t)
  )

;; (if (display-graphic-p)
;;     (mu--load-fontaine)
;;   (message "Skipping fontaine"))

(add-hook 'server-after-make-frame-hook
          (lambda ()
            (if (display-graphic-p)
                (mu--load-fontaine)
              (message "Skipping fontaine"))))

(add-hook 'after-init-hook
          (lambda ()
            (if (display-graphic-p)
                (mu--load-fontaine)
              (message "Skipping fontaine"))))
