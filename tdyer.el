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


