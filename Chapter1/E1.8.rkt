#lang sicp
; Newton’s method for cube roots is based on
; the fact that if y is an approximation to the cube root of x,
; then a better approximation is given by the value
;         (x / y^2 + 2y) / 3
; Use this formula to implement a cube-root procedure analogous
; to the square-root procedure


(define (cube-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-iter (improve guess x) x)))

(define (improve guess x)
  (one-third (/ x (square guess)) (* guess 2)))

(define (one-third x y)
  (/ (+ x y) 3))

(define (square x) (* x x))

(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) 0.0001))

(define (cube-root x)
  (cube-iter 1.0 x))
