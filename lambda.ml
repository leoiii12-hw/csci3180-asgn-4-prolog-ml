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
(\<lambda>c.c (\<lambda>a.\<lambda>b.b)) ((\<lambda>a.\<lambda>b.\<lambda>f.f a b) p q)
    = (\<lambda>a.\<lambda>b.\<lambda>f.f a b) p q (\<lambda>a.\<lambda>b.b)            (\<beta>)
    = (\<lambda>b.\<lambda>f.f p b) q (\<lambda>a.\<lambda>b.b)                 (\<beta>)
    = (\<lambda>f.f p q) (\<lambda>a.\<lambda>b.b)                      (\<beta>)
    = (\<lambda>a.\<lambda>b.b) p q                             (\<beta>)
    = (\<lambda>b.b) q                                  (\<beta>)
    = q                                         (\<delta>)

***************************************************
1b
(\<lambda>c.c (\<lambda>a.\<lambda>b.b)) ((\<lambda>a.\<lambda>b.\<lambda>f.f a b) p q)
    = (\<lambda>c.c (\<lambda>a.\<lambda>b.b)) ((\<lambda>b.\<lambda>f.f p b) q)        (\<beta>)
    = (\<lambda>c.c (\<lambda>a.\<lambda>b.b)) (\<lambda>f.f p q)               (\<beta>)
    = (\<lambda>a.\<lambda>b.b) (\<lambda>f.f p q)                      (\<beta>)
    = (\<lambda>a.\<lambda>b.b) p q                             (\<beta>)
    = (\<lambda>b.b) q                                  (\<beta>)
    = q                                         (\<delta>)

***************************************************
2a
(\<lambda>x.\<lambda>y. (mul x ((\<lambda>x. (add x 3)) y))) 7 8
    = (\<lambda>x.\<lambda>y. (mul x ((\<lambda>z. (add z 3)) y))) 7 8  (\<alpha>)
    = (\<lambda>y. (mul 7 ((\<lambda>z. (add z 3)) y))) 8       (\<beta>)
    = (mul 7 ((\<lambda>z. (add z 3))8))                (\<beta>)
    = mul 7 (add 8 3)                           (\<beta>)
    = 77                                        (\<delta>)

***************************************************
2b
(\<lambda>x.\<lambda>y. (mul x ((\<lambda>x. (add x 3)) y))) 7 8
    = (\<lambda>x.\<lambda>y. (mul x ((\<lambda>z. (add z 3)) y))) 7 8  (\<alpha>)
    = (\<lambda>x.\<lambda>y. (mul x (add y 3))) 7 8            (\<beta>)
    = (\<lambda>y. (mul 7 (add y 3)))                   (\<beta>)
    = mul 7 (add 8 3)                           (\<beta>)
    = 77                                        (\<delta>)
 *)

(* 2c *)
fun mul(x : int, y : int) = x * y
fun add(x : int, y : int) = x + y
fun f x y = mul(x, add(y, 3))

(* 

***************************************************
3a
k
    = eval_normal(f1 m)
    = eval_normal((lambda x.(add x 1)) m)
    = eval_normal((lambda x.(add x 1)) 1)
    
(lambda x.(add x 1)) 1
    = (add 1 1)
    = 2

∴ k = 2

printf(k) should print the following without a new line.
2

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