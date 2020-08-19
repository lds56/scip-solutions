(define (iterative-improve is-guess-good? improve-guess)
  (lambda (guess)
    (if (is-guess-good? guess)
        guess
        ((iterative-improve is-guess-good? imrpove-guess)
         (improve-guess guess)))))
