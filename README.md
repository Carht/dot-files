# dot-emacs
Emacs base configuration for some programming languages

## Visual demonstration of the Emacs-Clojure configuration

![Alt Text](https://github.com/Carht/dot-files/blob/main/doc/emacs_clojure_config.gif)

## Default packages

Some basic packages for Scheme Lisp [Guile](https://www.gnu.org/software/guile/) using the [geiser](https://www.nongnu.org/geiser/) configuration, and basic file modes for [Elixir programming language](https://elixir-lang.org/), [Haskell programming language](https://www.haskell.org/), [Golang](https://go.dev/), [Lua](https://www.lua.org/), [Scala](https://scala-lang.org/), [Rust](https://www.rust-lang.org/) and [OCaml programming language](https://ocaml.org/)

```emacs
(require 'package)
(custom-set-variables
 '(custom-enabled-themes '(tsdh-light))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(rainbow-delimiters paredit ac-geiser geiser-guile geiser company-lua elixir-mode 
   company-ghci company flycheck-haskell flycheck scala-mode haskell-mode lsp-haskell 
   lsp-ui lsp-mode lua-mode ocamlformat go-mode cargo racer rust-mode clojure-mode cider)))
(package-initialize)
```

## Some misc configurations

* backup dir for "~" files
* Display time
* Inhibit startup screen

```emacs
(setq backup-directory-alist `(("." . "~/.backup")))
(display-time)

;; not help screen
(setq inhibit-startup-screen t)
```

## Goto some line

Show line numbers temporarily, while prompting the line number input

```emacs
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
```

## Common lisp configuration (SBCL)

```emacs
;; sbcl
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")
```

## Default base configuration for clojure

* Automatic parenthesis completion with [paredit](https://paredit.org/?ref=upstract.com)
* Parenthesis rainbow colors with [rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters)
* Pop-up suggestions for functions with [company-mode](https://company-mode.github.io/)

```emacs
;; enable paredit-mode for clojure files and cider
(add-hook 'cider-repl-mode-hook #'paredit-mode) ;;repl
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
```
