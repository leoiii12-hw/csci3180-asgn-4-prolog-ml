(* 

/*
 * CSCI3180 Principles of Programming Languages
 *
 * --- Declaration ---
 *
 * I declare that the assignment here submitted is original except for source
 * material explicitly acknowledged. I also acknowledge that I am aware of
 * University policy and regulations on honesty in academic work, and of the
 * disciplinary guidelines and procedures applicable to breaches of such policy
 * and regulations, as contained in the website
 * http://www.cuhk.edu.hk/policy/academichonesty/
 *
 * Assignment 4
 * Name : Choi Man Kin
 * Student ID : 1155077469
 * Email Addr : mkchoi6@cse.cuhk.edu.hk
 */

 *)

(* 

***************************************************
1a
(λc.c (λa.λb.b)) ((λa.λb.λf.f a b) p q)
    = (λa.λb.λf.f a b) p q (λa.λb.b)            (β)
    = (λb.λf.f p b) q (λa.λb.b)                 (β)
    = (λf.f p q) (λa.λb.b)                      (β)
    = (λa.λb.b) p q                             (β)
    = (λb.b) q                                  (β)
    = q                                         (δ)

***************************************************
1b
(λc.c (λa.λb.b)) ((λa.λb.λf.f a b) p q)
    = (λc.c (λa.λb.b)) ((λb.λf.f p b) q)        (β)
    = (λc.c (λa.λb.b)) (λf.f p q)               (β)
    = (λa.λb.b) (λf.f p q)                      (β)
    = (λa.λb.b) p q                             (β)
    = (λb.b) q                                  (β)
    = q                                         (δ)

***************************************************
2a
(λx.λy. (mul x ((λx. (add x 3)) y))) 7 8
    = (λx.λy. (mul x ((λz. (add z 3)) y))) 7 8  (\<alpha>)
    = (λy. (mul 7 ((λz. (add z 3)) y))) 8       (β)
    = (mul 7 ((λz. (add z 3))8))                (β)
    = mul 7 (add 8 3)                           (β)
    = 77                                        (δ)

***************************************************
2b
(λx.λy. (mul x ((λx. (add x 3)) y))) 7 8
    = (λx.λy. (mul x ((λz. (add z 3)) y))) 7 8  (\<alpha>)
    = (λx.λy. (mul x (add y 3))) 7 8            (β)
    = (λy. (mul 7 (add y 3)))                   (β)
    = mul 7 (add 8 3)                           (β)
    = 77                                        (δ)
 *)

(* 2c *)
fun mul(x : int, y : int) = x * y
fun add(x : int, y : int) = x + y
fun f x y = mul(x, add(y, 3))

(* 

***************************************************
3a

1.
k
    = eval_normal(f1 m)
    = eval_normal((lambda x.(add x 1)) m)
    = eval_normal((lambda x.(add x 1)) 1)
    
(lambda x.(add x 1)) 1
    = (add 1 1)
    = 2

∴ k = 2

printf(k) => 2

2.
(lambda g.g 5)(lambda x.(x + 3))
    = (lambda x.(x + 3)) 5
    = 5 + 3
    = 8

∴ m = 8

printf(m) => 8

3.
After swap(k, m), k and m should be exchanged.

printf(k) => 8

4.
pi (u, v) {w = u + 1; u = v + 1; v = w} (k, m) is doing the same thing as swap(k + 1, m + 1).
i = 0, k = 8 m = 2
i = 1, k = 3 m = 9
i = 2, k = 10 m = 4
i = 3, k = 5 m = 11

printf(k, m) => 511

Total.
288511

***************************************************
3b
k = eval_normal(f1 m); printf(k); is the same.
Based on two facts,
1. reduction strategy does not affect the final result
2. (f1 m) will be automatically performed reduction, when it is assigned to a int type variable

After the reduction and assignment, k is just a int value.
Therefore, it will not affect the later lines of code.

All printfs should have the same output.

***************************************************
3c
Assume Lapi needs declaration in order to use variables, because I see "int m = 1, n = 1, k".

t is global static variable.
t can be accessed, but it is not defined in the current program. t will be captured in the procedure.
Therefore, it should have been defined in either lambda.h or pi.h, and t must be exposed as a global variable.

x is a local stack-dynamic variable.
x is bounded in the function. x is created and destroyed in the stack, when swap is called.

***************************************************
3d
If we use dynamic scoping,
we cannot perform type check until the execution. It is easier to have bugs.
we cannot achieve purity. This is not ideal to functional programming. It will affect which reduction strategies the language to use.

*)