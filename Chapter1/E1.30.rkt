#lang sicp

; The sum procedure above generates a linear recursion.
; The procedure can be rewritten so that the sum is
; performed iteratively. Show how to do this by filling in
; the missing expressions in the following definition:

; (define (sum term a next b)
;   (define (iter a result)
;     (if ⟨??⟩
;         ⟨??⟩
;         (iter ⟨??⟩ ⟨??⟩)))
;   (iter ⟨??⟩ ⟨??⟩))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

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