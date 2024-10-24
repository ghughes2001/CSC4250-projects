#lang racket

(define pi 3.1416)

(define (my_calc1 atm list)
  (cond
    [(or (not (positive? (length list))) (not (positive? (car list)))) #f]
    [(= atm 1) (* pi (car list) (cadr list))] ; Area of ellipse
    [(= atm 2) (* 4/3 pi (car list) (cadr list) (caddr list))] ; Volume of ellipsoid
    [else #f]))

(define (my_calc2 atm2 list2)
  (if (and (positive? (length list2)) (positive? (car list2)))
      (cond
        [(= atm2 1) (* pi (car list2) (cadr list2))] ; Area of ellipse
        [(= atm2 2) (* 4/3 pi (car list2) (cadr list2) (caddr list2))] ; Volume of ellipsoid
        [else #f]) ; For other values
      #f)) ; For non-positive values

(define (rem_second list)
  (if (< (length list) 2)
      '() ; Return empty list if there are less than 2 elements
      (cons (first list) (cddr list)))) ; Keep the first and skip the second

;membership.rkt
(define (membership atm a_list)
  (cond
       ((null? a_list) #f)
       ((eq? atm (car a_list)) #t)
       (else (membership atm (cdr a_list)))
 ))

(define (remove-duplicates lst)
  (if (null? lst)
      '()
      (cons (car lst) (remove-duplicates (filter (lambda (x) (not (eq? x (car lst)))) (cdr lst))))))

(define (my_common lst1 lst2)
  (define unique-lst1 (remove-duplicates lst1))
  (define unique-lst2 (remove-duplicates lst2))
  (filter (lambda (x) (membership x unique-lst2)) unique-lst1))

(define (my_delete atm lst)
  (cond
    [(null? lst) '()]
    [(list? (car lst)) 
     (cons (my_delete atm (car lst)) (my_delete atm (cdr lst)))]
    [(equal? (car lst) atm) (my_delete atm (cdr lst))]
    [else (cons (car lst) (my_delete atm (cdr lst)))]))


(my_calc1 1 '(1 2 3 4))
(my_calc2 2 '(1 2 3 4))

(my_calc1 1 '(4 7 8 4))
(my_calc2 2 '(4 7 8 4))

(my_calc1 3 '(1 2 3 4))
(my_calc2 3 '(1 2 3 4))


(rem_second '(2))
(rem_second '(1 2))
(rem_second '(1 2 3 5 5))

(my_common '(1 2 3) '(1 4 5))
(my_common '(2 2 3) '(8 4 5))

(my_delete 2 '(3 4 5 2 6 2))
(my_delete 1 '(3 4 5 6 2))