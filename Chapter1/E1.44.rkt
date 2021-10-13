#lang sicp

; The idea of smoothing a function is an im portant concept in
; signal processing. If f is a function and dx is some small number,
; then the smoothed version of f is the function whose value at a
; point x is the average of f (x − dx), f (x), and f (x+dx). Write
; a procedure smooth that takes as input a procedure that computes
; f and returns a procedure that computes the smoothed f . It is sometimes
; valuable to repeatedly smooth a function (that is, smooth the smoothed
; function, and so on) to obtain the n-fold smoothed function. Show how to
; generate the n-fold smoothed function of any given function using
; smooth and repeated from Exercise 1.43.

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f x)
                    (f (+ x dx))
                    (f (- x dx)))
                 3)))

(define (square x)
  ; (display x)
  ; (newline)
  (* x x))

; ((smooth square) 5)

(define (repeated f n)
  (cond ((<= n 0)
         (error "n must be greater than 0"))
        ((= n 1)
         (lambda (x) (f x)))
        (else
         (lambda (x) (f ((repeated f (dec n)) x))))))

(define (n-fold-smooth n)
  (repeated smooth n))

(((n-fold-smooth 2) square) 5)