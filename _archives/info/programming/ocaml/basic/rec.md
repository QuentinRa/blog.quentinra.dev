# Recursive functions

[Go back](../index.md#basic-concepts)

A recursive function is a function calling itself. In OCaml, you **have to add rec** before the name of your function.

```ocaml
let pow x power = 
	if power = 1
	then x
	else x * (pow x (power-1))

let _ = pow 5 3 (* 125 *)
```

> If you forget the keyword `rec`, then the compiler will tell you `Unbound value pow`.

<hr class="sl">

## Terminal or nonterminal functions

You usually write a **nonterminal** function when you are postponing the calculations meaning that you are calculating the next term before the current term (evaluating n+1 before n).

A **terminal** function is when you are writing your code to evaluate n before n+1.

The function above is **nonterminal**! To write some terminal functions, we will use the concept of **functions of an accumulator**.

<hr class="sr">

## Functions of an accumulator

A function of an accumulator is called `fonction accumulatrice` in French. The main idea is that you will store in a variable the result, update the parameters and call the recursive function with a new accumulator, and the updated parameters.

```ocaml
let pow x power =
	let rec pow_acc power acc = 
		(* some code *)
	in pow_acc power 1 (* x^0 = 1 *)
```

Before completing this function, notice that we are using "let ... in", so the result of `let pow x power` is the evaluation of `pow_acc power 1`. **This is something you need to master, as you will use this often**!

```ocaml
let pow x power =
	let rec pow_acc power acc = 
		if power <= 0
		then acc (* done, return result *)
		else let new_acc = x * acc
			 in let new_power = power - 1
			 in pow_acc new_power new_acc
			 (* <=> pow_acc (power-1) (x * acc) *)
	in pow_acc power 1 (* x^0 = 1 *)

let _ = pow 5 3 (* 125 *)
```

> **Pro tip**: we are talking about Functions of accumulators, if you got more than one accumulator.