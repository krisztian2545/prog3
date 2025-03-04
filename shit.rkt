> (define pi 3.15)
> pi
3.15
> (define (foo a)
    (substring a 0 3)
    )
> (foo "asdrthdrfhbrg")
"asd"
> (define (foo a)
    (substring a 2 3)
    )
> (foo "srthdfg")
"t"
> (substring "daergdrf" 3 5)
"rg"
> (string-append "vas" "a" "lo")
"vasalo"
> (string-length "asdge arg")
9
> (string? "string?")
#t
> (string? 2054)
#f
> (sqrt 16)
4
> (sqrt -16)
0+4i
> (+ 1 2)
3
> (+ 1 2 3 4 5 6)

21
> (+ 1 2  3)

6
> (- 10 3 2 5 1)
-1
> (<= 6 7)
#t
> (number? "number")
#f
> (number? 6)
#t
> (= 6 7)
#f
> (equal? 2019 "asd")
#f
> (equal? 6 6 )
#t
> (= "nem" "megy")
. . =: contract violation
  expected: number?
  given: "nem"
  argument position: 1st
  other arguments...:
 > (if (> 5 1)
      "igen"
      "nem"
   )
"igen"
> (if 1 "egy" "nem")
"egy"
> (if 0 "egy" "nem")
"egy"
> (if -1 "egy" "nem")
"egy"
> (if "sad" "egy" "nem")
"egy"
> ifnel ha hamis akkor a masodik egyebkent az elso
> (if #f "igaz" "ha")
"ha"
> (define (reply s)
    (if (equal? "hello" (substring s 0 5) )
        "hi"
        "huh?")
    )
> (reply "hello world")
"hi"
> (reply "haello world")
"huh?"
> (reply "hullo world")
"huh?"
> (reply "asd")
. . substring: ending index is out of range
  ending index: 5
  starting index: 0
  valid range: [0, 3]
  string: "asd"
> (reply 8)
. . substring: contract violation
  expected: string?
  given: 8
  argument position: 1st
  other arguments...:
> (define (reply s)
  (if (string? s)
      (if (>= (string-length s) 5 )
          (if (equal? "hello" (substring s 0 5) )
        "hi"
        "huh?")
          "error2"
          )
      "error1" )
    )
> (reply 6)
"error1"
> (reply "asd")
"error2"
> (and 1 2 #f #t) visszaadja az elso hamis erteket ------------------------------------
#f
ha csak 1 is hamis akkor hamis egybkent az utolso?
> (or 1 2 #f #t) visszaadja az elso nem hamis erteket----------------------------------
1
> (or #f 1 2 #f #t)
1
> (and)
#t
> (or)
#f
> (define (reply s)
  (if (and (string? s)
           (>= (string-length s) 5 )
           (equal? "hello" (substring s 0 5)))
      "hi"
      "huh?")
)
> (reply "asd")
"huh?"
#|
(define (allPositive? a b c)
  (and (>= a 0)
           (>= b 0)
           (>= c 0))
	#t
	#f
  )

(define (hasNegative? a b c)
  (and (>= a 0)
           (>= b 0)
           (>= c 0))
	#f
	#t
  )
|#
(define (allPositive? a b c)
  (and (>= a 0)
           (>= b 0)
           (>= c 0))
  )

(define (hasNegative? a b c)
  (or (< a 0)
           (< b 0)
           (< c 0))
  )

((lambda (x) x) 42)
> 42
((lambda (x) (* x 2)) 42)
> 84
((lambda (x y) (+ x y) ) 42 21)
> 63
((lambda (x y) (/ (+ x y) 2) ) 42 21)
> 31 1/2

(define dbl (lambda (x) (* x 2) )
 )

(define quad (lambda (x) (dbl (dbl x) ) )
  )

(quad 3)
> 12
(define n 10)

(define small? (lambda (num) (<= num n)) )
(define sqr (lambda (n) (* n n)) )

(small? (sqr 3))
> #t
ctrl + \ = λ (lambda)

(require racket/trace)

(define myPow (λ (x y)
                (if (= 0 y)
                    1
                    (* x (myPow x (- y 1)))
                    )
                )
  )
(trace myPow)
(myPow 5 2)
>(myPow 5 2)
> (myPow 5 1)
> >(myPow 5 0)
< <1
< 5
<25
25
(require racket/trace)

(define myFact (λ (x)
                (if (= x 0)
                    1
                    (* x (myFact (- x 1)))
                    )
                )
  )
(trace myFact)
(myFact 5)
>(myFact 5)
> (myFact 4)
> >(myFact 3)
> > (myFact 2)
> > >(myFact 1)
> > > (myFact 0)
< < < 1
< < <1
< < 2
< <6
< 24
<120
120
(foo a b) a<=b ...?

(define (fib n)
  (if (<= n 2)
      1
      (+ (fib (- n 1)) (fib (- n 2)) )
      )
  )
> (fib 2)
1
> (fib 3)
2

(- 4 (+ 1 1))
      redex (reducible expression)
continuation: a redex utan miden
(- 4 [])

farok pozicio:
expr1 fp.-ban van expr2-vel, ha valahanyszor expr1 egy redex, akkor az o folytatasa azonos az expr2 folytatasaval.
c[(+ 1 1)] = c[(- 4 [])]
c[(- 4 [])] = c

c[(if (zero? 0) (+ 1 1) 3)] = c[(if #t (+ 1 1) 3)] = c[(+ 1 1)]

(define f
  (λ (n prod)
    (if (= 0 n)
        prod
        (f (- n 1) (* n prod))
        )
    )
  )

(let <binds> <body>)
binds: ( (v1 expr) (v2 expr) ...)

(let ((i 2) (j 3))
  (+ i j)
  )
= 5

(let* ((i 2) (j (+ i 2)))
	(+ i j)
	)

egy (let (...) ... ) kif. ugyanaz mint:
((lambda (p1 p2 ...) expr1 ...) v1 ... )

ird meg a masodfoku egyenlet megoldo fuggvenyet:
(quadtratic a b c)

odd?
even?
(named let)
letrec
(do binds (predicate value) body) ahol
binds = ([p1 i1 u1] [...] ...)

pair
car
cdr
list

(pair? 2)
(pair? (cons 1 2))
(pair? '(1 2))
(displayln " ---- ")
> (null? (cdr (list 1)))
#t
> (cons 1 2)
'(1 . 2)
> (cons 1 '())
'(1)
> (cons 1 2)
'(1 . 2)
> (cons 1 '())
'(1)
> (car '(1 2))
1
> (car (cons 1 2))
1
> (cdr '(1 2))
'(2)
> (cdr '(3))
'()
> null
'()
> (list? (cons 1 (cons 2 '())))
#t
> (list? (cons 1 2))
#f
> (list (list 1 2) (list 3 4))
'((1 2) (3 4))
> (list* 1 2)
'(1 . 2)
> (list* 1 2 (list 3 4))
'(1 2 3 4)
> (build-list 10 values)
'(0 1 2 3 4 5 6 7 8 9)
> (build-list 5 (lambda (x) (* x x)))
'(0 1 4 9 16)
> (length (list 1 2 5))
3
> (length '())
0
> (list-ref (list 2 5 8 4) 3)
4
> (list-ref (list 'a 's 'd) 2)
'd
> (list-ref (cons 1 2) 1)
. . list-ref: index reaches a non-pair
  index: 1
  in: '(1 . 2)
> (list-ref (cons 1 2) 0)
1
> (list-tail (list 1 4 7 5) 2)
'(7 5)
> (list-tail (list 1 4 7 5) 3)
'(5)
> (list-tail (list 1 4 7 5) 1)
'(4 7 5)
> (list-tail (list 1 4 7 5) 0)
'(1 4 7 5)
> (list-tail (cons 1 4) 0)
'(1 . 4)
> (list-tail (cons 1 4) 1)
4
> (list-tail (cons 1 2) 1)
2
> (list-tail (cons 1 2) 2)
. . list-tail: index reaches a non-pair
  index: 2
  in: '(1 . 2)
  > (list-tail 'not-a-pair 0)
'not-a-pair
> (append (list 1 2) (list 3 4))
'(1 2 3 4)
> (reverse (list 1 2 3 4))
'(4 3 2 1)

(define (myrev l)
  (if (null? l)
      null
      (build-list (length l)
                  (lambda (x) (list-ref l (- (- (length l) x) 1)) )
                  )
      )
       )

(myrev (list 1 2 3))
(myrev null)
(myrev '(1 2))

(define (my-reverse lst)
  (let loop ((lst lst) (new-lst null))
    (cond
      [(null? lst) new-lst]
      [else (loop (cdr lst) (cons (car lst) new-lst) )]
      )
    )
  )
(my-reverse (list 1 2 3))
(my-reverse null)
(my-reverse '(1 2))

(define (myL lst) // hibas
  (define n 0)
  (define (ml l n)
    (cond
      [(null? l) n]
      [else (ml (cdr 1) (+ n 1))]
      )
    )
  (ml lst 0)
  )

(myL (list 1 2 3))

(map proc lst ...+) // lekepezes
> (map (λ (n) (+ n 1)) '(1 2 3 4))
'(2 3 4 5)
> (map (λ (a b) (+ a b)) '(1 2 3 4) '(10 20 30 40))
'(11 22 33 44)
(andmap proc list ...+)
(andmap f (list x y z)) = (and (f x) (f y) (f z))
(andmap positive? '(2 4 6) )
#t
(ormap proc lst ...+)
-||-
> (ormap + '(1 2 3) '(4 5 6))
5
> (ormap positive? '(1 2 -4 3))
#t
(for-each proc lst ...+) ugyanaz mint map csak void tipusu
> (for-each (λ (n) (printf "para: ~a\n" n) ) '(1 2 3))
para: 1
para: 2
para: 3

(foldl proc init lst ...+)
> (foldl cons '() '(1 2 3 4))
'(4 3 2 1)
> (foldl (λ (a b r) (+ r (- a b))) 1 '(1 2 3 ) '(4 5 6 ))
-8
> (foldl (λ (a b r) (* r (- a b))) 1 '(1 2 3 ) '(4 5 6 ))
-27

(foldr -||-)
> (foldr cons '() '(1 2 3 4))
'(1 2 3 4)
> (foldr (λ (v l) (cons (+ v 1) l) ) '() '(1 2 3 4))
'(2 3 4 5)
(filter predicate lst)
> (filter positive? '(1 -2 3 5 -5 6))
'(1 3 5 6)
(remove value lst [proc])
> (remove 2 '(1 2 3 4 2 5))
'(1 3 4 2 5)
> (remove 2 '(1 2 3 4 2 5) =)
'(1 3 4 2 5)
> (remove 2 '(1 2 3 4 2 5) >)
'(2 3 4 2 5)
> (remove 2 '(1 2 3 4 2 5) <)
'(1 2 4 2 5)
> (remove '(2) (list '(1) '(2) '(3)))
'((1) (3))
(remove* v-list lst [proc])
> (remove*  '(2 2) '(1 2 3 4 2 5))
'(1 3 4 5)
> (remove*  '(2 2 1) '(1 2 3 4 2 5))
'(3 4 5)
> (remove*  '(2 1) '(1 2 3 4 2 5))
'(3 4 5)
-- (myremove val lst)
-- (myremove* val lst)

(sort lst less-than?)
> (sort '(1 6 2 5 3 4) <)
'(1 2 3 4 5 6)
> (sort '(1 2 3 4) >)
'(4 3 2 1)
>  (sort '("barack" "hus" "medve" "repulo" "asd") string<?)
'("asd" "barack" "hus" "medve" "repulo")
>  (sort '("barack" "hus" "medve" "repulo" "asd") string>?)
'("repulo" "medve" "hus" "barack" "asd")

(sort lst less-than? #:key extract-key #:cache-keys? cache-key?)
> (sort '(("barack") ("hus") ("medve") ("repulo") ("asd")) #:key car string>?)
'(("repulo") ("medve") ("hus") ("barack") ("asd"))
(lambda (x y) (less-than? (extract-key x) (extract-key y) ) )
Kereses listaban: (member v list) equal? predikatumot haszn.
(member v list is-equal?)
> (member 2 (list 1 3 5 4 2))
'(2)
> (member 2 (list 1 3 5 4))
#f
> (member #'x (list #'x #'y))
#f
(memv v lst) az eqv? predikatummal has. ossze az elemeket
(memq v lst) az eq? predikatummal has. ossze az elemeket
> (member #'x (list #'x #'y) free-identifier=?)
'(.#<syntax:interactions from an unsaved editor:32:22 x> .#<syntax:interactions from an unsaved editor:32:26 y>)

(memf proc lst) ahol eloszor igaz a proc, onnantol adja vissza az elemeket
> (memf (λ (arg) (> arg 9) ) '(1 6 42 12 3))
'(42 12 3)
(findf -||-)
(assoc v lst) ahol v eloszor elofordult
(assoc v lst is-equal?)
> (assoc 3 (list (list 1 2) (list 3 4) (list 5 6) ))
'(3 4)
> (assoc 9 (list (list 1 2) (list 3 4) (list 5 6) ))
#f
> (assoc 9 (list (list 1 2) (list 3 4) (list 5 6) ) (λ (x y) (< (abs (- x y))) ) )
'(1 2)
(assv v lst) eqv? -t hasnal osszehas.-ra
(assq v lst) ez meg eq? -t
> (assv 3 (list (list 1 2) (list 3 4) (list 5 6) ))
'(3 4)

(assf proc lst)
> (assf (λ (x) (> x 2) ) (list (list 1 2) (list 4 5) (list 3 6)) )
'(4 5)

-------------------------------------------------------------------------------
# Hozzafero fuggvenyek roviditesei

> (car (car '( (1 2) 3 4)))
1
> (caar '((1 2) 3 4))
1
(car (cdr '((1 2) 3 4)))
3
(cadr '((1 2) 3 4))
3
(cdr (car '((1 2) 3 4)))
(cdar )
(cdr (cdr '((1 2) 3 4)))
(cddr )
(caaaar '( (((2 1 3) 5 5) 6) 7))
2
(cadadr '( (((2 1 3) 5 5) 6) (7 5)))
5
(require racket/list)
empty
> (cons? '(1 2))
#t
> (pair? '(1 2))
#t
> (empty? '(1 2))
#f
> (empty? '())
#t
> (first '(1 2 3 4)) // car szinonimaja
1
> (rest '(4 5 3 2 5)) // cdr szinonimaja
'(5 3 2 5)
(second '(4 5 3 2 5))
(tenth )
(last )
(define (myLast lst)
  (first (reverse lst))
  )

(sub1 x)
> (last-pair '(1 2 3 4))
'(4)
(make-list k v) k*v elem
> (make-list 5 6)
'(6 6 6 6 6)
> (make-list 5 'asd)
'(asd asd asd asd asd)
(list-update lst pos updater)
= (updater (list-ref lst pos))
> (list-update '(zero one two) 1 symbol->string)
'(zero "one" two)
(list-set lst pos value)
> (list-set '(zero one two) 1 "symbol->string")
'(zero "symbol->string" two)
(index-of lst v)
(index-of lst v is-equal?)
> (index-of '(1 2 3 4) 3)
2
> (index-of '(1 2 3 4) 3 <)
0
(index-where lst proc)
> (index-where '(1 2 3 4) even?)
1
(indexes-of lst v)
> (indexes-of '(4 5 3 2 5) 5)
'(1 4)
(indexes-where lst proc)
> (indexes-where '(1 2 3 4) even?)
'(1 3)
(take lst pos)
> (take '(1 2 3) 1)
'(1)
> (take '(5 3 7 6 5 8) 4)
'(5 3 7 6)
> (take 'non-list 1)
. . take: contract violation
  expected: a (possibly improper) list with at least 1 pairs
  given: 'non-list
(drop lst pos)
> (drop '(5 3 7 6 5 8) 4)
'(5 8)
(split-at lst proc)
> (split-at '(5 3 7 6 5 8) 4)
'(5 3 7 6)
'(5 8)
(values (take) (drop))

(takef lst pred)
> (takef '(2 4 6 7 8) even?)
'(2 4 6)
> (takef '(2 4 . 6) even?)
'(2 4)

(dropf lst pred)

> (dropf '(2 4 6 7 8) even?)
'(7 8)
> (dropf '(2 4 . 6) even?)
6

(splitf-at lst pred) = (values (takef lst pred) (dropf lst pred))
> (splitf-at '(5 3 7 6 5 8) odd?)
'(5 3 7)
'(6 5 8)

(take-right lst pos)
> (take-right '(5 3 7 6 5 8) 4)
'(7 6 5 8)

(drop-right lst pos)
> (drop-right '(5 3 7 6 5 8) 4)
'(5 3)

(split-at-right lts pos)
> (split-at-right '(5 3 7 6 5 8) 4)
'(5 3)
'(7 6 5 8)

(takef-right lst pred)
> (takef-right '(5 3 7 6 5 8) odd?)
'()
> (takef-right '(5 4 3 7 6 5 6 8) even?)
'(6 8)

(dropf-right lst pred)
> (dropf-right '(5 4 3 7 6 5 6 8) even?)
'(5 4 3 7 6 5)
> (dropf-right '(5 4 3 7 6 5 6 8) odd?)
'(5 4 3 7 6 5 6 8)

> (string->list "abcde")
'(#\a #\b #\c #\d #\e)
> (list->string '(#\a #\b #\c #\d #\f))
"abcdf"

(define ht (make-hash))
> ht
'#hash()
(hash-set! ht "alma" '(red round))
> (hash-set! ht "banan" '(yellow long))
> (hash-ref ht "alma")
'(red round)
> (hash-ref ht "almaa" "not there")
"not there"


and / or - ask yourself: what do I need to break it?

(define (my-append l1 l2)
  (build-list (+ (length l1) (length l2))
              (lambda (x)
                (if (< x (length l1))
                    (list-ref l1 x)
                    (list-ref l2 (- x (length l1)))
                    )
                )
              )
  )

  (define (temp l1 l2)
    (cond
        [(<= 1 (length l1)) (cons (first l1) (temp (cdr l1) l2))]
        [(< 1 (length l2)) (cons (first l2) (temp l1 (cdr l2)))]
        [else (cons (first l2) null)]
        )
    )

  (define (test)
    (for ([i (range 0 10 1)])
      (print i)
      )
    )
; elso zh
; 1)
  (define (elso n)
    (let fib ((a 0) (b 1))
      (if (> b n)
          (cons a null)
          (cons a (fib b (+ a b)) )
          )
      )
    )
; 2)
(filter even? '(1 2 3 4 5 6 7))
; 3)
(define (fib2)
  (let loop ((l (filter even? (elso 4000000))))
    (if (null? l)
        0
        (+ (car l) (loop (cdr l)))
        )
    )
  )
; ugyanaz for ciklussal
(define (fib21)
  (let ((osszeg 0) (l (filter even? (elso 4000000))))
    (for ([i l])
      (set! osszeg (+ osszeg i))
      )
    osszeg
    )
  )
; 5)
(define (osszege l)
  (let ((osszeg 0))
    (for ([i l])
      (set! osszeg (+ osszeg i))
      )
    osszeg
    )
  )

(define (fv n)
  (-
   (sqr (osszege (range (add1 n))))
   (osszege (build-list n (lambda (x) (sqr (add1 x))) ))
   )
  )
; 6)
(define (moncsok? l)
  (if (= 2 (length l))
      (> (first l) (second l))
      (if (> (first l) (second l))
          (moncsok? (cdr l))
          #f
          )
      )

  )
; 2. zh
; 2)
(define (osszege l)
  (if (empty? l)
      0
      (+ (car l) (osszege (cdr l)))
      )
  )

(define (ladak lszam kapacitas l)
  (let ((ls (osszege l)))
    (if (> ls (* lszam kapacitas))
      (print "Nincs elegendő láda.")
      (if (= 0 (remainder ls kapacitas))
          (quotient ls kapacitas)
          (add1 (quotient ls kapacitas))
          )
      )
    )
  )
; 4)
(define (collatz n)
  (let loop ([x n])
    (if (> x 1)
      (if (even? x)
          (cons x (loop (/ x 2)))
          (cons x (loop (add1 (* x 3))))
          )
      (cons x null)
      )
    )
  )

(define (legnagyobb l)
  (define legn 0)
  (map (lambda (x) (set! legn (max legn x))) l)
  legn
  )

(define (legn-coll n)
  (legnagyobb (collatz n))
  )
; 3)
(define (mod-collatz n)
  (let loop ([x n])

    (if (> x 1)
      (if (even? x)
          (cons x (loop (/ x 2)))
          (if (= 0 (remainder x 3))
              (cons x (loop (/ x 3)))
              (cons x (loop (add1 (* x 3))))
              )
          )
      (cons x null)
      )
    )
  )

(define (mod-coll-len n)
  (length (mod-collatz n))
  )
