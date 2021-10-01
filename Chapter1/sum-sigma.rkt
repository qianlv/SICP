#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (inc n) (+ n 1))
(define (cube x) (* x x x))
; a^3 + (a+1)^3 + ... + (b-1)^3 + b^3
(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10) ; 3025

(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))

; a + (a+1) + ... + b
(sum-integers 1 10) ; 50

; pi / 8 = 1 / (1 * 3) + 1 / (5 * 7) + 1 / (9 + 11) + ...
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000)) ; 3.139592655589783

; integral of a function f between the limits a and b
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01) ; 0.24998750000000042
(integral cube 0 1 0.001) ; 0.249999875000001