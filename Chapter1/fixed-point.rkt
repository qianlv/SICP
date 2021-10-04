#lang sicp

; A number x is called a fixed point of a function f if x satisfies
; the equation f (x) = x. 
; For some functions f we can locate a fixed point by
; beginning with an initial guess and applying f repeatedly,

;   f(x), f(f(x)), f(f(f(x))), ...

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; cos(x) = x
(fixed-point cos 1.0) ; 0.7390822985224024

; y = sin(y) + cos(y)
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0) ; 1.2587315962971173

; fixed-point to finding square root
; y^2 = x, to get y
; change to y = x / y (x is a knowed number)
; so this is x a fixed-point of a function f = x / y

; Unfortunately, this fixed-point search does not converge.
; dead loop, repeat y1, y2:
; 1. y1
; 2. y2 = x / y1
; 3. y3 = x / y2 = x / x / y1 = y1
(define (sqrt-not-converge x)
  (fixed-point (lambda (y) (/ x y))
               1.0))
; (sqrt-not-converge 4)

; so change to fixed-point y = (1/2)(y + x/y)
; PS: y = x/y -> y + y = y + x/y -> 2y = y + x/y -> y = (1/2)(y + x/y)

(define (average a b) (/ (+ a b) 2))
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
(sqrt 4)
(sqrt 900000000000000000000000000000000000000)