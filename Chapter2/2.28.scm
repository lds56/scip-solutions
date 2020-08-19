(define (fringe items)
  (define (flat-iter x acc)
    (cond ((null? x) acc)
          ((list? (car x))
           (flat-iter (cdr x)
                      (append acc (fringe (car x)))))
          (else
           (flat-iter (cdr x)
                      (append acc (list (car x)))))))
  (flat-iter items '()))

(define x
  (list (list 1 2) (list 3 4)))

(fringe x)
;; (fringe x)

(fringe (list x x))
