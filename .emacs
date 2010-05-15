(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(scroll-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;;(require 'cuda-mode)
 (autoload 'cuda-mode "cuda-mode" "Major mode for editing Cuda code." t)
(setq auto-mode-alist (append
                 '(("\\.cu$" . c++-mode))
                   auto-mode-alist))
(require 'quack)
;;(require 'emms-setup)
;;(emms-devel)
;;(emms-default-players)
;;(require 'emms-player-mpd)
;;(setq emms-player-mpd-server-name "localhost")
;;(setq emms-player-mpd-server-port "6600")
;;(add-to-list 'emms-info-functions 'emms-info-mpd)
;;(add-to-list 'emms-player-list 'emms-player-mpd)
;;(setq emms-player-mpd-music-directory "~/music")
;;(setq emms-source-file-default-directory "~/music")
;;(emms-player-mpd-connect)
(require 'w3m-load)
 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)
(add-to-list 'exec-path "/usr/bin")
(if (= emacs-major-version 23)
	(require 'w3m-ems)
  (require 'w3m))
;(require 'garak)
;(setq elim-executable "/usr/bin/elim-client")
;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "gregmanis@gmail.com") 
(setq elmo-imap4-default-authenticate-type 'clear) 
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t) 

;; SMTP
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "gregmanis")
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")
(setq wl-envelope-from "gregmanis@gmail.com")
(setq wl-from "gregmanis@gmail.com")
(setq wl-message-id-domain "gmail.com")
(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
(setq wl-trash-folder "%[Gmail]/Trash")

(setq wl-folder-check-async t) 

(setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))
(add-to-list 'load-path "/usr/share/emacs/site-lisp/erc/")
(require 'erc)
(require 'tex-site)
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)