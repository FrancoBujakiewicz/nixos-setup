 
 (in-package #:nyxt)

 (setf (uiop:getenv "GTK_THEME") "Adwaita:dark")

 (define-configuration browser
  "Configuring my reddish theme."
  ((theme
   (apply
     #'make-instance
     'theme:theme
        :accent-color "#303030"
        :background-color- "#000000"
        :background-color "#000000"
        :background-color+ "#141414"
        :on-background-color "#F7FBFC"
        :primary-color- "#679BCF"
        :primary-color "#000000"
        :primary-color+ "#7FABD7"
        :on-primary-color "FFFFFF"
        :secondary-color- "#44475A"
        :secondary-color "#FFFFFF" 
        :secondary-color+ "#535A6E" 
        :on-secondary-color "#000000"
        :action-color "#6BE194"
        :action-color "#4FDB71"
        :action-color+ "#27BF4C" 
        :on-action-color "#FFFFFF"
        :success-color- "#86D58E" 
        :success-color "#8AEA92" 
        :success-color+ "#71FE7D" 
        :on-success-color "#ececeD"
        :highlight-color- "#EA43DD"
        :highlight-color "#F45DE8"
        :highlight-color+ "#FC83F2"
        :on-highlight-color "#FFFFFF"
        :warning-color- "#FCA904" 
        :warning-color "#FCBA04" 
        :warning-color+ "#FFD152" 
        :on-warning-color "#ECECED"
        :codeblock-color- "#3C5FAA" 
        :codeblock-color+ "#2D4880" 
        :on-codeblock-color "#F7FBFC"
     #-nyxt-4
     nil
     #+nyxt-4
     (list
      :codeblock-color "#600101")))))

(define-configuration :dark-mode
  "Dark-mode is a simple mode for simple HTML pages to color those in a darker palette.

I don't like the default gray-ish colors, though. Thus, I'm overriding
those to be a bit more laconia-like.

I'm not using this mode, though: I have nx-dark-reader."
  ((style
    (theme:themed-css (theme *browser*)
      `(*
        :background-color ,(if (theme:dark-p theme:theme)
                               theme:background
                               theme:on-background)
        "!important"
        :background-image none "!important"
        :color ,(if (theme:dark-p theme:theme)
                    theme:on-background
                    theme:background)
        "!important")
      `(a
        :background-color ,(if (theme:dark-p theme:theme)
                               theme:background
                               theme:on-background)
        "!important"
        :background-image none "!important"
        :color ,theme:primary "!important")))))

