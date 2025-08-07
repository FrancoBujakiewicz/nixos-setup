
  (in-package #:nyxt-user)

   (define-nyxt-user-system-and-load nyxt-user/basic-config :components ("style" "keybindings"))

   (define-configuration hint-mode
    ((hinting-type :vi)))

