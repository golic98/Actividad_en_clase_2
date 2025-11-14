#lang racket
;;=============================
;; Fundamentos de Racket
;;=============================

;; ============================
;; PARTE A – Comprensión básica
;; ============================

;; 1. Asociaciones simples
(define a 5)
(define b (+ a 3))
(define c (* b 2))
(displayln (string-append "a=" (number->string a) ", b=" (number->string b) ", c=" (number->string c)))
;; Si luego haces (define a 10), b no cambia porque ya fue evaluado con el valor anterior.

;; 2. Sustitución simbólica
(define x 4)
(define (doble n) (* 2 n))
(define (suma3 m) (+ m 3))
(displayln (suma3 (doble x))) ; => 11, porque (doble 4)=8, (suma3 8)=11

;; 3. Definiciones equivalentes
(define (cuadrado1 x) (* x x))
(define cuadrado2 (lambda (x) (* x x)))
(displayln (cuadrado1 5))
(displayln (cuadrado2 5))
;; Son equivalentes: la primera es azúcar sintáctico para la segunda.

;; ============================
;; PARTE B – Aplicación práctica
;; ============================

;; 4. Área de un rectángulo
(define base 10)
(define altura 5)
(define (area base altura) (* base altura))
(displayln (area base altura))

;; 5. Conversión de grados
(define (celsius->fahrenheit c) (+ (* (/ 9 5) c) 32))
(displayln (celsius->fahrenheit 25)) ; => 77

;; 6. Precio con impuesto
(define precio-base 100)
(define (iva monto) (* monto 0.13))
(define (precio-final p) (+ p (iva p)))
(displayln (precio-final precio-base)) ; => 113

;; 7. Descuento encadenado
(define (descuento10 p) (* p 0.9))
(define (iva13 p) (* p 1.13))
(define (precio-total p) (iva13 (descuento10 p)))
(displayln (precio-total 100)) ; => 101.7

;; ============================
;; PARTE C – Análisis
;; ============================

;; 8. En Racket no tiene sentido (set! x (+ x 1)) porque las variables son inmutables.

;; 9. Función como valor
(define sumar (lambda (a b) (+ a b)))
(define operar sumar)
(displayln (operar 4 5)) ; => 9
;; 'operar' es otra referencia a la misma función. Racket lo permite porque las funciones son valores.

;; 10. (define x 5) define una variable. (define (x) 5) define una función sin parámetros.

;; ============================
;; PARTE D – Desafío final
;; ============================
(define (calcular-total precio descuento impuesto)
  (let* ((descontado (* precio (- 1 descuento)))
         (con-impuesto (* descontado (+ 1 impuesto))))
    con-impuesto))
(displayln (calcular-total 100 0.1 0.13)) ; => 101.7


;; ============================
;; GUIA DE ESTUDIO
;; ============================


;; 1. Suma de elementos de una lista
(define (suma-lista lst) (foldl + 0 lst))
(displayln (suma-lista '(1 2 3 4 5))) ; => 15

;; 2. Filtrar mayores a n
(define (mayores-a lst n)
  (filter (lambda (x) (> x n)) lst))
(displayln (mayores-a '(5 3 8 1 10) 4)) ; => '(5 8 10)

;; 3. Producto de una lista
(define (producto lst)
  (foldl * 1 lst))
(displayln (producto '(2 3 4))) ; => 24

;; 4. Aplicar una función a todos los elementos
(define (duplicar x) (* 2 x))
(define (aplicar-funcion f lst) (map f lst))
(displayln (aplicar-funcion duplicar '(1 2 3 4))) ; => '(2 4 6 8)

;; 5. Cuadrado de números
(define (cuadrados lst)
  (map (lambda (x) (* x x)) lst))
(displayln (cuadrados '(1 2 3 4 5))) ; => '(1 4 9 16 25)

;; 6. Duplicar valores
(displayln (map (lambda (x) (* 2 x)) '(2 4 6))) ; => '(4 8 12)

;; 7. Seleccionar pares
(displayln (filter even? '(1 2 3 4 5 6))) ; => '(2 4 6)

;; 8. Promedio de una lista
(define (promedio lst)
  (/ (foldl + 0 lst) (length lst)))
(displayln (promedio '(4 6 8 10))) ; => 7.0

;; 9. Elevar a potencia n
(define (potencia-lista lst n)
  (map (lambda (x) (expt x n)) lst))
(displayln (potencia-lista '(2 3 4) 2)) ; => '(4 9 16)

;; 10. Contar elementos mayores a n
(define (contar-mayores lst n)
  (length (filter (lambda (x) (> x n)) lst)))
(displayln (contar-mayores '(5 7 2 9 1 10) 6)) ; => 3

;; 11. Aplicar una función dos veces
(define (aplicar-dos-veces f x)
  (f (f x)))
(displayln (aplicar-dos-veces sqrt 16)) ; => 2.0

;; 12. Mini reto integrador
(define (producto-mayores-5 lst)
  (foldl * 1 (filter (lambda (x) (> x 5)) lst)))
(displayln (producto-mayores-5 '(2 5 6 8 3 10))) ; => 480
