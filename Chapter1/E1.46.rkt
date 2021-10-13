#lang sicp

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
    (let ((next (improve-guess guess)))
      (if (good-enough? guess next)
          next
          ((iterative-improve good-enough? improve-guess) next)))))

(define tolerance 0.0000001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  ((iterative-improve close-enough? f) first-guess))

(define (average a b) (/ (+ a b) 2))
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
(sqrt 4)

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (cond ((<= n 0)
         (error "n must be greater than 0"))
        ((= n 1)
         (lambda (x) (f x)))
        (else
         (lambda (x) (f ((repeated f (dec n)) x))))))

(define (n-root x n)
  (fixed-point
   ((repeated average-damp (dec n))
    (lambda (y) (/ x (expt y (dec n)))))
  1.0))

(n-root 2321321 5)