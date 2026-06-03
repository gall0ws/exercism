;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun acronym (phrase)
  (mapconcat (lambda (str)
               (upcase
                (string-limit
                 (replace-regexp-in-string "[^[:alpha:]]" "" str)
                 1)))
             (string-split phrase "[ -]")))

(provide 'acronym)
;;; acronym.el ends here
