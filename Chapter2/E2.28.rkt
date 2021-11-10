#lang sicp

; Write a procedure fringe that takes as argument a tree (represented as a list)
; and returns a list whose elements are all the leaves of the tree arranged in
; leto-to-right order. For example,

(define x (list (list 1 2) (list 3 4)))
; (fringe x)
; (1 2 3 4)
; (fringe (list x x))
; (1 2 3 4 1 2 3 4)

(define (fringe lst)
  (cond ((null? lst)
         nil)
        ((pair? (car lst))
         (append (fringe (car lst))
                 (fringe (cdr lst))))
        (else (cons (car lst) (fringe (cdr lst))))))
(fringe x)
(fringe (list x x))
(list (list x x) (list x x))
(fringe (list (list x x) (list x x)))
