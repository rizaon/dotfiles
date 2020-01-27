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
;; max commit message length for impala is 72. emacs default to 70.
;; https://cwiki.apache.org/confluence/display/IMPALA/Contributing+to+Impala
;; (setq-default fill-column 72)
(setq column-number-mode t)

;; turn on Auto Fill Mode
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; already loaded on top
;; (setq load-path (cons "~/.emacs.d/init.d/" load-path))
(require 'setup-bindings)
;; check OS type
(cond
  ((string-equal system-type "darwin") ; Mac OS X
   (require 'darwin) ; share clipboard with pbcopy-pbpaste
   ))
