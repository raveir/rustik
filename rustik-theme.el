;;; rustik-theme.el --- A low contrast color theme for Emacs.

;; Copyright (C) 2018 Matt Barrett

;; Author: Matt Barrett <matt@monolithic.ca>
;; URL: http://github.com/raveir/rustik
;; Version: 1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Credits:
;; Bozhidar Batsov for his work on Rustik at which this theme was originally based on
;; Jani Nurminen created the original theme for vim on which this port
;; is based.

;;; Code:

(deftheme rustik "The Rustik color theme")

;;; Color Palette

(defvar rustik-default-colors-alist
  '(("rustik-fg+1"     . "#FFFFEF")
    ("rustik-fg"       . "#DCDCCC")
    ("rustik-fg-1"     . "#656555")
    ("rustik-bg-2"     . "#000000")
    ("rustik-bg-1"     . "#2B2B2B")
    ("rustik-bg-05"    . "#383838")
    ("rustik-bg"       . "#3F3F3F")
    ("rustik-bg+05"    . "#494949")
    ("rustik-bg+1"     . "#4F4F4F")
    ("rustik-bg+2"     . "#5F5F5F")
    ("rustik-bg+3"     . "#6F6F6F")
    ("rustik-red+1"    . "#DCA3A3")
    ("rustik-red"      . "#CC9393")
    ("rustik-red-1"    . "#BC8383")
    ("rustik-red-2"    . "#AC7373")
    ("rustik-red-3"    . "#9C6363")
    ("rustik-red-4"    . "#8C5353")
    ("rustik-orange"   . "#DFAF8F")
    ("rustik-yellow"   . "#F0DFAF")
    ("rustik-yellow-1" . "#E0CF9F")
    ("rustik-yellow-2" . "#D0BF8F")
    ("rustik-green-1"  . "#5F7F5F")
    ("rustik-green"    . "#7F9F7F")
    ("rustik-green+1"  . "#8FB28F")
    ("rustik-green+2"  . "#9FC59F")
    ("rustik-green+3"  . "#AFD8AF")
    ("rustik-green+4"  . "#BFEBBF")
    ("rustik-cyan"     . "#93E0E3")
    ("rustik-blue+1"   . "#94BFF3")
    ("rustik-blue"     . "#8CD0D3")
    ("rustik-blue-1"   . "#7CB8BB")
    ("rustik-blue-2"   . "#6CA0A3")
    ("rustik-blue-3"   . "#5C888B")
    ("rustik-blue-4"   . "#4C7073")
    ("rustik-blue-5"   . "#366060")
    ("rustik-magenta"  . "#DC8CC3"))
  "List of Rustik colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defvar rustik-override-colors-alist
  '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist before loading the theme.")

(defvar rustik-colors-alist
  (append rustik-default-colors-alist rustik-override-colors-alist))

(defmacro rustik-with-color-variables (&rest body)
  "`let' bind all colors defined in `rustik-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   rustik-colors-alist))
     ,@body))

;;; Theme Faces
(rustik-with-color-variables
  (custom-theme-set-faces
   'rustik
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,rustik-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,rustik-yellow-2 :underline t :weight normal))))
   `(default ((t (:foreground ,rustik-fg :background ,rustik-bg))))
   `(cursor ((t (:foreground ,rustik-fg :background ,rustik-fg+1))))
   `(escape-glyph ((t (:foreground ,rustik-yellow :weight bold))))
   ;;;;; Changed Fringe to Same Colorss 
   `(fringe ((t (:foreground ,rustik-bg :background ,rustik-bg))))
   `(header-line ((t (:foreground ,rustik-yellow
                                  :background ,rustik-bg+1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,rustik-bg-05))))
   `(success ((t (:foreground ,rustik-green :weight bold))))
   `(warning ((t (:foreground ,rustik-orange :weight bold))))
   `(tooltip ((t (:foreground ,rustik-fg :background ,rustik-bg+1))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,rustik-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,rustik-green))))
   `(compilation-error-face ((t (:foreground ,rustik-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,rustik-fg))))
   `(compilation-info-face ((t (:foreground ,rustik-blue))))
   `(compilation-info ((t (:foreground ,rustik-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,rustik-green))))
   `(compilation-line-face ((t (:foreground ,rustik-yellow))))
   `(compilation-line-number ((t (:foreground ,rustik-yellow))))
   `(compilation-message-face ((t (:foreground ,rustik-blue))))
   `(compilation-warning-face ((t (:foreground ,rustik-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,rustik-fg :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,rustik-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,rustik-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,rustik-fg-1))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,rustik-fg))))
   `(grep-error-face ((t (:foreground ,rustik-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,rustik-blue))))
   `(grep-match-face ((t (:foreground ,rustik-orange :weight bold))))
   `(match ((t (:background ,rustik-bg-1 :foreground ,rustik-orange :weight bold))))
;;;;; info
   `(Info-quoted ((t (:inherit font-lock-constant-face))))
;;;;; isearch
   `(isearch ((t (:foreground ,rustik-yellow-2 :weight bold :background ,rustik-bg+2))))
   `(isearch-fail ((t (:foreground ,rustik-fg :background ,rustik-red-4))))
   `(lazy-highlight ((t (:foreground ,rustik-yellow-2 :weight bold :background ,rustik-bg-05))))

   `(menu ((t (:foreground ,rustik-fg :background ,rustik-bg))))
   `(minibuffer-prompt ((t (:foreground ,rustik-yellow))))
   `(mode-line
     ((,class (:foreground ,rustik-fg
                           :background ,rustik-bg+1
                           :box, nil))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,rustik-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,rustik-fg
                      :background ,rustik-bg+1
                      :box, nil))))
   `(region ((,class (:background ,rustik-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,rustik-bg+2))))
   `(trailing-whitespace ((t (:background ,rustik-red))))
   `(vertical-border ((t (:foreground ,rustik-fg-1))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,rustik-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,rustik-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,rustik-green-1))))
   `(font-lock-constant-face ((t (:foreground ,rustik-green+4))))
   `(font-lock-doc-face ((t (:foreground ,rustik-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,rustik-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,rustik-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,rustik-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,rustik-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,rustik-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,rustik-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,rustik-red))))
   `(font-lock-type-face ((t (:foreground ,rustik-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,rustik-orange))))
   `(font-lock-warning-face ((t (:foreground ,rustik-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,rustik-fg))))
   `(newsticker-default-face ((t (:foreground ,rustik-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,rustik-green+3))))
   `(newsticker-extra-face ((t (:foreground ,rustik-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,rustik-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,rustik-green))))
   `(newsticker-new-item-face ((t (:foreground ,rustik-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,rustik-red))))
   `(newsticker-old-item-face ((t (:foreground ,rustik-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,rustik-fg))))
   `(newsticker-treeview-face ((t (:foreground ,rustik-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,rustik-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,rustik-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,rustik-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,rustik-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,rustik-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,rustik-bg-1 :foreground ,rustik-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,rustik-fg-1 :background ,rustik-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,rustik-green+2 :background ,rustik-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,rustik-fg-1 :background ,rustik-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,rustik-green+1))))
   `(android-mode-error-face ((t (:foreground ,rustik-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,rustik-fg))))
   `(android-mode-verbose-face ((t (:foreground ,rustik-green))))
   `(android-mode-warning-face ((t (:foreground ,rustik-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,rustik-cyan :weight bold))))
   `(anzu-mode-line-no-match ((t (:foreground ,rustik-red :weight bold))))
   `(anzu-match-1 ((t (:foreground ,rustik-bg :background ,rustik-green))))
   `(anzu-match-2 ((t (:foreground ,rustik-bg :background ,rustik-orange))))
   `(anzu-match-3 ((t (:foreground ,rustik-bg :background ,rustik-blue))))
   `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,rustik-yellow))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,rustik-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,rustik-yellow))))
   `(font-latex-italic-face ((t (:foreground ,rustik-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,rustik-orange))))
