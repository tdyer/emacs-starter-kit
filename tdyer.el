
;;
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/tdyer")

;; ack, much faster than grep or rgrep
;; see http://fosscasts.com/screencasts/download_mov/15_ack.mov
;; and http://betterthangrep.com/
;; http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=ack.el
(require 'ack)

;; do this when ruby-mode is required
(when (require 'ruby-mode nil t)
  ;; turn on ruby-electric-mode when ruby-mode is invoked
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (ruby-electric-mode 1))))

;; Fix junk characters in shell mode
;; http://amitp.blogspot.com/2007/04/emacs-color-in-shell-buffers.html
(setq ansi-color-names-vector ["black" "red4" "green4" "yellow4" "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'inf-ruby-mode 'ansi-color-for-comint-mode-on)

;; not in Emacs 22, built into Emacs 23
;;(add-hook 'ruby-mode-hook 'whitespace-mode)

;;
(setq default-frame-alist '(
                            (top . 50)
                            (left . 150)
;;                            (width . 120)
;;                            (height . 60)
                            (width . 140)
                            (height . 40)
                            (foreground-color . "white")
                            (background-color . "black")
                            (font . "-apple-monaco-medium-r-normal--14-140-72-72-m-140-iso10646-1")
;;                            (font . "-*-*-medium-r-normal--9-*-*-*-*-*-fontset-hiraginokaku")
                            ))


;; create a couple of shells
(shell)
(rename-buffer "test")
(shell)
(rename-buffer "server")
(shell)
(rename-buffer "console")
(shell)
(rename-buffer "db")
(shell)
(rename-buffer "git")
(shell)
(rename-buffer "aaa")
(shell)
(rename-buffer "bbb")
(shell)
(rename-buffer "zzz")
(shell)
(rename-buffer "yyy")

(shell)
(rename-buffer "xxx")

;; add a local info directory for text-info files
;; Ex: Installing
;; cd ~/.emacs.d/tdyer/cedet-1.0pre6
;; sudo make install-info PREFIX=~/.emacs.d/tdyer
;; The Info-default-directory-list will NOT be used if there in a
;; INFOPATH env var, check you're .bash_profile
(add-to-list 'Info-default-directory-list (concat dotfiles-dir "tdyer/share/info"))


;; Load CEDET.
;; (add-to-list 'load-path (concat dotfiles-dir "tdyer/cedet-1.0pre6"))
(load-file "~/.emacs.d/tdyer/cedet-1.0pre6/common/cedet.el")
;;  (load-file "~/src/cedet-1.1/common/cedet.el")
;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; turned off for emacs 24.2.1
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

(setq stack-trace-on-error t)

;; ECB
(add-to-list 'load-path "~/.emacs.d/tdyer/ecb-2.40")
(require 'ecb)
(require 'ecb-autoloads)
;;(setq  ecb-auto-activate 'on)

;; My Key Mappings for ECB
;;  C-c 1 ecb-goto-window-edit1
(global-set-key "\C-c1" 'ecb-goto-window-edit1)
;;  C-c h ecb-goto-window-history
(global-set-key "\C-ch" 'ecb-goto-window-history)
;;  C-c m ecb-goto-window-methods
(global-set-key "\C-cm" 'ecb-goto-window-methods)
;;  C-c s ecb-goto-window-sources
(global-set-key "\C-cs" 'ecb-goto-window-sources)
;;  C-d d ecb-goto-window-directories
(global-set-key "\C-cd" 'ecb-goto-window-directories)

;; see http://www.emacswiki.org/emacs/DosToUnix
(defun dos2unix ()
      "Not exactly but it's easier to remember"
      (interactive)
      (set-buffer-file-coding-system 'unix 't) )

;; set the default printer name
;;(setq printer-name "//apogee/CS4000N")

;; Add rinari
(require 'rinari)
(setq rinari-tags-file-name "TAGS")
;; turn off ugly blue background in the erb and html files
(setq mumamo-chunk-coloring 1)

;; ido
(require 'ido)
(ido-mode t)

;; be careful not to override other key mappings here!!!!
;; had to fix this, changed the find-file-in-project
;; http://groups.google.com/group/emacs-on-rails/browse_thread/thread/944fa162f8087265
;; C-c ff find-file-in-project
;;(global-set-key "\C-cff" 'find-file-in-project)
;;  C-c fo toggle-buffer
(global-set-key "\C-cfo" 'toggle-buffer)
;;  C-c fs rinari-script
(global-set-key "\C-cfs" 'rinari-script)
;;  C-c e rinari-insert-erb-skeleton
(global-set-key "\C-ce" 'rinari-insert-erb-skeleton)
;;  C-c t rinari-test
(global-set-key "\C-ct" 'rinari-test)
;;  C-c r rinari-rake
(global-set-key "\C-cr" 'rinari-rake)
;;  C-c c rinari-console
(global-set-key "\C-cc" 'rinari-console)
;;  C-c w rinari-web-server
(global-set-key "\C-cw" 'rinari-web-server)
;;  C-c g rinari-grep
(global-set-key "\C-cg" 'rinari-rgrep)
;;  C-c b rinari-browse-url
(global-set-key "\C-cb" 'rinari-browse-url)
;;  C-c q rinari-sql
(global-set-key "\C-cq" 'rinari-sql)
;;  C-c fc rinari-find-controller
(global-set-key "\C-cfc" 'rinari-find-controller)
;;  C-c ft rinari-find-test
(global-set-key "\C-cft" 'rinari-find-test)
;;  C-c fv rinari-find-view
(global-set-key "\C-cfv" 'rinari-find-view)
;;  C-c fm rinari-find-model
(global-set-key "\C-cfm" 'rinari-find-model)
;;  C-c fi rinari-find-migration
(global-set-key "\C-cfi" 'rinari-find-migration)
;;  C-c fe rinari-find-environment
(global-set-key "\C-cfe" 'rinari-find-environment)
;;  C-c fj rinari-find-javascript
(global-set-key "\C-cfj" 'rinari-find-javascript)
;;  C-c fs rinari-find-stylesheet
(global-set-key "\C-cfs" 'rinari-find-stylesheet)

;; set the color theme to one based on TextMate
;; (color-theme-twilight)
(load-file "~/.emacs.d/tdyer/.emacs-color-theme")
;;(color-theme-blackboard)
;;(tgd-black-on-whitecolor)

;; org-mode
;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.php
(add-to-list 'load-path "~/.emacs.d/tdyer/org-mode")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; set line number in buffer
(require 'linum)
;;(global-linum-mode 1)  ;; line numbering in every buffer

;; (require 'js-comint)
;; (setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main")
;; (add-hook 'js2-mode-hook '(lambda ()
;; ;; 			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
;; ;; 			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
;; ;; 			    (local-set-key "\C-cb" 'js-send-buffer)
;; ;; 			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
;; ;; 			    (local-set-key "\C-cl" 'js-load-file-and-go)

;;                             (local-set-key "\C-xe" 'js-send-last-sexp-and-go)
;; 			    (local-set-key "\C-xb" 'js-send-buffer-and-go)
;; 			    ))

;; (add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
;; (require 'textmate)
;; (textmate-mode)
(add-to-list 'load-path "~/.emacs.d/vendor/")
(setq ns-pop-up-frames nil)
(require 'peepopen)
;; bind to Apple key - t
;;(define-key *textmate-mode-map* (kbd "A-t") 'peepopen-goto-file-gui))
(global-set-key "\M-t" 'peepopen-goto-file-gui)

;; By Charles Magid
;; Filter Rails log
;; M-x cmm-ror-controller-action-render-filter
(defun cmm-ror-controller-action-render-filter ()
  "Switch to Rails Log file then execute command to list all of the controller actions and rendering from a log file"
  (interactive)
  (list-matching-lines "\\(^Processing .+\\#\\|^Rendering .+/\\)" nil)
  (switch-to-buffer "*Occur*")
  (font-lock-fontify-buffer))

;; git stuff from the git 1.7.1 release
;; copied from ~/src/git-1.7.1/contrib/emacs to
;; ~/.emacs.d/tdyer/git/emacs
(add-to-list 'load-path "~/.emacs.d/tdyer/git/emacs")
(require 'git)
(require 'git-blame)

;; lorem ipsum texst
(require 'lorem-ipsum)

;; yari.el
;; A better ri for emacs?
(require 'yari)

;;
(require 'haml-mode)
(add-hook 'haml-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
                                      (define-key haml-mode-map "\C-m" 'newline-and-indent)))
;; WARNING comment this out when running headless or multiple emacs
;; allow opening of files in running emacs
(server-start) ;;; Use C-x # to close an emacsclient buffer.

;;(setq-defualt tab-width 2)

;; https://github.com/defunkt/coffee-mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda () (coffee-custom)))

;; emacs.js Doesn't work ???
;; (load-file "~/.emacs.d/emacs_js_init.el")
;; (load-file "~/.emacs.d/emacs_js.el")

;;  js2-mode http://code.google.com/p/js2-mode/wiki/InstallationInstructions
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; https://github.com/stanaka/dash-at-point#readme
(add-to-list 'load-path "~/.emacs.d/tdyer/dash-at-point.el")
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-ck" 'dash-at-point)
(add-hook 'rinari-minor-mode-hook
                    (lambda () (setq dash-at-point-docset "rails")))
(add-hook 'ruby--mode-hook
                    (lambda () (setq dash-at-point-docset "ruby")))

;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor/bundler.el")
(require 'bundler)

;;(add-hook 'find-file-hook (lambda () (setq buffer-read-only t)))

(mapc (lambda (hook)
        (add-hook hook (lambda ()
                         (setq show-trailing-whitespace t))))
      '(text-mode-hook
        emacs-lisp-mode-hook
        ruby-mode-hook
        javascript-mode-hook
        coffee-mode-hook
        haml-mode-hooka
        html-mode-hook
        python-mode-hook
        js2-mode-hook
        css-mode-hook
        ))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Flyspell mode
;; http://www-sop.inria.fr/members/Manuel.Serrano/flyspell/flyspell.html
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t) (autoload 'tex-mode-flyspell-verify "flyspell" "" t)

;; https://github.com/jacott/emacs-pry
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
;; optional suggestions
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)

;; Hack up emacs-rails/flymake integration to make autotest happy

;; adapted from flymake.el
(defun abg-flymake-create-temp-inplace-without-ext (file-name prefix)
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((temp-name (concat (file-name-sans-extension file-name) "." prefix)))
    (flymake-log 3 "create-temp-inplace: file=%s temp=%s" file-name temp-name)
    temp-name))

;; redefine to use my custom temp buffer naming method
(defun flymake-ruby-init ()
  (condition-case er
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'abg-flymake-create-temp-inplace-without-ext))
             (local-file  (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
        (list rails-ruby-command (list "-c" local-file)))
    ('error ())))


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.1/elpa/auto-complete-20140208.653/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'javascript-mode)
(add-to-list 'ac-modes 'css-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; From http://whattheemacsd.com/
;; Turn off mouse interface early in startup to avoid momentary
;; display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; MUST BE THE LAST LINE IN FILE
(regen-autoloads)
