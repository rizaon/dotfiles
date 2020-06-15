
# Legacy markdown mode

I inherit this mode from Haryadi during my Ph.D. year. To enable this mode, add the following lines
to `.emacs.d/init.el`

```
(add-to-list 'load-path (concat dotfiles-dir "/modes-el"))
(autoload 'markdown-mode "markdown-mode-modified.el" "..." t)
(setq auto-mode-alist (cons '("\\.txt$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.blog$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
```
