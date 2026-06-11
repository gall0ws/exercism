;;; proverb.el --- Proverb (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun recite (strings)
  (if (null strings) nil
    (let ((str (car strings)) (lst nil))
      (while (and strings (cdr strings))
        (push (format "For want of a %s the %s was lost."
                      (car strings) (cadr strings)) lst)
        (pop strings))
      (nreverse (push (format "And all for the want of a %s." str) lst)))))

(provide 'proverb)
;;; proverb.el ends here

