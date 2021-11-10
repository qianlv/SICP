#lang sicp

; Modify your reverse procedure of Exercise
; 2.18 to produce a deep-reverse procedure that takes a list
; as argument and returns as its value the list with its ele-
; ments reversed and with all sublists deep-reversed as well.
; For example,

(define x (list (list 1 2) (list 3 4)))
x
; ((1 2) (3 4))
; (reverse x)
; ((3 4) (1 2))
; (deep-reverse x)
; ((4 3) (2 1))

(define (reverse lst)
  (define (iter items answer)
    (if (null? items)
      answer
      (iter (cdr items)
            (cons (car items)
                  answer))))
  (iter lst nil))

(define (deep-reverse lst)
  (define (iter items answer)
    (cond 
      ((null? items) answer)
      ((pair? (car items))
       (iter (cdr items)
             (cons (iter (car items) nil)
                   answer)))
      (else (iter (cdr items)
                  (cons (car items)
                        answer)))))
  (iter lst nil))
(reverse x)
(deep-reverse x)
(deep-reverse (list (list 1 2) 3 (list 4 5 6) 7 (list 8 9 10)))
(reverse (list (list 1 2) 3 (list 4 5 6) 7 (list 8 9 10)))
(deep-reverse (list (list 1 2) (list 3 4) (list 5 6)))
(reverse (list (list 1 2) (list 3 4) (list 5 6)))
