 
 (in-package #:nyxt-user)

 (setf (uiop:getenv "GTK_THEME") "Adwaita:dark")

 (define-configuration browser
  "Configuring my reddish theme."
  ((theme
    (apply
     #'make-instance
     'theme:theme

      :accent-color "#505050"
      :background-color- "#000000"
      :background-color "#000000"
      :background-color+ "#141414"
      :on-background-color "#F7FBFC"
      :primary-color- "#FFFFFF"
      :primary-color "#C5C5C5"
      :primary-color+ "#7FABD7"
      :on-primary-color "000000"
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

   (list :font-family "JetBrainsMono Nerd Font")))))

 (define-configuration :dark-mode
  "Override pages theme"
  ((style
    (theme:themed-css (theme *browser*)
      `(html
        :background-color "#000000"
        :height 100%
        :margin 0)
      `(body
        :background-color "#000000"
        :height 100%
        :margin 0)))))

