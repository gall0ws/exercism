;;; dnd-character.el --- D&amp;D Character (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun roll-d6 (count)
  "Roll a D6 COUNT times."
  (cl-loop repeat count collecting (1+ (random 6))))

(defun hitpoints (constitution)
  "Calculate hitpoints from CONSTITUTION."
  (+ 10 (modifier constitution)))

(defun modifier (score)
  (floor (- score 10) 2))

(defun ability ()
  (apply '+ (cdr (sort (roll-d6 4)))))

(defun generate-dnd-character ()
  (let ((constitution (ability)))
    (record 'dnd-character
            (ability)   ; strength
            (ability)   ; dexterity
            constitution
            (ability)   ; intelligence
            (ability)   ; wisdom
            (ability)   ; charisma
            (hitpoints constitution))))

(provide 'dnd-character)
;;; dnd-character.el ends here
