;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "/init.d"))
(add-to-list 'load-path (concat dotfiles-dir "/modes-el"))

;; already loaded on top
;; (setq load-path (cons "~/.emacs.d/modes-el/" load-path))
(autoload 'markdown-mode "markdown-mode-modified.el" "..." t)
(setq auto-mode-alist (cons '("\\.txt$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.blog$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(global-set-key "\C-xx" 'fill-paragraph)
(setq sentence-end-double-space nil)
(setq-default fill-column 80)
(setq column-number-mode t)

;; turn on Auto Fill Mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; already loaded on top
;; (setq load-path (cons "~/.emacs.d/init.d/" load-path))
(require 'setup-bindings)
(require 'darwin)
