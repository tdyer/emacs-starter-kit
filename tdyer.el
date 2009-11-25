;; Fix junk characters in shell mode
;; http://amitp.blogspot.com/2007/04/emacs-color-in-shell-buffers.html
(setq ansi-color-names-vector ["black" "red4" "green4" "yellow4" "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'ruby-mode-hook 'whitespace-mode)


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
(add-to-list 'Info-directory-list (concat dotfiles-dir "/tdyer/share/info"))


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

;; Mustbe the last line in file
(regen-autoloads)