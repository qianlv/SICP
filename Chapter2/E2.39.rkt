#lang sicp

; Exercise 2.18
; (define (reverse lst)
;   (define (iter items answer)
;     (if (null? items)
;       answer
;       (iter (cdr items)
;             (cons (car items)
;                   answer))))
;   (iter lst nil))

; Complete the following definitions of reverse
; (Exercise 2.18) in terms of fold-right and fold-left from
; Exercise 2.38:

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (reverse-1 sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(reverse-1 (list 1 4 9 16 25))

(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(reverse-2 (list 1 4 9 16 25))
