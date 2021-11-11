#lang sicp

; eight puzzle

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                     new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())
(define (safe-position-pair? first second)
  (not (or (= (car first) (car second))
           (= (cadr first) (cadr second))
           (= (abs (- (car first) (car second)))
              (abs (- (cadr first) (cadr second)))))))

; (define (safe? positions)
;   (define (safe-iter? first rest)
;     (if (null? rest)
;       #t
;       (and (safe-position-pair? first (car rest))
;            (safe-iter? first (cdr rest)))))
;   (safe-iter? (car positions) (cdr positions)))

(define (safe? positions)
  (= 0 (accumulate + 0 
                   (map (lambda (y) 
                          (if (safe-position-pair? (car positions) y) 0 1))
                        (cdr positions)))))


(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

(queens 6)
(length (queens 8))
(length (queens 11))
