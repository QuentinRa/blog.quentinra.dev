# Functions

You can also add the types. Here

* you should notice that we used `*`
* `*` is only working for integers
* so both `x` and `y` are integers
* and the return type is `int`

```ocaml
let f (x: int) (y: int) : int = x * y
let f = fun (x: int) (y: int) : int -> x * y
let f = fun (x: int) -> fun (y: int) : int -> x * y
```

<hr class="sl">

## Guessing the type of a function

First, you should remember by now that a function is **only returning one result** (and ...). It means that the last value is the return type. We are adding `->` before the return type, and the type of each argument, separated by `->`.

```ocaml
(* f(int, int) = int ??? *)
int -> int -> int

(* f(int, string) -> float ??? *)
int -> string -> float

(* f(a, string) -> a ??? *)
'a -> string -> 'a

(* f(a, b) -> a ??? *)
'a -> 'b -> 'a

(* f(g, x) = g x *)
g : 'a -> 'b
f : ('a -> 'b) -> 'b
```

Given some code, how could you guess the type?

* look for type-specific operators (+, -, &&, +., not, ...)
* inside a `if`, you know that the first parameter is a bool, while the two others (then/else) got the same type
* do not forget parenthesis, around the type of a function
* if you can't find a type, then use `'a`, `'b`, etc.

<hr class="sr">

## Partial functions

Let's say you declared a function like this, taking two values and one operator.

```ocaml
let do_operation op a b = op a b
(* 'a -> 'b -> ('a -> 'b -> 'c) -> 'c *)
```

You could partially define a function "plus" that will call `do_operation`

```ocaml
(* we only defined the first parameter: op *)
let do_plus = do_operation (+)
(* int -> int -> int *)

let _ = do_operation (+) 5 3 (* 8 *)
let _ = do_plus 5 3 (* 8 *)
```