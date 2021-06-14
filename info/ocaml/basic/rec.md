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

Notice the (power-1). ``-`` is a function . You can't
write ``string_of_int 5-1`` since for ocaml it's
like ``(string_of_int 5) - 1``. So we would
have here without parenthesis
``(pow x power) - 1`` and we would have looped forever :).

<div class="sr"></div>

**Terminal or not**

A function is called **terminal functions**
when the function will ends. A **nonterminal** function
may never end.

You usually write a nonterminal function when you are postponing
the calculations meaning that you are calculating the next term
before the current term (evaluating n+1 before n).

So a terminal function is when you are writing you code
in order to evaluate n before n+1.

The function above is **nonterminal**! In order to write
some terminal function, we will use **functions with
accumulators**.