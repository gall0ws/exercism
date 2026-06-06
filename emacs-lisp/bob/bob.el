;;; bob.el --- Bob (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun questionp (phrase)
  (string-match-p "\\? *$" phrase))

(defun silencep (phrase)
  (string-match-p "^[ \t]*$" phrase))

(defun yellingp (phrase)
  (string-match-p "^[^a-z]*[A-Z][^a-z]*$" phrase))

(defun response-for (phrase)
  (let ((case-fold-search nil))
    (pcase phrase
      ((and (pred questionp) (pred yellingp))
       "Calm down, I know what I'm doing!")
      ((pred questionp)
       "Sure.")
      ((pred yellingp)
       "Whoa, chill out!")
      ((pred silencep)
       "Fine. Be that way!")
      (_ "Whatever."))))

(defun response-for-1 (phrase)
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
