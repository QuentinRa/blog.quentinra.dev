# Recursive functions

[Go back](..)

You will use everything you know about function,
but you will add a ``rec`` keyword right after
``let``.

```ocaml
let rec pow x power = 
  if (power = 1) then x else x * (pow x (power-1))
;;

pow 5 3
(* 125 *)
```

Notice the (power-1). ``-`` is a function. You can't
write ``string_of_int 5-1`` since for ocaml it's
like ``(string_of_int 5) - 1``. So we would
have here without parenthesis
``(pow x power) - 1`` and we would have looped forever :).

<div class="sr"></div>

**Terminal or nonterminal functions**

A function is called **terminal functions**
when the function will ends. A **nonterminal** function
may never end.

You usually write a nonterminal function when you are postponing
the calculations meaning that you are calculating the next term
before the current term (evaluating n+1 before n).

So a terminal function is when you are writing your code
to evaluate n before n+1.

The function above is **nonterminal**! To write
some terminal function, we will use **functions with
accumulators**.

<div class="sl"></div>

**functions with accumulators**

The main idea is that you will store in a local variable
the result.

```ocaml
let pow x power = 
  (* inner function *)
  let rec pow_acc x power acc = 
    (* if power = 0 then return the accumulator since 
    that's the end *)
    if (power = 0)
    then acc
    (* recursive call *)
    else pow_acc x (power-1) (x * acc) 
  (* we need to call the inner function to get a value *)
  in pow_acc x power 1 (* we start at one since power=0 means one
                          and we are returning acc so one if power =0 *)
;;

pow 5 3
```

Please remember this form of functions, you will 
use it quite a lot.

```ocaml
let my_function_name (* some arguments *) = 

  (* my recursive function *)
  let rec sub_function_name (* some arguments *) acc = 
    (* our code, returning acc if done otherwise
    make a recursive call changing acc*)

  (* call with default values *)
  in sub_function_name (* some values here *)
;;
```