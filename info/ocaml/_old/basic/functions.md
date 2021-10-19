# Functions

[Go back](..)

You will use the ``fun`` keyword. You may see the
`function` keyword but don't use it, since no one seems
to be able to tell how ``function`` is working.

```ocaml
fun x -> x
(* - : 'a -> 'a = <fun> *)
```

We created a function taking a parameter ``x`` and returning
a value (x so the parameter). For ocaml, ``x`` may be of any
type, and since the result is of the same type of ``x``
then the function is evaluated as

* taking an argument of type ``'a``
* returning an argument of type ``'a``
* giving us ``'a -> 'a``

```ocaml
let simple_function = fun x -> x ;;
(* val simple_function : 'a -> 'a = <fun> *)
simple_function 7 ;;
(* - : int = 7 *)
simple_function "a" ;;
(* - : string = "a" *)
```

<hr class="sr">

**Function with more than one parameter**

You can add some parameters like this

```ocaml
fun x y -> x
```

Guess the type. See the answer below.

<blockquote class="spoiler">
It's <code>'a -> 'b -> 'a</code>. The function is taking
two arguments (one a type a, one of type a) and returning
something of type b. The function is always returning one
value so everything aside the last value are the types of
the parameters.
</blockquote>

Note that a function of two (or n) parameters is a function
taking one parameter being a function of n-1 parameters.
So your function is a reduced form of

```ocaml
fun x -> fun y -> x
```

But for the sake of writing the least code, you can even
do that implicit declaration.

```ocaml
let simple_function x y = x
```

<hr class="sl">

**Explicit types**

You can explicitly write the type of your arguments

```ocaml
(* reduced form *)
let simple_function (x:float) (y:float) : float = x
(* real one *)
let simple_function = fun (x: float) -> fun (y: float) : float -> x ;;
(* alt form *)
let simple_function = fun (x: float) (y: float) : float -> x ;;
```

You usually don't give types since the paradigm
is asking for ``implicit types`` but that something you
must know since you will use it.

<hr class="sr">

**partial implementation**

I dunno how we call that, but let's says you make a function

```ocaml
let process (v:'a) (f:'a -> 'b) : 'b = f v ;;
```

You should know what this function does

* take a value of type a
* take a function, taking a value of type a and returning a value of type b
* and the function simply call the function ``f`` with `b`
* returning a value of type b

So in OCaml, we can create a partial implementation of
process like ``process-add`` were the function is `add+1`.

```ocaml
let process_add (v:'a) : 'b = process v (fun x -> x+1) ;;
```

and we call

```ocaml
process_add 5
```

You will do that a lot! So do remember this when writing
your code.

