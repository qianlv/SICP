#lang sicp

; a. The sum procedure is only the simplest of a vast number
; of similar abstractions that can be captured as higher-order
; procedures. Write an analogous procedure called
; product that returns the product of the values of a
; function at points over a given range. Show how to define
; factorial in terms of product. Also use product to compute
; approximations to π using the formula

; pi / 4 = (2 * 4 * 4 * 6 * 6 * 8 ...) / (3 * 3 * 5 * 5 * 7 * 7 ...)

; b. If your product procedure generates a recursive process,
; write one that generates an iterative process. If it generates
; an iterative process, write one that generates a recursive process.

(define (product-rec term a next b)
  (if (> a b)
      1.0
      (* (term a)
         (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1.0))

(define (square x) (* x x))

; pi / 4
(define (factorial n)
  (define (next x)
    (+ x 2))
  (define (term x)
    (square (/ (+ x 1) x)))
  (define b (+ 3 (* 2 (- n 1))))
  ; (* (/ 2 (next b)) (product-rec term 3 next b)))
  (* (/ 2 (next b)) (product-iter term 3 next b)))

; pi
(* 4 (factorial 10000))