;;;;; agda-mode
   `(agda2-highlight-keyword-face ((t (:foreground ,rustik-yellow :weight bold))))
   `(agda2-highlight-string-face ((t (:foreground ,rustik-red))))
   `(agda2-highlight-symbol-face ((t (:foreground ,rustik-orange))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,rustik-blue-1))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,rustik-fg))))
   `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,rustik-fg))))
   `(agda2-highlight-datatype-face ((t (:foreground ,rustik-blue))))
   `(agda2-highlight-function-face ((t (:foreground ,rustik-blue))))
   `(agda2-highlight-module-face ((t (:foreground ,rustik-blue-1))))
   `(agda2-highlight-error-face ((t (:foreground ,rustik-bg :background ,rustik-magenta))))
   `(agda2-highlight-unsolved-meta-face ((t (:foreground ,rustik-bg :background ,rustik-magenta))))
   `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,rustik-bg :background ,rustik-magenta))))
   `(agda2-highlight-termination-problem-face ((t (:foreground ,rustik-bg :background ,rustik-magenta))))
   `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,rustik-bg :background ,rustik-magenta))))
   `(agda2-highlight-typechecks-face ((t (:background ,rustik-red-4))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,rustik-bg+3 :foreground ,rustik-bg-2))))
   `(ac-selection-face ((t (:background ,rustik-blue-4 :foreground ,rustik-fg))))
   `(popup-tip-face ((t (:background ,rustik-yellow-2 :foreground ,rustik-bg-2))))
   `(popup-menu-mouse-face ((t (:background ,rustik-yellow-2 :foreground ,rustik-bg-2))))
   `(popup-summary-face ((t (:background ,rustik-bg+3 :foreground ,rustik-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,rustik-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,rustik-bg-1))))
   `(popup-isearch-match ((t (:background ,rustik-bg :foreground ,rustik-fg))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,rustik-fg-1 :background ,rustik-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,rustik-green+3 :background ,rustik-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-1
     ((t (:foreground ,rustik-yellow :background ,rustik-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-2
     ((t (:foreground ,rustik-red+1 :background ,rustik-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,rustik-cyan :background ,rustik-bg :inverse-video nil :weight bold))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,rustik-fg :background ,rustik-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,rustik-orange :background ,rustik-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,rustik-orange :background ,rustik-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,rustik-fg :background ,rustik-bg-1))))
   `(company-tooltip-mouse ((t (:background ,rustik-bg-1))))
   `(company-tooltip-common ((t (:foreground ,rustik-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,rustik-green+2))))
   `(company-scrollbar-fg ((t (:background ,rustik-bg-1))))
   `(company-scrollbar-bg ((t (:background ,rustik-bg+2))))
   `(company-preview ((t (:background ,rustik-green+2))))
   `(company-preview-common ((t (:foreground ,rustik-green+2 :background ,rustik-bg-1))))
;;;;; bm
   `(bm-face ((t (:background ,rustik-yellow-1 :foreground ,rustik-bg))))
   `(bm-fringe-face ((t (:background ,rustik-yellow-1 :foreground ,rustik-bg))))
   `(bm-fringe-persistent-face ((t (:background ,rustik-green-1 :foreground ,rustik-bg))))
   `(bm-persistent-face ((t (:background ,rustik-green-1 :foreground ,rustik-bg))))
;;;;; calfw
   `(cfw:face-annotation ((t (:foreground ,rustik-red :inherit cfw:face-day-title))))
   `(cfw:face-day-title ((t nil)))
   `(cfw:face-default-content ((t (:foreground ,rustik-green))))
   `(cfw:face-default-day ((t (:weight bold))))
   `(cfw:face-disable ((t (:foreground ,rustik-fg-1))))
   `(cfw:face-grid ((t (:inherit shadow))))
   `(cfw:face-header ((t (:inherit font-lock-keyword-face))))
   `(cfw:face-holiday ((t (:inherit cfw:face-sunday))))
   `(cfw:face-periods ((t (:foreground ,rustik-cyan))))
   `(cfw:face-saturday ((t (:foreground ,rustik-blue :weight bold))))
   `(cfw:face-select ((t (:background ,rustik-blue-5))))
   `(cfw:face-sunday ((t (:foreground ,rustik-red :weight bold))))
   `(cfw:face-title ((t (:height 2.0 :inherit (variable-pitch font-lock-keyword-face)))))
   `(cfw:face-today ((t (:foreground ,rustik-cyan :weight bold))))
   `(cfw:face-today-title ((t (:inherit highlight bold))))
   `(cfw:face-toolbar ((t (:background ,rustik-blue-5))))
   `(cfw:face-toolbar-button-off ((t (:underline nil :inherit link))))
   `(cfw:face-toolbar-button-on ((t (:underline nil :inherit link-visited))))
;;;;; cider
   `(cider-result-overlay-face ((t (:background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,rustik-orange :line-width -1)))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,rustik-green+1))))
   `(cider-deprecated-face ((t (:background ,rustik-yellow-2))))
   `(cider-instrumented-face ((t (:box (:color ,rustik-red :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,rustik-cyan :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,rustik-red-4))))
   `(cider-test-error-face ((t (:background ,rustik-magenta))))
   `(cider-test-success-face ((t (:background ,rustik-green-1))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,rustik-cyan))))
   `(circe-my-message-face ((t (:foreground ,rustik-fg))))
   `(circe-fool-face ((t (:foreground ,rustik-red+1))))
   `(circe-topic-diff-removed-face ((t (:foreground ,rustik-red :weight bold))))
   `(circe-originator-face ((t (:foreground ,rustik-fg))))
   `(circe-server-face ((t (:foreground ,rustik-green))))
   `(circe-topic-diff-new-face ((t (:foreground ,rustik-orange :weight bold))))
   `(circe-prompt-face ((t (:foreground ,rustik-orange :background ,rustik-bg :weight bold))))
;;;;; context-coloring
   `(context-coloring-level-0-face ((t :foreground ,rustik-fg)))
   `(context-coloring-level-1-face ((t :foreground ,rustik-cyan)))
   `(context-coloring-level-2-face ((t :foreground ,rustik-green+4)))
   `(context-coloring-level-3-face ((t :foreground ,rustik-yellow)))
   `(context-coloring-level-4-face ((t :foreground ,rustik-orange)))
   `(context-coloring-level-5-face ((t :foreground ,rustik-magenta)))
   `(context-coloring-level-6-face ((t :foreground ,rustik-blue+1)))
   `(context-coloring-level-7-face ((t :foreground ,rustik-green+2)))
   `(context-coloring-level-8-face ((t :foreground ,rustik-yellow-2)))
   `(context-coloring-level-9-face ((t :foreground ,rustik-red+1)))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,rustik-blue :foreground ,rustik-bg))))
   `(ctbl:face-continue-bar ((t (:background ,rustik-bg-05 :foreground ,rustik-bg))))
   `(ctbl:face-row-select ((t (:background ,rustik-cyan :foreground ,rustik-bg))))
