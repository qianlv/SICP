#lang sicp

(define (square x) (* x x))

; Louis Reasoner tries to rewrite the first square-list procedure
; of Exercise 2.21 so that it evolves an iterative process:

; (define (square-list items)
;   (define (iter things answer)
;     (if (null? things)
;       answer
;       (iter (cdr things)
;             (cons (square (car things))
;                   answer))))
;   (iter items nil))

; Unfortunately, defining square-list this way produces the
; answer list in the reverse order of the one desired. Why?

; 这个 reverse  比较明显了, 看懂代码即可

; Louis then tries to fix his bug by interchanging the argu-
; ments to cons:

; (define (square-list items)
;   (define (iter things answer)
;     (if (null? things)
;       answer
;       (iter (cdr things)
;             (cons answer
;                   (square (car things))))))
;   (iter items nil))

; (square-list (list 1 2 3))
; (((() . 1) . 4) . 9)

; This doesn’t work either. Explain

; answer 不符合 list 的定义了,
