#lang sicp

; original:
; (flatmap
;   (lambda (rest-of-queens)
;     (map (lambda (new-row)
;            (adjoin-position
;              new-row k rest-of-queens))
;          (enumerate-interval 1 board-size)))
;   (queen-cols (- k 1)))

; change:
; (flatmap
;   (lambda (new-row)
;     (map (lambda (rest-of-queens)
;            (adjoin-position new-row k rest-of-queens))
;          (queen-cols (- k 1))))
;   (enumerate-interval 1 board-size))


; original time is T
; change time is board-size * T, because (queens-cols (- k 1)) is in inner loop