;;;;; debbugs
   `(debbugs-gnu-done ((t (:foreground ,rustik-fg-1))))
   `(debbugs-gnu-handled ((t (:foreground ,rustik-green))))
   `(debbugs-gnu-new ((t (:foreground ,rustik-red))))
   `(debbugs-gnu-pending ((t (:foreground ,rustik-blue))))
   `(debbugs-gnu-stale ((t (:foreground ,rustik-orange))))
   `(debbugs-gnu-tagged ((t (:foreground ,rustik-red))))
;;;;; diff
   `(diff-added          ((t (:background "#335533" :foreground ,rustik-green))))
   `(diff-changed        ((t (:background "#555511" :foreground ,rustik-yellow-1))))
   `(diff-removed        ((t (:background "#553333" :foreground ,rustik-red-2))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,rustik-green+4))))
   `(diff-refine-change  ((t (:background "#888811" :foreground ,rustik-yellow))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,rustik-red))))
   `(diff-header ((,class (:background ,rustik-bg+2))
                  (t (:background ,rustik-fg :foreground ,rustik-bg))))
   `(diff-file-header
     ((,class (:background ,rustik-bg+2 :foreground ,rustik-fg :weight bold))
      (t (:background ,rustik-fg :foreground ,rustik-bg :weight bold))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,rustik-blue :background ,rustik-blue-2))))
   `(diff-hl-delete ((,class (:foreground ,rustik-red+1 :background ,rustik-red-1))))
   `(diff-hl-insert ((,class (:foreground ,rustik-green+1 :background ,rustik-green-1))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,rustik-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,rustik-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,rustik-orange))))
   `(diredp-date-time ((t (:foreground ,rustik-magenta))))
   `(diredp-deletion ((t (:foreground ,rustik-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,rustik-red))))
   `(diredp-dir-heading ((t (:foreground ,rustik-blue :background ,rustik-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,rustik-cyan))))
   `(diredp-exec-priv ((t (:foreground ,rustik-red))))
   `(diredp-executable-tag ((t (:foreground ,rustik-green+1))))
   `(diredp-file-name ((t (:foreground ,rustik-blue))))
   `(diredp-file-suffix ((t (:foreground ,rustik-green))))
   `(diredp-flag-mark ((t (:foreground ,rustik-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,rustik-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,rustik-red))))
   `(diredp-link-priv ((t (:foreground ,rustik-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,rustik-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,rustik-orange))))
   `(diredp-no-priv ((t (:foreground ,rustik-fg))))
   `(diredp-number ((t (:foreground ,rustik-green+1))))
   `(diredp-other-priv ((t (:foreground ,rustik-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,rustik-red-1))))
   `(diredp-read-priv ((t (:foreground ,rustik-green-1))))
   `(diredp-symlink ((t (:foreground ,rustik-yellow))))
   `(diredp-write-priv ((t (:foreground ,rustik-magenta))))
;;;;; dired-async
   `(dired-async-failures ((t (:foreground ,rustik-red :weight bold))))
   `(dired-async-message ((t (:foreground ,rustik-yellow :weight bold))))
   `(dired-async-mode-message ((t (:foreground ,rustik-yellow))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,rustik-fg :background ,rustik-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,rustik-fg :background ,rustik-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,rustik-fg :background ,rustik-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,rustik-fg :background ,rustik-blue-5))))
   `(ediff-even-diff-A ((t (:background ,rustik-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,rustik-bg+1))))
   `(ediff-even-diff-B ((t (:background ,rustik-bg+1))))
   `(ediff-even-diff-C ((t (:background ,rustik-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,rustik-fg :background ,rustik-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,rustik-fg :background ,rustik-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,rustik-fg :background ,rustik-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,rustik-fg :background ,rustik-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,rustik-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,rustik-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,rustik-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,rustik-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,rustik-fg))))
   `(egg-help-header-1 ((t (:foreground ,rustik-yellow))))
   `(egg-help-header-2 ((t (:foreground ,rustik-green+3))))
   `(egg-branch ((t (:foreground ,rustik-yellow))))
   `(egg-branch-mono ((t (:foreground ,rustik-yellow))))
   `(egg-term ((t (:foreground ,rustik-yellow))))
   `(egg-diff-add ((t (:foreground ,rustik-green+4))))
   `(egg-diff-del ((t (:foreground ,rustik-red+1))))
   `(egg-diff-file-header ((t (:foreground ,rustik-yellow-2))))
   `(egg-section-title ((t (:foreground ,rustik-yellow))))
   `(egg-stash-mono ((t (:foreground ,rustik-green+4))))
;;;;; elfeed
   `(elfeed-log-error-level-face ((t (:foreground ,rustik-red))))
   `(elfeed-log-info-level-face ((t (:foreground ,rustik-blue))))
   `(elfeed-log-warn-level-face ((t (:foreground ,rustik-yellow))))
   `(elfeed-search-date-face ((t (:foreground ,rustik-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,rustik-green))))
   `(elfeed-search-feed-face ((t (:foreground ,rustik-cyan))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,rustik-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,rustik-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,rustik-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,rustik-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,rustik-green+2 :background ,rustik-bg))))
   `(w3m-lnum-match ((t (:background ,rustik-bg-1
                                     :foreground ,rustik-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,rustik-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,rustik-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,rustik-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default-face))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,rustik-yellow))))
   `(erc-keyword-face ((t (:foreground ,rustik-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,rustik-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,rustik-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:foreground ,rustik-green))))
   `(erc-pal-face ((t (:foreground ,rustik-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,rustik-orange :background ,rustik-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,rustik-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; eros
   `(eros-result-overlay-face ((t (:background unspecified))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,rustik-green+4 :background ,rustik-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,rustik-red :background ,rustik-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,rustik-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,rustik-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,rustik-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,rustik-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,rustik-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,rustik-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,rustik-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,rustik-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-red-1) :inherit unspecified))
      (t (:foreground ,rustik-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-yellow) :inherit unspecified))
      (t (:foreground ,rustik-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-cyan) :inherit unspecified))
      (t (:foreground ,rustik-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,rustik-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,rustik-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,rustik-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,rustik-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,rustik-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,rustik-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-orange) :inherit unspecified))
      (t (:foreground ,rustik-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-red) :inherit unspecified))
      (t (:foreground ,rustik-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,rustik-fg))))
   `(ack-file ((t (:foreground ,rustik-blue))))
   `(ack-line ((t (:foreground ,rustik-yellow))))
   `(ack-match ((t (:foreground ,rustik-orange :background ,rustik-bg-1 :weight bold))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,rustik-green+1 :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,rustik-blue+1  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,rustik-yellow  :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,rustik-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,rustik-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,rustik-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,rustik-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,rustik-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,rustik-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,rustik-magenta :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, rustik-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:weight bold :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:weight bold :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:weight bold :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-to))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-server-opened ((t (:foreground ,rustik-green+2 :weight bold))))
   `(gnus-server-denied ((t (:foreground ,rustik-red+1 :weight bold))))
   `(gnus-server-closed ((t (:foreground ,rustik-blue :slant italic))))
   `(gnus-server-offline ((t (:foreground ,rustik-yellow :weight bold))))
   `(gnus-server-agent ((t (:foreground ,rustik-blue :weight bold))))
   `(gnus-summary-cancelled ((t (:foreground ,rustik-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,rustik-blue))))
   `(gnus-summary-high-read ((t (:foreground ,rustik-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,rustik-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,rustik-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,rustik-blue))))
   `(gnus-summary-low-read ((t (:foreground ,rustik-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,rustik-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,rustik-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,rustik-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,rustik-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,rustik-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,rustik-fg))))
   `(gnus-summary-selected ((t (:foreground ,rustik-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,rustik-blue))))
   `(gnus-cite-10 ((t (:foreground ,rustik-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,rustik-yellow))))
   `(gnus-cite-2 ((t (:foreground ,rustik-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,rustik-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,rustik-green+2))))
   `(gnus-cite-5 ((t (:foreground ,rustik-green+1))))
   `(gnus-cite-6 ((t (:foreground ,rustik-green))))
   `(gnus-cite-7 ((t (:foreground ,rustik-red))))
   `(gnus-cite-8 ((t (:foreground ,rustik-red-1))))
   `(gnus-cite-9 ((t (:foreground ,rustik-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,rustik-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,rustik-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,rustik-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,rustik-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,rustik-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,rustik-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,rustik-bg+2))))
   `(gnus-signature ((t (:foreground ,rustik-yellow))))
   `(gnus-x ((t (:background ,rustik-fg :foreground ,rustik-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,rustik-blue))))
   `(guide-key/key-face ((t (:foreground ,rustik-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,rustik-green+1))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,rustik-green
                      :background ,rustik-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,rustik-yellow
                      :background ,rustik-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,rustik-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,rustik-bg+1))))
   `(helm-visible-mark ((t (:foreground ,rustik-bg :background ,rustik-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,rustik-green+4 :background ,rustik-bg-1))))
   `(helm-separator ((t (:foreground ,rustik-red :background ,rustik-bg))))
   `(helm-time-zone-current ((t (:foreground ,rustik-green+2 :background ,rustik-bg))))
   `(helm-time-zone-home ((t (:foreground ,rustik-red :background ,rustik-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,rustik-orange :background ,rustik-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,rustik-magenta :background ,rustik-bg))))
   `(helm-bookmark-info ((t (:foreground ,rustik-green+2 :background ,rustik-bg))))
   `(helm-bookmark-man ((t (:foreground ,rustik-yellow :background ,rustik-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,rustik-magenta :background ,rustik-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,rustik-red :background ,rustik-bg))))
   `(helm-buffer-process ((t (:foreground ,rustik-cyan :background ,rustik-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,rustik-fg :background ,rustik-bg))))
   `(helm-buffer-size ((t (:foreground ,rustik-fg-1 :background ,rustik-bg))))
   `(helm-ff-directory ((t (:foreground ,rustik-cyan :background ,rustik-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,rustik-fg :background ,rustik-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,rustik-green+2 :background ,rustik-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,rustik-red :background ,rustik-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,rustik-yellow :background ,rustik-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,rustik-bg :background ,rustik-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,rustik-cyan :background ,rustik-bg))))
   `(helm-grep-file ((t (:foreground ,rustik-fg :background ,rustik-bg))))
   `(helm-grep-finish ((t (:foreground ,rustik-green+2 :background ,rustik-bg))))
   `(helm-grep-lineno ((t (:foreground ,rustik-fg-1 :background ,rustik-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,rustik-red :background ,rustik-bg))))
   `(helm-match ((t (:foreground ,rustik-orange :background ,rustik-bg-1 :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,rustik-cyan :background ,rustik-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,rustik-fg-1 :background ,rustik-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,rustik-fg :background ,rustik-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,rustik-fg :background ,rustik-bg+1))))
   `(helm-swoop-target-word-face ((t (:foreground ,rustik-yellow :background ,rustik-bg+2 :weight bold))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,rustik-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,rustik-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,rustik-bg+1))
                   (t :weight bold)))
;;;;; hydra
   `(hydra-face-red ((t (:foreground ,rustik-red-1 :background ,rustik-bg))))
   `(hydra-face-amaranth ((t (:foreground ,rustik-red-3 :background ,rustik-bg))))
   `(hydra-face-blue ((t (:foreground ,rustik-blue :background ,rustik-bg))))
   `(hydra-face-pink ((t (:foreground ,rustik-magenta :background ,rustik-bg))))
   `(hydra-face-teal ((t (:foreground ,rustik-cyan :background ,rustik-bg))))
