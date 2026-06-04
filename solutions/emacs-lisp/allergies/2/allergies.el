;;; allergies.el --- Allergies Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defconst +allergy-scores+ '(("eggs"            . 1)
                             ("peanuts"         . 2)
                             ("shellfish"       . 4)
                             ("strawberries"    . 8)
                             ("tomatoes"        . 16)
                             ("chocolate"       . 32)
                             ("pollen"          . 64)
                             ("cats"            . 128)))

(defun allergen-list (score)
  (seq-filter (lambda (allergen)
                (allergic-to-p score allergen))
              (mapcar 'car +allergy-scores+)))

(defun allergic-to-p (score allergen)
  (not (zerop (logand
               score
               (or (cdr-safe (assoc-string allergen +allergy-scores+)) 0)))))

(provide 'allergies)
;;; allergies.el ends here
