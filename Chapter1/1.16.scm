(define (fast-expt-iter n tot exp2)
  (cond ((= n 0) tot)
        ((= (modulo n 2) 0) (fast-expt-iter (/ n 2)
                                            tot
                                            (* exp2 exp2)))
        (else (fast-expt-iter (truncate (/ n 2))
                              (* tot exp2)
                              (* exp2 exp2)))))

(define (fast-expt b n)
  (fast-expt-iter n 1 b))

(fast-expt 2 10)