;;;;; info+
   `(info-command-ref-item ((t (:background ,rustik-bg-1 :foreground ,rustik-orange))))
   `(info-constant-ref-item ((t (:background ,rustik-bg-1 :foreground ,rustik-magenta))))
   `(info-double-quoted-name ((t (:inherit font-lock-comment-face))))
   `(info-file ((t (:background ,rustik-bg-1 :foreground ,rustik-yellow))))
   `(info-function-ref-item ((t (:background ,rustik-bg-1 :inherit font-lock-function-name-face))))
   `(info-macro-ref-item ((t (:background ,rustik-bg-1 :foreground ,rustik-yellow))))
   `(info-menu ((t (:foreground ,rustik-yellow))))
   `(info-quoted-name ((t (:inherit font-lock-constant-face))))
   `(info-reference-item ((t (:background ,rustik-bg-1))))
   `(info-single-quote ((t (:inherit font-lock-keyword-face))))
   `(info-special-form-ref-item ((t (:background ,rustik-bg-1 :foreground ,rustik-yellow))))
   `(info-string ((t (:inherit font-lock-string-face))))
   `(info-syntax-class-item ((t (:background ,rustik-bg-1 :foreground ,rustik-blue+1))))
   `(info-user-option-ref-item ((t (:background ,rustik-bg-1 :foreground ,rustik-red))))
   `(info-variable-ref-item ((t (:background ,rustik-bg-1 :foreground ,rustik-orange))))
;;;;; irfc
   `(irfc-head-name-face ((t (:foreground ,rustik-red :weight bold))))
   `(irfc-head-number-face ((t (:foreground ,rustik-red :weight bold))))
   `(irfc-reference-face ((t (:foreground ,rustik-blue-1 :weight bold))))
   `(irfc-requirement-keyword-face ((t (:inherit font-lock-keyword-face))))
   `(irfc-rfc-link-face ((t (:inherit link))))
   `(irfc-rfc-number-face ((t (:foreground ,rustik-cyan :weight bold))))
   `(irfc-std-number-face ((t (:foreground ,rustik-green+4 :weight bold))))
   `(irfc-table-item-face ((t (:foreground ,rustik-green+3))))
   `(irfc-title-face ((t (:foreground ,rustik-yellow
                                      :underline t :weight bold))))
