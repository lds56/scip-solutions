(define nil '())

(define (reverse l)
  (define (reverse-iter l acc)
    (if (null? l)
        acc
        (reverse-iter (cdr l)
                      (cons (car l) acc))))
  (reverse-iter l nil))

(reverse (list 0 1 2 3 4))
