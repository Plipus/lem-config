(defpackage :plipus-lem-config
  (:use :cl :lem))

(in-package :plipus-lem-config)

(load "~/.config/lem/src/project.lisp")

(load-theme "rose-pine-dawn")

(add-hook *prompt-after-activate-hook*
          (lambda ()
            (call-command 'lem/prompt-window::prompt-completion nil)))

(add-hook *prompt-deactivate-hook*
          (lambda ()
            (lem/completion-mode:completion-end)))