;;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,rustik-green :background ,rustik-bg))))
   `(ivy-match-required-face ((t (:foreground ,rustik-red :background ,rustik-bg))))
   `(ivy-remote ((t (:foreground ,rustik-blue :background ,rustik-bg))))
   `(ivy-subdir ((t (:foreground ,rustik-yellow :background ,rustik-bg))))
   `(ivy-current-match ((t (:foreground ,rustik-yellow :weight bold :underline t))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,rustik-bg+1))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,rustik-green-1))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,rustik-green))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,rustik-green+1))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,rustik-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,rustik-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,rustik-yellow))))
   `(ido-indicator ((t (:foreground ,rustik-yellow :background ,rustik-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,rustik-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,rustik-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,rustik-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,rustik-red+1))))
   `(jabber-roster-user-xa ((t (:foreground ,rustik-magenta))))
   `(jabber-roster-user-chatty ((t (:foreground ,rustik-orange))))
   `(jabber-roster-user-error ((t (:foreground ,rustik-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,rustik-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,rustik-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,rustik-red+1))))
   `(jabber-chat-prompt-system ((t (:foreground ,rustik-green+3))))
   `(jabber-activity-face((t (:foreground ,rustik-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,rustik-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,rustik-orange))))
   `(js2-error ((t (:foreground ,rustik-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,rustik-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,rustik-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,rustik-green+3))))
   `(js2-function-param ((t (:foreground, rustik-orange))))
   `(js2-external-variable ((t (:foreground ,rustik-orange))))
;;;;; additional js2 mode attributes for better syntax highlighting
   `(js2-instance-member ((t (:foreground ,rustik-green-1))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,rustik-orange))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,rustik-red-1))))
   `(js2-object-property ((t (:foreground ,rustik-blue+1))))
   `(js2-magic-paren ((t (:foreground ,rustik-blue-5))))
   `(js2-private-function-call ((t (:foreground ,rustik-cyan))))
   `(js2-function-call ((t (:foreground ,rustik-cyan))))
   `(js2-private-member ((t (:foreground ,rustik-blue-1))))
   `(js2-keywords ((t (:foreground ,rustik-magenta))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,rustik-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,rustik-fg :weight normal))))
   `(ledger-font-payee-pending-face ((t (:foreground ,rustik-red :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,rustik-bg+1))))
   `(ledger-font-auto-xact-face ((t (:foreground ,rustik-yellow-1 :weight normal))))
   `(ledger-font-periodic-xact-face ((t (:foreground ,rustik-green :weight normal))))
   `(ledger-font-pending-face ((t (:foreground ,rustik-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,rustik-fg))))
   `(ledger-font-posting-date-face ((t (:foreground ,rustik-orange :weight normal))))
   `(ledger-font-posting-account-face ((t (:foreground ,rustik-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,rustik-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,rustik-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,rustik-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,rustik-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,rustik-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,rustik-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,rustik-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,rustik-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,rustik-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,rustik-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,rustik-bg+3 :background ,rustik-bg))))
;;;;; lispy
   `(lispy-command-name-face ((t (:background ,rustik-bg-05 :inherit font-lock-function-name-face))))
   `(lispy-cursor-face ((t (:foreground ,rustik-bg :background ,rustik-fg))))
   `(lispy-face-hint ((t (:inherit highlight :foreground ,rustik-yellow))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,rustik-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,rustik-yellow))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,rustik-yellow :box t))))
   `(ruler-mode-default ((t (:foreground ,rustik-green+2 :background ,rustik-bg))))

