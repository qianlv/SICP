#lang sicp

; Several of the numerical methods described in this chapter are
; instances of an extremely general computational strategy known
; as iterative improvement. Iterative improvement says that, to
; compute something, we start with an initial guess for the answer,
; test if the guess is good enough, and otherwise improve the guess
; and continue the process using the improved guess as the new guess.
; Write a procedure iterative-improve that takes two procedures
; as arguments: a method for telling whether a guess is good enough
; and a method for improving a guess. iterative-improve should return
; as its value a procedure that takes a guess as argument and keeps
; improving the guess until it is good enough. Rewrite the sqrt procedure
; of Section 1.1.7 and the fixed-point procedure of Section 1.3.3 in
; terms of iterative-improve.

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