;;       ,-.       _,---._ __  / \
;;      /  )    .-'       `./ /   \
;;     (  (   ,'            `/    /|
;;      \  `-"             \'\   / |
;;       `.              ,  \ \ /  |
;;        /`.          ,'-`----Y   |
;;       (            ;        |   '
;;       |  ,-.    ,-' Plipus  |  /
;;       |  | (   |    config  | /
;;       )  |  \  `.___________|/
;;       `--'   `--'


(defpackage :plipus-lem-config
  (:use :cl :lem))

(in-package :plipus-lem-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     Dependencies                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.config/lem/src/project.lisp")
;; More to come latter


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        UI                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme "rose-pine-dawn")
(lem/line-numbers:toggle-line-numbers)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      Hooks                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Always show completion list
(add-hook *prompt-after-activate-hook*
          (lambda ()
            (call-command 'lem/prompt-window::prompt-completion nil)))

(add-hook *prompt-deactivate-hook*
          (lambda ()
            (lem/completion-mode:completion-end)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        Vi                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(lem-vi-mode:vi-mode)

;; Bindings::file
(define-keys lem-vi-mode:*normal-keymap* 
  ("Space f w" 'lem-core/commands/file::save-current-buffer)
  ("Space f q" 'lem-core/commands/window::delete-active-window))

;; Bindings::search
(define-keys lem-vi-mode:*normal-keymap* 
  ("Space s f" 'lem-core/commands/file::find-file-recursively)
  )

(define-key lem-vi-mode:*normal-keymap* "H" 'lem-vi-mode/binds::move-to-beginning-of-line)
(define-key lem-vi-mode:*visual-keymap* "H" 'lem-vi-mode/binds::move-to-beginning-of-line)
(define-key lem-vi-mode:*normal-keymap* "L" 'lem-vi-mode/binds::move-to-end-of-line)
(define-key lem-vi-mode:*visual-keymap* "L" 'lem-vi-mode/binds::move-to-end-of-line)

(define-key lem-vi-mode:*normal-keymap* "U" 'lem-vi-mode/binds::redo)

(define-key lem-vi-mode:*normal-keymap* "Space w v" 'lem-core/commands/window::split-active-window-horizontally)
(define-key lem-vi-mode:*normal-keymap* "Space w h" 'lem-core/commands/window::split-active-window-vertically)

(define-key lem-vi-mode:*normal-keymap* "M-j" 'lem-core/commands/multiple-cursors::add-cursors-to-next-line)
(define-key lem-vi-mode:*insert-keymap* "M-j" 'lem-core/commands/multiple-cursors::add-cursors-to-next-line)