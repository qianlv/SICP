#lang sicp

; d. Suppose we change the representation of mobiles so that the constructors are

(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
  (cons length structure))

; How much do you need to change your programs to convert to the new
; representation?

; 这里我们只有正确修改 selectors 即可
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

; 其他函数不改变
(define (total-weight mobile)
  (if (not (pair? mobile))
    mobile
    (+ (total-weight (branch-structure (left-branch mobile)))
       (total-weight (branch-structure (right-branch mobile))))))

(define x (make-mobile (make-branch 1 2) (make-branch 3 4)))
(define y (make-mobile (make-branch 1 x) (make-branch 4 5)))
(define z (make-mobile (make-branch 3 y) (make-branch 4 x)))
(total-weight x)
(total-weight y)
(total-weight z)

(define (weight-length-branch branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (if (not (pair? mobile))
    #t
    (let ((left (left-branch mobile))
          (right (right-branch mobile)))
      (if (= (weight-length-branch left)
             (weight-length-branch right))
        (and (balanced? (branch-structure left))
             (balanced? (branch-structure right)))
        #f))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3))) 
(total-weight a) 

(define d (make-mobile (make-branch 10 a) (make-branch 12 5))) 
(balanced? d) 

 (define m1 (make-mobile 
              (make-branch 4 6) 
              (make-branch 5 
                           (make-mobile 
                             (make-branch 3 7) 
                             (make-branch 9 8))))) 
(balanced? m1)
(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                            (make-branch 5 8) 
                            (make-branch 10 4)))))
(balanced? m2)
