;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq display-line-numbers-type 'relative)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-save-hook 'magit-after-save-refresh-status t)
(setq doom-font (font-spec :family "Fira Code Retina" :size 13))
(setq doom-theme 'doom-one)

(map! (:map evil-window-map
        "c" nil
        :desc "Delete current window" "d" #'evil-window-delete
        "S" #'ace-swap-window
        "F" #'make-frame)
      (:map workspaces-map
        "TAB" #'+workspace/display))

(map! :leader
      "0" #'winum-select-window-0-or-10
      "1" #'winum-select-window-1
      "2" #'winum-select-window-2
      "3" #'winum-select-window-3
      "4" #'winum-select-window-4
      "5" #'winum-select-window-5
      "6" #'winum-select-window-6
      "7" #'winum-select-window-7
      "8" #'winum-select-window-8
      "9" #'winum-select-window-9
      "/" #'+default/search-project
      "`" nil
      "l" #'evil-switch-to-windows-last-buffer

      :desc "M-x"                   "SPC"    #'execute-extended-command

      (:prefix ("p" . "project")
        :desc "Find file in project"         "f" #'projectile-find-file
        "/" nil))

(map! (:localleader
        (:map (clojure-mode-map clojurescript-mode-map)
          (:prefix ("f" . "format")
            "b" #'cider-format-buffer
            "l" #'clojure-align)
          (:prefix ("e" . "eval")
            "b" #'cider-load-buffer))))

(use-package! company-quickhelp
  :hook (company-mode . company-quickhelp-mode))

(add-to-list 'after-make-frame-functions #'winum-mode)
(after! clojure-mode
  (define-clojure-indent
    (fact 1)
    (facts 1)
    (flow 1)))
