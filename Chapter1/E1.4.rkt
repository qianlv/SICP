; Observe that our model of evaluation allows
; for combinations whose operators are compound expres-
; sions. Use this observation to describe the behavior of the
; following procedure:
#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; b > 0  --> (+ a b)
; b <= 0 --> (- a b)

(a-plus-abs-b 1 1)
(a-plus-abs-b 1 -1)