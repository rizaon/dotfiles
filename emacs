(setq load-path (cons "~/.emacs.path/modes-el/" load-path))
(autoload 'markdown-mode "markdown-mode-modified.el" "..." t)
(setq auto-mode-alist (cons '("\\.txt$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.blog$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(global-set-key "\C-xx" 'fill-paragraph)
(setq sentence-end-double-space nil)
(setq-default fill-column 80)


(setq load-path (cons "~/.emacs.path/init.d/" load-path))
(require 'setup-bindings)
(require 'darwin)
