(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (rdiv n base)
  (if (= (remainder n base) 0)
      (rdiv (/ n base) base)
      n))

(define (car x)
  (/ (log (rdiv x 3))
     (log 2)))

(define (cdr x)
  (/ (log (rdiv x 2))
     (log 3)))

(car (cons 1 2))
(cdr (cons 1 2))
