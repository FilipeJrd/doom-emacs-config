;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-theme 'doom-peacock)

(map! (:map evil-window-map
        "c" nil
        :desc "Delete current window" "d" #'evil-window-delete
        "S" #'ace-swap-window)
      (:map workspaces-map
        "TAB" #'+workspace/display))
(map! :leader
      "`" nil
      "l" #'evil-switch-to-windows-last-buffer)

(map! (:localleader
        (:map (clojure-mode-map clojurescript-mode-map)
          (:prefix ("f" . "format")
            "b" #'cider-format-buffer
            "l" #'clojure-align)
          (:prefix ("e" . "eval")
            "b" #'cider-load-buffer))))
