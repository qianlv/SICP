#lang sicp

; In case representing pairs as procedures wasn’t mind-boggling enough,
; consider that, in a language that can manipulate procedures, we can get
; by without numbers (at least insofar as nonnegative integers are concerned)
; by implementing 0 and the operation of adding 1 as
; 如有疑惑，参考: https://sicp.readthedocs.io/en/latest/chp2/6.html 的更加详细的展开

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
; This representation is known as Church numerals, after its
; inventor, Alonzo Church, the logician who invented the λ-calculus.

; Define one and two directly (not in terms of zero and add-1).
; (Hint: Use substitution to evaluate (add-1 zero)). Give
; a direct definition of the addition procedure + (not in terms
; of repeated application of add-1).

; substitution 
(add-1 zero)
; to
(lambda (f) (lambda (x) (f ((lambda (x) x)) x)))
(lambda (f) (lambda (x) (f x)))
; so
(define one
  (lambda (f) (lambda (x) (f x))))

; same substitution
(add-1 one)
; to
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
(lambda (f) (lambda (x) (f (f x))))
; so
(define two
  (lambda (f) (lambda (x) (f (f x)))))

; 观察对于任意整数的定义应用了调用多少次 f
; 对于整数 n -> (lambda (f) (lambda (x) (f (f ... (f x)...))))
; 同时观察 add-1, 推断 addition procedure +
(define (+ n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))

(+ one two)
(lambda (f) (lambda (x) (lambda (x) (f x) (lambda (x) (f (f x)) x))))
(lambda (f) (lambda (x) (lambda (x) (f x) (f (f x)))))
; 带入 x = (f (f x)) -> (lambda (f) (lambda (x) (lambda (f (f x)) (f (f (f x))))))
(lambda (f) (lambda (x) (f (f (f x)))))
; 调用3此f, 满足前面的定义