;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,rustik-blue-1))))
   `(lui-hilight-face ((t (:foreground ,rustik-green+2 :background ,rustik-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,rustik-green+2 :background ,rustik-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,rustik-red+1 :background ,rustik-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,rustik-blue+1 :background ,rustik-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,rustik-magenta :background ,rustik-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,rustik-yellow :background ,rustik-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs
   `(magit-section-highlight           ((t (:background ,rustik-bg+05))))
   `(magit-section-heading             ((t (:foreground ,rustik-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,rustik-orange :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,rustik-bg+05  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,rustik-bg+05
                                                        :foreground ,rustik-orange :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,rustik-bg+1))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,rustik-bg+2))))
   `(magit-diff-hunk-heading-selection ((t (:background ,rustik-bg+2
                                                        :foreground ,rustik-orange))))
   `(magit-diff-lines-heading          ((t (:background ,rustik-orange
                                                        :foreground ,rustik-bg+2))))
   `(magit-diff-context-highlight      ((t (:background ,rustik-bg+05
                                                        :foreground "grey70"))))
   `(magit-diffstat-added   ((t (:foreground ,rustik-green+4))))
   `(magit-diffstat-removed ((t (:foreground ,rustik-red))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,rustik-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,rustik-green-1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,rustik-green   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,rustik-fg-1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,rustik-blue-2  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,rustik-green  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,rustik-red    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,rustik-orange))))
   `(magit-log-date      ((t (:foreground ,rustik-fg-1))))
   `(magit-log-graph     ((t (:foreground ,rustik-fg+1))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,rustik-yellow-2))))
   `(magit-sequence-stop ((t (:foreground ,rustik-green))))
   `(magit-sequence-part ((t (:foreground ,rustik-yellow))))
   `(magit-sequence-head ((t (:foreground ,rustik-blue))))
   `(magit-sequence-drop ((t (:foreground ,rustik-red))))
   `(magit-sequence-done ((t (:foreground ,rustik-fg-1))))
   `(magit-sequence-onto ((t (:foreground ,rustik-fg-1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,rustik-green))))
   `(magit-bisect-skip ((t (:foreground ,rustik-yellow))))
   `(magit-bisect-bad  ((t (:foreground ,rustik-red))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,rustik-bg-1 :foreground ,rustik-blue-2))))
   `(magit-blame-hash    ((t (:background ,rustik-bg-1 :foreground ,rustik-blue-2))))
   `(magit-blame-name    ((t (:background ,rustik-bg-1 :foreground ,rustik-orange))))
   `(magit-blame-date    ((t (:background ,rustik-bg-1 :foreground ,rustik-orange))))
   `(magit-blame-summary ((t (:background ,rustik-bg-1 :foreground ,rustik-blue-2
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,rustik-bg+3))))
   `(magit-hash           ((t (:foreground ,rustik-bg+3))))
   `(magit-tag            ((t (:foreground ,rustik-orange :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,rustik-green  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,rustik-blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,rustik-blue   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,rustik-blue   :weight bold))))
   `(magit-refname        ((t (:background ,rustik-bg+2 :foreground ,rustik-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,rustik-bg+2 :foreground ,rustik-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,rustik-bg+2 :foreground ,rustik-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,rustik-green))))
   `(magit-signature-bad       ((t (:foreground ,rustik-red))))
   `(magit-signature-untrusted ((t (:foreground ,rustik-yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,rustik-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,rustik-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,rustik-green))))
   `(magit-reflog-amend        ((t (:foreground ,rustik-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,rustik-green))))
   `(magit-reflog-checkout     ((t (:foreground ,rustik-blue))))
   `(magit-reflog-reset        ((t (:foreground ,rustik-red))))
   `(magit-reflog-rebase       ((t (:foreground ,rustik-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,rustik-green))))
   `(magit-reflog-remote       ((t (:foreground ,rustik-cyan))))
   `(magit-reflog-other        ((t (:foreground ,rustik-cyan))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,rustik-green+1))))
   `(message-header-other ((t (:foreground ,rustik-green))))
   `(message-header-to ((t (:foreground ,rustik-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,rustik-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,rustik-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,rustik-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,rustik-green))))
   `(message-mml ((t (:foreground ,rustik-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,rustik-orange))))
   `(mew-face-header-from ((t (:foreground ,rustik-yellow))))
   `(mew-face-header-date ((t (:foreground ,rustik-green))))
   `(mew-face-header-to ((t (:foreground ,rustik-red))))
   `(mew-face-header-key ((t (:foreground ,rustik-green))))
   `(mew-face-header-private ((t (:foreground ,rustik-green))))
   `(mew-face-header-important ((t (:foreground ,rustik-blue))))
   `(mew-face-header-marginal ((t (:foreground ,rustik-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,rustik-red))))
   `(mew-face-header-xmew ((t (:foreground ,rustik-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,rustik-red))))
   `(mew-face-body-url ((t (:foreground ,rustik-orange))))
   `(mew-face-body-comment ((t (:foreground ,rustik-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,rustik-green))))
   `(mew-face-body-cite2 ((t (:foreground ,rustik-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,rustik-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,rustik-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,rustik-red))))
   `(mew-face-mark-review ((t (:foreground ,rustik-blue))))
   `(mew-face-mark-escape ((t (:foreground ,rustik-green))))
   `(mew-face-mark-delete ((t (:foreground ,rustik-red))))
   `(mew-face-mark-unlink ((t (:foreground ,rustik-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,rustik-green))))
   `(mew-face-mark-unread ((t (:foreground ,rustik-red-2))))
   `(mew-face-eof-message ((t (:foreground ,rustik-green))))
   `(mew-face-eof-part ((t (:foreground ,rustik-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,rustik-cyan :background ,rustik-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,rustik-bg :background ,rustik-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,rustik-bg :background ,rustik-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,rustik-blue))))
   `(mingus-pausing-face ((t (:foreground ,rustik-magenta))))
   `(mingus-playing-face ((t (:foreground ,rustik-cyan))))
   `(mingus-playlist-face ((t (:foreground ,rustik-cyan ))))
   `(mingus-mark-face ((t (:bold t :foreground ,rustik-magenta))))
   `(mingus-song-file-face ((t (:foreground ,rustik-yellow))))
   `(mingus-artist-face ((t (:foreground ,rustik-cyan))))
   `(mingus-album-face ((t (:underline t :foreground ,rustik-red+1))))
   `(mingus-album-stale-face ((t (:foreground ,rustik-red+1))))
   `(mingus-stopped-face ((t (:foreground ,rustik-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,rustik-yellow))))
   `(nav-face-button-num ((t (:foreground ,rustik-cyan))))
   `(nav-face-dir ((t (:foreground ,rustik-green))))
   `(nav-face-hdir ((t (:foreground ,rustik-red))))
   `(nav-face-file ((t (:foreground ,rustik-fg))))
   `(nav-face-hfile ((t (:foreground ,rustik-red-4))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,rustik-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,rustik-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,rustik-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,rustik-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,rustik-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,rustik-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,rustik-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,rustik-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,rustik-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,rustik-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,rustik-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,rustik-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,rustik-bg+1))))
