;;; resistor-color.el --- Resistor Color (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defconst resistor-color--alist
  '(("black" . 0) ("brown" . 1) ("red" . 2) ("orange" . 3) ("yellow" . 4)
    ("green" . 5) ("blue" . 6) ("violet" . 7) ("grey" . 8) ("white" . 9)))

(defun color-code (color)
  (cdr (assoc color resistor-color--alist)))

(defun colors ()
  (mapcar 'car resistor-color--alist))

(provide 'resistor-color)
;;; resistor-color.el ends here
