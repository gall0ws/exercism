;;; bob.el --- Bob (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun response-for (phrase)
  (let ((case-fold-search nil))
    (cond
     ((string-match-p "^[^a-z]*[A-Z][^a-z]*[^\\?]$" phrase)
      "Whoa, chill out!")
     ((string-match-p "^[^a-z]*[A-Z][^a-z]*\\?$" phrase)
      "Calm down, I know what I'm doing!")
     ((string-match-p "\\? *$" phrase)
      "Sure.")
     ((string-match-p "^[ \t]*$" phrase)
      "Fine. Be that way!")
     (t "Whatever."))))

(provide 'bob)
;;; bob.el ends here