;;;;; neotree
   `(neo-banner-face ((t (:foreground ,rustik-blue+1 :weight bold))))
   `(neo-header-face ((t (:foreground ,rustik-fg))))
   `(neo-root-dir-face ((t (:foreground ,rustik-blue+1 :weight bold))))
   `(neo-dir-link-face ((t (:foreground ,rustik-blue))))
   `(neo-file-link-face ((t (:foreground ,rustik-fg))))
   `(neo-expand-btn-face ((t (:foreground ,rustik-blue))))
   `(neo-vc-default-face ((t (:foreground ,rustik-fg+1))))
   `(neo-vc-user-face ((t (:foreground ,rustik-red :slant italic))))
   `(neo-vc-up-to-date-face ((t (:foreground ,rustik-fg))))
   `(neo-vc-edited-face ((t (:foreground ,rustik-magenta))))
   `(neo-vc-needs-merge-face ((t (:foreground ,rustik-red+1))))
   `(neo-vc-unlocked-changes-face ((t (:foreground ,rustik-red :background ,rustik-blue-5))))
   `(neo-vc-added-face ((t (:foreground ,rustik-green+1))))
   `(neo-vc-conflict-face ((t (:foreground ,rustik-red+1))))
   `(neo-vc-missing-face ((t (:foreground ,rustik-red+1))))
   `(neo-vc-ignored-face ((t (:foreground ,rustik-fg-1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,rustik-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,rustik-fg :weight bold))))
   `(org-checkbox ((t (:background ,rustik-bg+2 :foreground ,rustik-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,rustik-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,rustik-red-1))))
   `(org-done ((t (:weight bold :weight bold :foreground ,rustik-green+3))))
   `(org-formula ((t (:foreground ,rustik-yellow-2))))
   `(org-headline-done ((t (:foreground ,rustik-green+3))))
   `(org-hide ((t (:foreground ,rustik-bg-1))))
   `(org-level-1 ((t (:foreground ,rustik-orange))))
   `(org-level-2 ((t (:foreground ,rustik-green+4))))
   `(org-level-3 ((t (:foreground ,rustik-blue-1))))
   `(org-level-4 ((t (:foreground ,rustik-yellow-2))))
   `(org-level-5 ((t (:foreground ,rustik-cyan))))
   `(org-level-6 ((t (:foreground ,rustik-green+2))))
   `(org-level-7 ((t (:foreground ,rustik-red-4))))
   `(org-level-8 ((t (:foreground ,rustik-blue-4))))
   `(org-link ((t (:foreground ,rustik-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,rustik-green+4))))
   `(org-scheduled-previously ((t (:foreground ,rustik-red))))
   `(org-scheduled-today ((t (:foreground ,rustik-blue+1))))
   `(org-sexp-date ((t (:foreground ,rustik-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,rustik-green+2))))
   `(org-tag ((t (:weight bold :weight bold))))
   `(org-time-grid ((t (:foreground ,rustik-orange))))
   `(org-todo ((t (:weight bold :foreground ,rustik-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:weight bold :foreground ,rustik-red :weight bold :underline nil))))
   `(org-column ((t (:background ,rustik-bg-1))))
   `(org-column-title ((t (:background ,rustik-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,rustik-fg :background ,rustik-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,rustik-bg :background ,rustik-red-1))))
   `(org-ellipsis ((t (:foreground ,rustik-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,rustik-cyan :underline t))))
   `(org-document-title ((t (:foreground ,rustik-blue))))
   `(org-document-info ((t (:foreground ,rustik-blue))))
   `(org-habit-ready-face ((t :background ,rustik-green)))
   `(org-habit-alert-face ((t :background ,rustik-yellow-1 :foreground ,rustik-bg)))
   `(org-habit-clear-face ((t :background ,rustik-blue-3)))
   `(org-habit-overdue-face ((t :background ,rustik-red-3)))
   `(org-habit-clear-future-face ((t :background ,rustik-blue-4)))
   `(org-habit-ready-future-face ((t :background ,rustik-green-1)))
   `(org-habit-alert-future-face ((t :background ,rustik-yellow-2 :foreground ,rustik-bg)))
   `(org-habit-overdue-future-face ((t :background ,rustik-red-4)))
;;;;; outline
   `(outline-1 ((t (:foreground ,rustik-orange))))
   `(outline-2 ((t (:foreground ,rustik-green+4))))
   `(outline-3 ((t (:foreground ,rustik-blue-1))))
   `(outline-4 ((t (:foreground ,rustik-yellow-2))))
   `(outline-5 ((t (:foreground ,rustik-cyan))))
   `(outline-6 ((t (:foreground ,rustik-green+2))))
   `(outline-7 ((t (:foreground ,rustik-red-4))))
   `(outline-8 ((t (:foreground ,rustik-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,rustik-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,rustik-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,rustik-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,rustik-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,rustik-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,rustik-fg :background ,rustik-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,rustik-bg :background ,rustik-orange))))
   `(proof-error-face ((t (:foreground ,rustik-fg :background ,rustik-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,rustik-bg :background ,rustik-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,rustik-bg :background ,rustik-orange))))
   `(proof-locked-face ((t (:background ,rustik-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,rustik-bg :background ,rustik-orange))))
   `(proof-queue-face ((t (:background ,rustik-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,rustik-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,rustik-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,rustik-bg))))
   `(proof-warning-face ((t (:foreground ,rustik-bg :background ,rustik-yellow-1))))
;;;;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,rustik-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,rustik-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,rustik-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,rustik-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,rustik-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,rustik-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,rustik-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,rustik-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,rustik-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,rustik-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,rustik-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,rustik-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,rustik-blue))))
   `(rcirc-other-nick ((t (:foreground ,rustik-orange))))
   `(rcirc-bright-nick ((t (:foreground ,rustik-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,rustik-blue-2))))
   `(rcirc-server ((t (:foreground ,rustik-green))))
   `(rcirc-server-prefix ((t (:foreground ,rustik-green+1))))
   `(rcirc-timestamp ((t (:foreground ,rustik-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,rustik-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:weight bold))))
   `(rcirc-prompt ((t (:foreground ,rustik-yellow :weight bold))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:weight bold))))
   `(rcirc-url ((t (:weight bold))))
   `(rcirc-keyword ((t (:foreground ,rustik-yellow :weight bold))))
;;;;; re-builder
   `(reb-match-0 ((t (:foreground ,rustik-bg :background ,rustik-magenta))))
   `(reb-match-1 ((t (:foreground ,rustik-bg :background ,rustik-blue))))
   `(reb-match-2 ((t (:foreground ,rustik-bg :background ,rustik-orange))))
   `(reb-match-3 ((t (:foreground ,rustik-bg :background ,rustik-red))))
;;;;; regex-tool
   `(regex-tool-matched-face ((t (:background ,rustik-blue-4 :weight bold))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,rustik-green))))
   `(rpm-spec-doc-face ((t (:foreground ,rustik-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,rustik-red))))
   `(rpm-spec-macro-face ((t (:foreground ,rustik-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,rustik-red))))
   `(rpm-spec-package-face ((t (:foreground ,rustik-red))))
   `(rpm-spec-section-face ((t (:foreground ,rustik-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,rustik-blue))))
   `(rpm-spec-var-face ((t (:foreground ,rustik-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,rustik-orange))))
   `(rst-level-2-face ((t (:foreground ,rustik-green+1))))
   `(rst-level-3-face ((t (:foreground ,rustik-blue-1))))
   `(rst-level-4-face ((t (:foreground ,rustik-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,rustik-cyan))))
   `(rst-level-6-face ((t (:foreground ,rustik-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,rustik-yellow :weight bold))))
   `(sh-quoted-exec ((t (:foreground ,rustik-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,rustik-red+1 :background ,rustik-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,rustik-bg+3 :weight bold))))
