;; Initialize MELPA package
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

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
;; Alternative key for fill paragraph. Default is "M-q".
;; (global-set-key "\C-xx" 'fill-paragraph)
(setq sentence-end-double-space nil)
(setq-default fill-column 80)
(setq column-number-mode t)

;; turn on Auto Fill Mode
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Show line number
;; (global-linum-mode 1)

;; already loaded on top
;; (setq load-path (cons "~/.emacs.d/init.d/" load-path))
(require 'setup-bindings)
;; check OS type
(cond
  ((string-equal system-type "darwin") ; Mac OS X
   (require 'darwin) ; share clipboard with pbcopy-pbpaste
   ))


;; Everything below here is MELPA packages installation and config

;; use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Theme settings
(use-package gruvbox-theme
  :ensure t
  :init
  ;; Disable old theme before loading
  (defadvice load-theme
      (before theme-dont-propagate activate)
    (mapc #'disable-theme custom-enabled-themes))
  :config (load-theme 'gruvbox t)
  )

;; Company
(use-package company
  :ensure t
  :init (global-company-mode t)
  )

;; ledger-mode
(use-package ledger-mode
  :ensure t
  :init
  (setq ledger-clear-whole-transactions 1
        ledger-post-amount-alignment-column 70)
  ; (add-hook 'ledger-mode-hook 'end-of-buffer) ; Always go to end of file in ledger mode
  )

;; helm-mode
(use-package helm
  :ensure t
  :config (helm-mode t)
  )

;; git-mode
(use-package git-commit
  :ensure t
  :init
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm ledger-mode company gruvbox-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
