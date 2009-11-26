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
(eshell)
(rename-buffer "autospec")

(eshell)
(rename-buffer "aaa")

(eshell)
(rename-buffer "bbb")

(eshell)
(rename-buffer "zzz")

(eshell)
(rename-buffer "yyy")

(eshell)
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
(semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;; ECB
(add-to-list 'load-path "~/.emacs.d/tdyer/ecb-2.40")
(require 'ecb)
(require 'ecb-autoloads)
(setq  ecb-auto-activate 'on)

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

;; Mustbe the last line in file
(regen-autoloads)