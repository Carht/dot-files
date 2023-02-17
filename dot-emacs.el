(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-light))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(rainbow-delimiters paredit ac-geiser geiser-guile geiser company-lua elixir-mode company-ghci company flycheck-haskell flycheck scala-mode haskell-mode lsp-haskell lsp-ui lsp-mode lua-mode ocamlformat go-mode cargo racer rust-mode clojure-mode cider)))
(package-initialize)


(setq backup-directory-alist `(("." . "~/.backup")))
(display-time)

;; not help screen
(setq inhibit-startup-screen t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (if (and (boundp 'linum-mode)
           linum-mode)
      (call-interactively 'goto-line)
    (unwind-protect
        (progn
          (linum-mode 1)
          (call-interactively 'goto-line))
      (linum-mode -1))))

;; not help screen
(setq inhibit-startup-screen t)

;; sbcl
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; enable paredit-mode for clojure files and cider
(add-hook 'clojure-mode-hook 'enable-paredit-mode) ;; enable paredit for clojure files

;; enable company-mode for clojure files and cider
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook #'company-mode)

;; enable rainbow-delimiter-mode for clojure files and cider
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; best custon color configuration for rainbow-delimiter
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
