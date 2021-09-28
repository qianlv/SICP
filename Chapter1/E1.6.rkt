#lang sicp
; Alyssa P. Hacker doesn’t see why if needs to
; be provided as a special form. “Why can’t I just define it as
; an ordinary procedure in terms of cond?” she asks. Alyssa’s
; friend Eva Lu Ator claims this can indeed be done, and she
; defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
       (else else-clause)))

; Alyssa uses new-if to rewrite the square-root
; program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

; What happens when Alyssa aempts to use this to compute
; square roots? Explain.
; Answer:
; 将无限递归，然后爆栈退出, 因为解释器是 applicative-order, 对于 new-if
; 将先计算各个参数值，所以无论 good-enough? 的测试结果如何，都回调用 sqrt-iter

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
