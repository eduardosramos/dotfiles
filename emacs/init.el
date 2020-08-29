;; Remover boas-vindas
(setq inhibit-startup-message t)

;; Remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remover barra de rolagem
(scroll-bar-mode -1)

;; Numeros nas linhas
(global-linum-mode t)

;; Tamanho da fonte
(set-face-attribute  'default nil :height 120)

;; Gerenciamento de pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilitar inicio de ativacao

;; Melpa - repositório

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize) ; iniciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t); C-x C-e executa código Lisp e baixa o pacote.

(use-package which-key
  :ensure t
  :config (which-key-mode)) ; Achando o comando certo para qqr coisa no emacs
(which-key-setup-side-window-right)

; Melpa Stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(which-key try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )






