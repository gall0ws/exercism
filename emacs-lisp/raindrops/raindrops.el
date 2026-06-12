;;; raindrops.el --- Raindrops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun convert (n)
  (let ((str (concat (when (zerop (mod n 3)) "Pling")
                     (when (zerop (mod n 5)) "Plang")
                     (when (zerop (mod n 7)) "Plong"))))
    (if (string-empty-p str) (number-to-string n) str)))

(provide 'raindrops)
;;; raindrops.el ends here
