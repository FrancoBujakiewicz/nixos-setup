
 (in-package #:nyxt-user)

 (define-configuration input-buffer
  ((override-map
    (let ((map (make-keymap "override-map")))
      (define-key map "M-t" 'make-buffer-focus
                      "M-w" 'delete-current-buffer
                      "M-f" 'follow-hint
                      "M-d" 'duplicate-buffer
		      "M-b" 'set-url-from-bookmark)))))

