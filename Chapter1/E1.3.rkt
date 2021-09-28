; Define a procedure that takes three numbers
; as arguments and returns the sum of the squares of the two
; larger numbers.
#lang sicp

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (max-sum-of-squares x y z)
  (cond ((>= x y)
         (cond ((>= y z) (sum-of-squares x y))
               (else (sum-of-squares x z))))
        (else
         (cond ((>= x z) (sum-of-squares x y))
               (else (sum-of-squares y z))))))

(max-sum-of-squares 1 2 3)
(max-sum-of-squares 2 1 3)
(max-sum-of-squares 3 1 2)
(max-sum-of-squares 3 2 1)