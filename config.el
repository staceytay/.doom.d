;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Stacey Tay")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Menlo" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'night-owl)
(setq night-owl-highlight-line "#333E4A")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-hook 'prog-mode-hook 'subword-mode)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(cond (IS-MAC (setq mac-right-option-modifier 'meta)))

(setq frame-title-format '("%b")
      icon-title-format nil)

(after! evil
  (setq evil-escape-delay 0.2))

(after! diff-hl
  (global-diff-hl-mode)
  :config (diff-hl-margin-mode nil))

(after! doom-modeline
  (setq doom-modeline-env-version nil
        doom-modeline-icon nil
        doom-modeline-lsp nil)
  (global-anzu-mode)
  (global-set-key [remap query-replace] 'anzu-query-replace))

(after! highlight-indent-guides
  (setq highlight-indent-guides-responsive 'top))

(after! projectile
  (setq projectile-indexing-method 'alien))

(after! web-mode
  (set-formatter! 'prettier-html "prettier --parser html"))

(map! :i "TAB" #'+company/complete)
(map! :i "C-=" #'er/expand-region)

(use-package! indent-bars
  :hook (prog-mode . indent-bars-mode)
  :config
  (setq
   indent-bars-color '(highlight :face-bg t :blend 0.2)
   indent-bars-highlight-current-depth '(:blend 0.8)
   indent-bars-prefer-character t
   indent-bars-starting-column 0))
