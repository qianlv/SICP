#lang sicp

; The procedure square-list takes a list of
; numbers as argument and returns a list of the squares of
; those numbers.

; (square-list (list 1 2 3 4))
; (1 4 9 16)

; Here are two different definitions of square-list. Com-
; plete both of them by filling in the missing expressions:

(define (square x) (* x x))

(define (square-list-iter items)
  (if (null? items)
    nil
    (cons (square (car items))
          (square-list-iter (cdr items)))))

(define (square-list-map items)
  (map square items))

(square-list-iter (list 1 2 3 4))
(square-list-map (list 1 2 3 4))
