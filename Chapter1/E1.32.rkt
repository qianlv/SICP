#lang sicp

; a. Show that sum and product (Exercise 1.31) are both
; special cases of a still more general notion called accumulate
; that combines a collection of terms, using some general accumulation function:

; (accumulate combiner null-value term a next b)

; accumulate takes as arguments the same term and
; range specifications as sum and product, together with
; a combiner procedure (of two arguments) that specifies
; how the current term is to be combined with the
; accumulation of the preceding terms and a null-value
; that specifies what base value to use when the terms
; run out. Write accumulate and show how sum and
; product can both be defined as simple calls to accumulate.

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

; test sum
(define (inc n) (+ n 1))
(define (cube x) (* x x x))
; a^3 + (a+1)^3 + ... + (b-1)^3 + b^3
(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10) ; 3025

(define (product term a next b)
  (accumulate * 1.0 term a next b))

(define (square x) (* x x))

; test product
; pi / 4
(define (factorial n)
  (define (next x)
    (+ x 2))
  (define (term x)   
    (square (/ (+ x 1) x)))
  (define b (+ 3 (* 2 (- n 1))))
  (* (/ 2 (next b)) (product term 3 next b)))

; pi
(* 4 (factorial 10000))


; b. If your accumulate procedure generates a recursive
; process, write one that generates an iterative process.
; If it generates an iterative process, write one that gen-
; erates a recursive process.
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

; Testing
(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (sum-cubes-iter a b)
  (sum-iter cube a inc b))

(sum-cubes-iter 1 10) ; 3025

(define (product-iter term a next b)
  (accumulate-iter * 1.0 term a next b))

; pi / 4
(define (factorial-iter n)
  (define (next x)
    (+ x 2))
  (define (term x)   
    (square (/ (+ x 1) x)))
  (define b (+ 3 (* 2 (- n 1))))
  (* (/ 2 (next b)) (product-iter term 3 next b)))

; pi
(* 4 (factorial-iter 10000))