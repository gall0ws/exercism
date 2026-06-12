;;; resistor-color-duo.el --- Resistor Color Duo (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defconst resistor-color--alist
  '(("black" . 0) ("brown" . 1) ("red" . 2) ("orange" . 3) ("yellow" . 4)
    ("green" . 5) ("blue" . 6) ("violet" . 7) ("grey" . 8) ("white" . 9)))

(defun value (colors)
  (+ (* 10 (assoc-default (car colors) resistor-color--alist))
     (assoc-default (cadr colors) resistor-color--alist)))

(provide 'resistor-color-duo)
;;; resistor-color-duo.el ends here
