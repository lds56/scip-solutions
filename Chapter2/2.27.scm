(define nil '())

(define (reverse l)
  (define (reverse-iter l acc)
    (if (null? l)
        acc
        (reverse-iter (cdr l)
                      (cons (car l) acc))))
  (reverse-iter l nil))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (deep-reverse items)
  (map (lambda (x)
         (if (pair? x)
             (reverse x)
             x))
       (reverse items)))

(define x
  (list (list 1 2) (list 3 4)))

(deep-reverse x)
