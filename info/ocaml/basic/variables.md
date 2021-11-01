# Variables

[Go back](../index.md#basic-concepts)

In OCaml, variables are only declared using `let`. You got variants allowing you to declare multiple variables, or allowing you to declare nested variables (called local variables).

Note

* a variable with a name starting with `_` is not saved by the compiler
* you must give a value to a variable
* the name starts by a lowercase (otherwise `Unbound constructor`)
* if you are using a non-declared variable `Unbound value xxxxx`

<hr class="sl">

## Simple declarations

```ocaml
let x = 5
let y = "test"
let x = y
```

<hr class="sl">

## Multiples declarations

```ocaml
let x = 5 and y = "test"
```

<hr class="sl">

## Local Variables

Local variables are only available in the scope of the declaration.

```ocaml
let x =
	let y = "test"
(* x = "test", y not defined *)
```

> In OCaml, everything is a value. `let y = "test"` is evaluated as `"test"`.

**What's the use?**

You got a keyword that you will use almost every time: `in`. We are using it to chain expressions. The last one is the one that will be evaluated.

```ocaml
let res =
	let x = 5 in
	let y = 10 in
	let z = 15 in
	x * y * z
(* res = 5 * 10 * 15 *)
```

**You will use this almost every time**, mostly with functions or with complex calculations.

```ocaml
let x =
	let y = 1.0 /. 5.0
	in (y *. y) +. 2.0 *. y
(* x = some value, y = not defined *)
```