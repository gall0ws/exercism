;;; isogram.el --- isogram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun isogramp (phrase)
  (let ((str (replace-regexp-in-string "[^[:alpha:]]" "" (downcase phrase))))
    (eq (length str)
        (length (seq-uniq str)))))

(provide 'isogram)
;;; isogram.el ends here
