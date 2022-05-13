;; Don't load package.el since we're using straight instead. Among
;; other things, this means that packages in /elpa will be ignored
(setq package-enable-at-startup nil)

(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
