(define *op-table* (make-hash-table))

(define (put op type proc)
  (hash-table/put! *op-table* (list op type) proc))

(define (get op type)
    (hash-table/get *op-table* (list op type) #f))

;; eqs
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))


;; deriv
(define (deriv exp var)
  (cond ((number? exp) 0)
         ((variable? exp) 
           (if (same-variable? exp var) 
               1 
               0))
         (else ((get 'deriv (operator exp)) 
                (operands exp) 
                var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; package
(define (install-sum-deriv-package)

  (define (addend operands) (car operands))
  (define (augend operands) (cadr operands))

  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  (put 'deriv '+ deriv-sum)
  'done)

(define (install-mul-deriv-package)

  (define (multiplier operands) (car operands))
  (define (multiplicand operands) (cadr operands))

  (define (deriv-mul exp var)
    (make-sum
     (make-product
      (multiplier exp)
      (deriv (multiplicand exp) var))
     (make-product
      (deriv (multiplier exp) var)
      (multiplicand exp))))

  (put 'deriv '* deriv-mul)
  'done)

(install-sum-deriv-package)
(install-mul-deriv-package)

(deriv '(+ (* x 3) (* x x)) 'x)

