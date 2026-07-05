(defpackage :plipus-lem-config/src/project
  (:use :lem :cl)
  (:export :project-discover-git))

(in-package :plipus-lem-config/src/project)

(defvar *ignored-directories*
  (list
    "node_modules"
    "target"
    "build"
    ".gradle"
    ".mvn"
    ".vscode"
    ".idea")
  "A list of directories to ignore while looking for git projects.")

(defun directory-name (pathname) (car (last (pathname-directory pathname))))

(defun list-subdirectory-names (pathname)
  "List subdirectory names as string for the given path."
  (mapcar #'directory-name (uiop:subdirectories pathname)))

(defun git-repository-p (pathname)
  "Check if given pathname is root of a git repository."
  (when (member ".git" (list-subdirectory-names pathname) :test #'string=) t))

(defun list-git-repositories (pathname)
  "Search for all git projects under pathname.
  Return a list of pathname."
  (labels ((helper (pathnames results)
                   (let ((head (first pathnames))
                         (tail (rest pathnames)))
                     (cond 
                       ((null head) results)
                       ((member (directory-name head) *ignored-directories* :test #'string=) (helper tail results))
                       ((git-repository-p head) (helper tail (cons head results)))
                       (t (helper (append (uiop:subdirectories head) tail) results))))))

    (helper (list pathname) (list))))

(define-command project-discorver-git() ()
                "Search for git repositories under given pathname and add them as projects"
                (loop for directory in (list-git-repositories (prompt-for-directory "Discover projects under: " :directory (buffer-directory)))
                      do (lem-core/commands/project::remember-project directory)))
