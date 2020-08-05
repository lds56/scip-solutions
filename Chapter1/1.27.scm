(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


(define (femat-fool n)
  (define (iter cnt status)
    (cond ((= cnt 0) status)
          ((not status) #f)
          (else (iter (- cnt 1)
                      (and status
                           (= (expmod cnt n n) cnt))))))
  (and (not (prime? n)) (iter (- n 1) #t)))

(femat-fool 561)
(femat-fool 1105)
(femat-fool 6601)
