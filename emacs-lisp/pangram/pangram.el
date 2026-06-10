;;; pangram.el --- Pangram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun pangramp (phrase)
  (length= (seq-filter (lambda (c)
                         (and (<= ?A c) (<= c ?Z)))
                       (seq-uniq (upcase phrase)))
           (1+ (- ?Z ?A))))

(provide 'pangram)
;;; pangram.el ends here