;;;;; smart-mode-line
   ;; use (setq sml/theme nil) to enable Rustik for sml
   `(sml/global ((,class (:foreground ,rustik-fg :weight bold))))
   `(sml/modes ((,class (:foreground ,rustik-yellow :weight bold))))
   `(sml/minor-modes ((,class (:foreground ,rustik-fg-1 :weight bold))))
   `(sml/filename ((,class (:foreground ,rustik-yellow :weight bold))))
   `(sml/line-number ((,class (:foreground ,rustik-blue :weight bold))))
   `(sml/col-number ((,class (:foreground ,rustik-blue+1 :weight bold))))
   `(sml/position-percentage ((,class (:foreground ,rustik-blue-1 :weight bold))))
   `(sml/prefix ((,class (:foreground ,rustik-orange))))
   `(sml/git ((,class (:foreground ,rustik-green+3))))
   `(sml/process ((,class (:weight bold))))
   `(sml/sudo ((,class  (:foreground ,rustik-orange :weight bold))))
   `(sml/read-only ((,class (:foreground ,rustik-red-2))))
   `(sml/outside-modified ((,class (:foreground ,rustik-orange))))
   `(sml/modified ((,class (:foreground ,rustik-red))))
   `(sml/vc-edited ((,class (:foreground ,rustik-green+2))))
   `(sml/charging ((,class (:foreground ,rustik-green+4))))
   `(sml/discharging ((,class (:foreground ,rustik-red+1))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,rustik-red+1 :background ,rustik-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,rustik-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,rustik-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,rustik-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-red)))
      (t
       (:underline ,rustik-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-orange)))
      (t
       (:underline ,rustik-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-yellow)))
      (t
       (:underline ,rustik-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rustik-green)))
      (t
       (:underline ,rustik-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,rustik-green+2))))
   `(speedbar-directory-face ((t (:foreground ,rustik-cyan))))
   `(speedbar-file-face ((t (:foreground ,rustik-fg))))
   `(speedbar-highlight-face ((t (:foreground ,rustik-bg :background ,rustik-green+2))))
   `(speedbar-selected-face ((t (:foreground ,rustik-red))))
   `(speedbar-separator-face ((t (:foreground ,rustik-bg :background ,rustik-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,rustik-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,rustik-fg
                                    :background ,rustik-bg))))
   `(tabbar-selected ((t (:foreground ,rustik-fg
                                      :background ,rustik-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,rustik-fg
                                        :background ,rustik-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,rustik-bg
                                       :background ,rustik-bg-1))))
   `(term-color-red ((t (:foreground ,rustik-red-2
                                     :background ,rustik-red-4))))
   `(term-color-green ((t (:foreground ,rustik-green
                                       :background ,rustik-green+2))))
   `(term-color-yellow ((t (:foreground ,rustik-orange
                                        :background ,rustik-yellow))))
   `(term-color-blue ((t (:foreground ,rustik-blue-1
                                      :background ,rustik-blue-4))))
   `(term-color-magenta ((t (:foreground ,rustik-magenta
                                         :background ,rustik-red))))
   `(term-color-cyan ((t (:foreground ,rustik-cyan
                                      :background ,rustik-blue))))
   `(term-color-white ((t (:foreground ,rustik-fg
                                       :background ,rustik-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,rustik-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,rustik-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,rustik-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,rustik-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,rustik-cyan))))
;;;;; visual-regexp
   `(vr/group-0 ((t (:foreground ,rustik-bg :background ,rustik-green :weight bold))))
   `(vr/group-1 ((t (:foreground ,rustik-bg :background ,rustik-orange :weight bold))))
   `(vr/group-2 ((t (:foreground ,rustik-bg :background ,rustik-blue :weight bold))))
   `(vr/match-0 ((t (:inherit isearch))))
   `(vr/match-1 ((t (:foreground ,rustik-yellow-2 :background ,rustik-bg-1 :weight bold))))
   `(vr/match-separator-face ((t (:foreground ,rustik-red :weight bold))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,rustik-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,rustik-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,rustik-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,rustik-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,rustik-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,rustik-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,rustik-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,rustik-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,rustik-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,rustik-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,rustik-bg+1 :foreground ,rustik-bg+1))))
   `(whitespace-hspace ((t (:background ,rustik-bg+1 :foreground ,rustik-bg+1))))
   `(whitespace-tab ((t (:background ,rustik-red-1))))
   `(whitespace-newline ((t (:foreground ,rustik-bg+1))))
   `(whitespace-trailing ((t (:background ,rustik-red))))
   `(whitespace-line ((t (:background ,rustik-bg :foreground ,rustik-magenta))))
   `(whitespace-space-before-tab ((t (:background ,rustik-orange :foreground ,rustik-orange))))
   `(whitespace-indentation ((t (:background ,rustik-yellow :foreground ,rustik-red))))
   `(whitespace-empty ((t (:background ,rustik-yellow))))
   `(whitespace-space-after-tab ((t (:background ,rustik-yellow :foreground ,rustik-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,rustik-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,rustik-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,rustik-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,rustik-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,rustik-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,rustik-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,rustik-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,rustik-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,rustik-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,rustik-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,rustik-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,rustik-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,rustik-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,rustik-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,rustik-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,rustik-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,rustik-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,rustik-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,rustik-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,rustik-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,rustik-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,rustik-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,rustik-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,rustik-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,rustik-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,rustik-green+4))))
;;;;; xcscope
   `(cscope-file-face ((t (:foreground ,rustik-yellow :weight bold))))
   `(cscope-function-face ((t (:foreground ,rustik-cyan :weight bold))))
   `(cscope-line-number-face ((t (:foreground ,rustik-red :weight bold))))
   `(cscope-mouse-face ((t (:foreground ,rustik-bg :background ,rustik-blue+1))))
   `(cscope-separator-face ((t (:foreground ,rustik-red :weight bold
                                            :underline t :overline t))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,rustik-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,rustik-bg-1 :foreground ,rustik-bg-1))))
   ))

;;; Theme Variables
(rustik-with-color-variables
  (custom-theme-set-variables
   'rustik
;;;;; ansi-color
   `(ansi-color-names-vector [,rustik-bg ,rustik-red ,rustik-green ,rustik-yellow
                                          ,rustik-blue ,rustik-magenta ,rustik-cyan ,rustik-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,rustik-bg-05)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,rustik-red ,rustik-orange ,rustik-yellow ,rustik-green ,rustik-green+4
                    ,rustik-cyan ,rustik-blue+1 ,rustik-magenta))
;;;;; pdf-tools
   `(pdf-view-midnight-colors '(,rustik-fg . ,rustik-bg-05))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,rustik-red-1)
       ( 40. . ,rustik-red)
       ( 60. . ,rustik-orange)
       ( 80. . ,rustik-yellow-2)
       (100. . ,rustik-yellow-1)
       (120. . ,rustik-yellow)
       (140. . ,rustik-green-1)
       (160. . ,rustik-green)
       (180. . ,rustik-green+1)
       (200. . ,rustik-green+2)
       (220. . ,rustik-green+3)
       (240. . ,rustik-green+4)
       (260. . ,rustik-cyan)
       (280. . ,rustik-blue-2)
       (300. . ,rustik-blue-1)
       (320. . ,rustik-blue)
       (340. . ,rustik-blue+1)
       (360. . ,rustik-magenta)))
   `(vc-annotate-very-old-color ,rustik-magenta)
   `(vc-annotate-background ,rustik-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar rustik-add-font-lock-keywords nil
  "Whether to add font-lock keywords for rustik color names.
In buffers visiting library `rustik-theme.el' the rustik
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar rustik-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after rustik activate)
;;   "Maybe also add font-lock keywords for rustik colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or rustik-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "rustik-theme.el")))
;;     (unless rustik-colors-font-lock-keywords
;;       (setq rustik-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car rustik-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc rustik-colors-alist))))))
;;     (font-lock-add-keywords nil rustik-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after rustik activate)
;;   "Also remove font-lock keywords for rustik colors."
;;   (font-lock-remove-keywords nil rustik-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'rustik)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; rustik-theme.el ends here
