;;-----------------------------------------------------------------------------
;; Helper functions
(defun assoc-mode-with (mode exts)
  "Autoload the filename pattern(s) in EXTS with editor mode MODE."
  (cond
   ((not exts))

   ((listp exts)
    (assoc-mode-with mode (car exts))
    (assoc-mode-with mode (cdr exts)))

   ((stringp exts)
    (setq auto-mode-alist (cons `(,exts . ,mode) auto-mode-alist)))

   (t (error "Bad filename pattern: %s" exts))))

;; Add .emacs_el to load path
(setq load-path (cons "~/.emacs_el" load-path))
(setq load-path (cons "~/lib/emacs/lisp" load-path))

;;  .emacs --- cs61a class master emacs startup file
; Modified for home installations, brg Fri Sep 29 15:01:58 PDT 2000

;; Controlling backup files:
;;
;; Set the following variable to `nil' to disable the making of backup
;; files.

(setq make-backup-files t)

(setq backup-by-copying nil)

;; If you want to use copying to create backups for files with multiple
;; names, set `backup-by-copying-when-linked' to non-nil.  This causes
;; the alternate names to refer to the latest version as edited.  This
;; variable is relevant only if backup-by-copying is nil.

(setq backup-by-copying-when-linked t)

;; You can set `require-final-newline' to one of the following to
;; control newlines at the end of a file when the file is saved:
;;
;;	t		Silently place a newline at the end of the file
;;			when the file is saved.  This is done only if
;;			the file does not already end with a newline.
;;	nil		Don't add newlines.
;;	(anything else) Ask the user what to do.

(setq-default require-final-newline nil)


;; Set the following to `t' to create numbered backup files.  Set it to
;; `nil' to make numbered backup files only for those files that already
;; have them.  Set it to `never' to never make numbered backup files
;; (i.e., use "(setq version-control 'never)").

(setq version-control 'never)


;; Set the following variable to `t' or `nil', depending on whether or
;; not you want Emacs to auto-save your files.  It is strongly suggested
;; that auto-save-default be set to `t' (enable auto-save) to prevent
;; much work from being lost in the event of a power failure or system
;; crash.

(setq auto-save-default t)


;; auto-save-interval is the number of keystrokes between auto-saves.
;; If it is set to zero, autosaving is disabled.

(setq auto-save-interval 100)


;; If default-truncate-lines is non-nil, continuation lines are not
;; displayed; each line of text is given one and only one screen line.
;; In this case, lines longer than the screen/window width have to be
;; viewed using the scroll-left and scroll-right functions.
;; It is recommended that default-truncate-lines be set to `nil'.

(setq default-truncate-lines nil)
(setq truncate-partial-width-windows default-truncate-lines)


;; scroll-step is the number of lines to try scrolling a window when
;; point tries to move outside of a window.  If that fails to bring the
;; point back onto the screen the point is centered in the window
;; instead.  If scroll-step is zero, the point is always centered after
;; it moves outside of a window.

(setq scroll-step 0)


;; next-screen-context lines contains the number of lines of continuity
;; when scrolling a window.

(setq next-screen-context-lines 1)

;;**** Key-binding changes

(global-set-key "\eg" 'goto-line)   
(global-set-key "\eW" 'copy-region-as-kill) 
;; (global-set-key "\^w" 'backward-kill-word)
;; (global-set-key "\eq" 'query-replace)
;; (global-set-key "\eQ" 'query-replace-regexp)
;; (global-set-key "\^x\^e" 'compile)
;; (global-set-key [S-return] 'newline-and-indent)

;; Disable C-x n n, ^z, C-x C-l, C-x C-u

(global-unset-key "\^z")
(global-unset-key "\^xnn")
;; (global-unset-key "\^x\^l")
;; (global-unset-key "\^x\^u")

;; Font color controls.
;(load "faces")
;(setq hilit-mode-enable-list '())
;(require 'paren)
;(require 'faces)

;; Make .h and .H files default to C++ mode rather than C mode.
(assoc-mode-with 'c++-mode '("\\.H$" "\\.h$"))

;; Set up C/C++ indentation
;(setq c-tab-always-indent t)
;(setq c-indent-level 4)
;;(define-key c-mode-map "\r" 'newline-and-indent)
;(setq c-continued-statement-offset 4)
;(setq c-argdecl-indent 0)

;; Disallow tabs
;(setq indent-tabs-mode nil)


;; Line numbers

(line-number-mode 1)

;; Set degree of noviceness

;; Don't complain about ESC ESC,  [commented out b/c emacs tutorial says so!]
;; (put 'eval-expression 'disabled nil)

(defvar abbreviated-buffer-file-name nil
   "A shortened version of the buffer's file name, if any (buffer local).")

(make-variable-buffer-local 'abbreviated-buffer-file-name)

(setq find-file-hooks 
      (append find-file-hooks '(set-abbreviated-file-name)))
(setq write-file-hooks 
      (append write-file-hooks '(set-abbreviated-file-name)))

(defun set-abbreviated-file-name ()
  (let* ((name (abbreviate-file-name buffer-file-name))
	 (suffix-index (string-match "\\(/[^/]*/[^/]*/[^/]*\\)$" name)))
    (setq abbreviated-buffer-file-name
	  (if (and suffix-index (> suffix-index 3))
	      (concat "..." (substring name suffix-index))
	    name))
    nil))

;;;######################################################################
;; Place any additional customization after the "load" command for 
;; this file.
;;;######################################################################

;(show-paren-mode 1)
(global-font-lock-mode t)
;(add-hook 'text-mode-hook 
;	  '(lambda () (auto-fill-mode 1)))

(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)

;;
;; Font-lock -- Create new faces for comments and others.
;;
;; #000 is black, #FFF is (almost) white. For more precision, use #RRGGBB.

(require 'font-lock)

;; Set the fonts named font-lock-...
;(copy-face 'default 'font-lock-comment-face)

;; Comments
;(set-face-foreground 'font-lock-comment-face "FireBrick")
(set-face-foreground 'font-lock-comment-face "#00A000")
;(set-face-foreground 'font-lock-comment-face "White")

;; Strings
;(set-face-foreground 'font-lock-string-face "DarkRed")
(set-face-foreground 'font-lock-string-face "DarkGray")

;; Keywords
(set-face-foreground 'font-lock-keyword-face "cornflower blue")

;; Built-ins (?)
(set-face-foreground 'font-lock-builtin-face "cornflower blue")

;; Function and class names
(set-face-foreground 'font-lock-function-name-face "black")
(copy-face 'bold 'font-lock-function-name-face)

;; Type designators
(set-face-foreground 'font-lock-type-face "cornflower blue")

(set-face-foreground 'font-lock-variable-name-face "#cceeff")
;; Constants (?)
(set-face-foreground 'font-lock-constant-face "cornflower blue")

;(set-background-color "#356555")
(set-background-color "black")
(set-foreground-color "white")
;(set-cursor-color "orange")
;(set-face-background 'region "SandyBrown")
;(make-face 'paren-match-face)
;(set-face-foreground 'paren-match-face "black")
;(set-face-background 'paren-match-face "chocolate")
;(setq show-paren-face 'paren-match-face)

;(setq initial-frame-alist 
;      '((top . 0) 
;        (left . 0)
;        (width . 80)
;        (height . 62)
;	))

;(add-hook 'c-mode-common-hook
;   '(lambda () (c-toggle-auto-hungry-state 1)))


;;-----------------------------------------------------------------------------
;; Miscellaneous mode associations
;;
(assoc-mode-with 'makefile-mode "\\.mak$")

(add-to-list 'auto-mode-alist '("\\.js$" . java-mode))

;; Use c-mode for sketches
(assoc-mode-with 'c-mode "\\.sk$")

; Use C/C++ mode for preprocessed mozilla files
(assoc-mode-with 'c-mode "\\.i$")
(assoc-mode-with 'c++-mode "\\.ii$")

;; (require 'multi-mode)
;; (autoload 'multi-mode "multi-mode" "Use multiple editing modes" t)
;; (defun fjx-mode () (interactive)
;;   (multi-mode 1
;; 	      'html-mode
;; 	      '("<script type=\"text/javascript\">" js2-mode)
;; 	      '("<script type=\"lang/javascript\">" js2-mode)
;; 	      '("<script lang=\"javascript\">" js2-mode)
;; 	      '("<script type=\"text/flapjax\">" js2-mode)
;; 	      '("<script type=\"lang/flapjax\">" js2-mode)
;; 	      '("<script lang=\"flapjax\">" js2-mode)
;; 	      '("<script>" js2-mode)
;;               '("</script>" html-mode)
;; 	      '("<style type=\"text/css\">" js2-mode)
;; 	      '("</style>" html-mode)
;;               ))

;; (assoc-mode-with 'fjx-mode '("\\.fjx$" "\\.htm[l]?$"))

;(set-default-font
; "-adobe-courier-medium-r-normal-*-*-140-*-*-*-*-iso8859-1")

;;
;; Bart's style for C mode.
;;
(defmacro add-hook* (hook &rest args)
  "Packages up ARGS into a lambda and puts it on HOOK."
  (list 'add-hook hook (list 'function (cons 'lambda (cons () args)))))

(defconst my-c-style
  '((c-basic-offset             . 4)
    (c-hanging-comment-ender-p  . nil)
    (c-offsets-alist
     . ((substatement-open      . 0)
        (inline-open            . 0)
        (innamespace            . 0)
        (label                  . -1000)
        (statement-cont         . c-lineup-math)))))

(add-hook* 'c-mode-common-hook
  (c-add-style "me-c" my-c-style t))

;;
;; Support for ruby
;;
(require 'ruby-mode)
;; XXX: how do I change ruby indentation??? (setq-default standard-indent 4)
(assoc-mode-with 'ruby-mode "\\.rb$")

;;
;; Support for lua
;;
;(require 'lua-mode)
;(assoc-mode-with 'lua-mode "\\.lua$")

;;
;; Multi-mode for HTML and JavaScript
;;
;; (require 'cl)
;; (defun rbt-tem-mode () (interactive)
;;   (multi-mode 1
;; 	      'html-mode
;; 	      '("<?" python-mode)
;; 	      '("<script type=\"text/javascript\">" c-mode)
;;               '("</script>" html-mode)
;; 	      '("?>" html-mode)))

;; (assoc-mode-with 'rbt-tem-mode "\\.tem$")


;; Enable mouse wheel, disable loading the tool bar and scrollbars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mouse-wheel-mode t nil (mwheel))
 '(safe-local-variable-values (quote ((c-file-style . linux-kernel))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil nil (tool-bar))
 '(window-min-width 5))


;; Add support for gjdb, a (usable) version of jdb.
(autoload 'gjdb "gjdb" "JDB" t)

;; Shortcuts for compilation and debugging
(global-set-key "\C-xc" 'compile)
(global-set-key "\C-xt" 'gdb)


;; Try to load class-specific settings
(let ((emacs-cmd (car command-line-args)))
  (cond
   ((string-match "cs162" emacs-cmd) (load "~/.emacs_el/cs162.el"))
   ((string-match "cs164" emacs-cmd) (load "~/.emacs_el/cs164.el"))))


;;-----------------------------------------------------------------------------
;; Text insertion shortcuts
;;-----------------------------------------------------------------------------
(defun insert-html-junk () (interactive)
  (insert "<html>\n\n<head>\n  <title></title>\n</head>\n\n"
           "<body>\n\n</body>\n\n</html>")
  (backward-char 17))

(global-set-key "\C-xx" 'insert-html-junk)

(defun insert-mpl-tri-license () (interactive)
  (insert 
"/* -*- Mode: C++; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 2 -*-\n"
" * vim: sw=2 ts=8 et :\n"
" */\n"
"/* This Source Code Form is subject to the terms of the Mozilla Public\n"
" * License, v. 2.0. If a copy of the MPL was not distributed with this file,\n"
" * You can obtain one at http://mozilla.org/MPL/2.0/. */\n"))
(global-set-key "\C-xg" 'insert-mpl-tri-license)

;;-----------------------------------------------------------------------------
;; Cilk
;;-----------------------------------------------------------------------------
; XXX/TODO: create cilk-mode with add cilk keywords
(assoc-mode-with 'c-mode '("\\.cilk$" "\\.cilkh"))

;;-----------------------------------------------------------------------------
;; Promela
;;-----------------------------------------------------------------------------
(autoload 'promela-mode "promela-mode" "Editing mode for Promela" t)
;(load "~/.emacs_el/promela-mode.el")
(assoc-mode-with 'promela-mode '("\\.pml$" "\\.pmlh$" "\\.pro$"))

;;-----------------------------------------------------------------------------
;; Load flyspell and auto-fill with LaTeX
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Remove splash screen
(setq inhibit-splash-screen t)

;;-----------------------------------------------------------------------------
(desktop-save-mode 1)

;;-----------------------------------------------------------------------------
;; make IPDL files use C++ mode
(assoc-mode-with 'c++-mode '("\\.ipdl$" "\\.ipdlh$"))

;;-----------------------------------------------------------------------------
;; shut up about the stupid symlinks
(setq vc-follow-symlinks t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
'(default ((t (:inherit nil :stipple nil :background "#356555" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 115 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
;'(Default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 115 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; Good configuration for screencasts.
;'(default ((t (:inherit nil :stipple nil :background "#356555" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;-----------------------------------------------------------------------------
;; cmake
(autoload 'cmake-mode "cmake-mode" "Editing mode for CMake" t)
(assoc-mode-with 'cmake-mode '("CMakeLists\\.txt$" "\\.cmake$"))

;;-----------------------------------------------------------------------------
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(global-set-key (kbd "C-x a") 'kill-other-buffers)   
