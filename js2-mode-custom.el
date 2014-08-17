;; http://howardabrams.com/projects/dot-files/emacs-javascript.html
(setq js-basic-indent 2)
(setq-default js2-basic-indent 2)

(setq-default js2-basic-offset 2)
(setq-default js2-auto-indent-p t)
(setq-default js2-cleanup-whitespace t)
(setq-default js2-enter-indents-newline t)
(setq-default js2-global-externs "jQuery $")
(setq-default js2-indent-on-enter-key t)
(setq-default js2-mode-indent-ignore-first-tab t)

(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))

;; We'll let fly do the error parsing...
(setq-default js2-show-parse-errors nil)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; Change the function keyword to 'f'
(font-lock-add-keywords
 'js2-mode `(("\\(function *\\)("
              (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ")
                                               nil)))))

;; Place warnings font around TODO and Others:
(font-lock-add-keywords 'js2-mode
                        '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                                                      1 font-lock-warning-face t)))

;;
(add-hook 'js2-mode-hook 'color-identifiers-mode)

;; While editing JavaScript is baked into Emacs, it is kinda cool to
;; have it give you red sections based on jshint. This is now done
;; with Flycheck, and we now don't use FlyMake.
(autoload 'flymake-jshint "flymake-jshint"
  "Error and linting support mode for JavaScript." t nil)

(add-hook 'js-mode-hook
                    (lambda () (flymake-mode 1)))
