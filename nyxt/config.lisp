;; Main file where are loaded all configurations for Nyxt browser

  (in-package #:nyxt)

   (define-nyxt-user-system-and-load nyxt-user/basic-config
     :components ("style" "keybindings")) ;; Adding wanted modules there

