(define nil '())

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate
                       (cdr sequence))))
        (else  (filter predicate
                       (cdr sequence)))))
  
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (range n)
  (define (iter k acc)
    (if (= k 0) acc
        (iter (- k 1) (cons k acc))))
  (iter n nil)
)

(define (range-dec n)
  (if (= n 0) nil
      (cons n (range-dec (- n 1)))))

(range 5)

(range-dec 5)

(define (unique-pairs n)
  (flatmap (lambda (i)
             (filter (lambda (x) (not (null? x)))
                     (map (lambda (j)
                            (if (not (= i j))
                                (list i j)
                                nil))
                          (range n))))
             (range n)))

(unique-pairs 5)
