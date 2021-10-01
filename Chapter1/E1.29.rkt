#lang sicp

; Simpson’s Rule is a more accurate method of numerical
; integration than the method illustrated above.
; Using Simpson’s Rule, the integral of a function f between
; a and b is approximated as

; (h / 3) * (y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2y_(n-2) + 4y_(n-1) + y_n)

; where h = (b − a)/n, for some even integer n, and yk =
; f(a + kh). (Increasing n increases the accuracy of the
; approximation.) Define a procedure that takes as arguments
; f , a, b, and n and returns the value of the integral,
; computed using Simpson’s Rule. Use your procedure to
; integrate cube between 0 and 1 (with n = 100 and n = 1000),
; and compare the results to those of the integral procedure
; shown above.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson-rule-integral f a b n)
  (define h (/ (- b a) n))
  (define (inc k)
    (+ k 1))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (cond
      ((= k 0) (y k))
      ((= k n) (y k))
      ((even? k) (* 2 (y k)))
      (else (* 4 (y k)))))
  (* (/ h 3) (sum term 0 inc n)))

(simpson-rule-integral cube 0 1 100) 
(simpson-rule-integral cube 0 1 10000) 
    