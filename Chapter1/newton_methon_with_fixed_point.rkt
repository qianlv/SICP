#lang sicp
; 参考 https://teshenglin.github.io/post/2019_fixed_point/ 理解不动点法

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

(define dx 0.00001)
; Dg(x) = (g(x + dx) - g(x)) / dx
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx))
                    (g x))
                 dx)))

(define (cube x) (* x x x))
((deriv cube) 5)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (square x) (* x x))
(define (sqrt x)
  (newtons-method
   (lambda (y) (- (square y) x)) 1.0))

(sqrt 2.0)