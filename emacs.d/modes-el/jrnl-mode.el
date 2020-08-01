
(defvar jrnl-mode-hook nil)

(defconst jrnl-regex-header
  "\\(^\\[[^]]+?\\]\\) \\(.*$\\)"
  "Regex for jrnl entry header")

(defconst jrnl-regex-tag
  "\\(\\W@\\w+\\)"
  "Regex for jrnl entry header")

(defconst jrnl-font-lock-keywords-1
  (list
   (cons jrnl-regex-header
         '((1 font-lock-type-face t)
           (2 font-lock-variable-name-face t)))
   (cons jrnl-regex-tag font-lock-function-name-face)
   )
  "Minimal highlighting expressions for jrnl-mode")

(define-derived-mode jrnl-mode prog-mode "jrnl"
  "Mode for editing jrnl document."
  (setq font-lock-defaults '(jrnl-font-lock-keywords-1)))
