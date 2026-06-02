;;; accumulate.el --- Accumulate (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun accumulate (lst op)
  ;; (mapcar op lst))
  (let ((res nil))
    (while lst
      (push (funcall op (pop lst)) res))
    (nreverse res)))

(provide 'accumulate)
;;; accumulate.el ends here
