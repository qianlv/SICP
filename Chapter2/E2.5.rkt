#lang sicp
; Show that we can represent pairs of nonnegative integers using only numbers
; and arithmetic operations if we represent the pair a and b as the integer
; that is the product 2^a3^b. Give the corresponding definitions of the procedures
; cons, car, and cdr.

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car z)
  (if (= (remainder z 2) 1)
      (+ (car (/ z 2)) 1)
      0))

(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ (cdr (/ z 3)) 1)
      0))

(car (cons 3 4))
(cdr (cons 3 5))