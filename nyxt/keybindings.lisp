 
 (in-package #:nyxt-user)

 (define-configuration input-buffer
  ((override-map
    (let ((map (make-keymap "override-map")))
      (define-key map "M-t" 'make-buffer-focus 
                      "M-w" 'delete-current-buffer
                      "M-1" 'switch-buffer-previous
                      "M-2" 'switch-buffer-next
                      "M-f" 'follow-hint
                      "M-backspace" 'history-backwards
                      "M-keypadanter" 'history-forwards))))) ;; Enter = keypadanter

