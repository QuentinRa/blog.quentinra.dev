# OCaml

<div class="row row-cols-md-2"><div>

[OCaml](https://ocaml.org/) is a functional language. It's part of the family of [Meta Language](https://en.wikipedia.org/wiki/ML_(programming_language)) (ML). It adds object-oriented features to Caml.

* [Documentation](https://ocaml.org/docs) <small>(⛪)</small>
* [Manual](https://v2.ocaml.org/manual/index.html) <small>(⛪)</small>
* [Online OCaml REPL](https://try.ocamlpro.com/) <small>(🚀)</small>
* [ocamlverse.net](http://ocamlverse.net/) <small>(🚀)</small>
</div><div>

To most common way to get started is to use the [opam](https://opam.ocaml.org/) package manager to install any version of OCaml we need.

```shell!
$ sudo apt-get install opam
$ opam init # once, ls -l ~/.opam/
$ opam update && opam upgrade  # update all
$ opam switch create 4.14.1    # install ocaml 4.14.1
$ opam switch 4.14.1           # select ocaml 4.14.1
$ opam install some_package    # see also: update, upgrade
```

➡️ Browse the list of [packages here](https://opam.ocaml.org/packages/).
</div></div>

<hr class="sep-both">

## OCaml as a functional language

<div class="row row-cols-md-2"><div>

#### Implicit types

Types are implicit and should not be made explicit.

#### Immutability

The concept of immutability means that we can't modify a variable, e.g., all variables are constants.

```ocaml
let x = 5
x = 6 (* ❌ NOT ALLOWED *)
let x = 6 (* Delete and create a new one *)
```

<br>

#### Higher-order function

Everything is a value, or said otherwise, every element is a [first-class citizen](https://en.wikipedia.org/wiki/First-class_citizen) in OCaml. For instance, we can pass a function as an argument to another function, called [Higher-order function](https://en.wikipedia.org/wiki/Higher-order_function).

```ocaml
(* ⚠️ "1+2" is read by ocaml as "1" "+" "2" *)
(* e.g. three arguments *)
let _ = Format.printf "%d@." 1+2   (* ❌ *)
let _ = Format.printf "%d@." (1+2) (* ✅ *)
```
</div><div>

#### Purity

Functions should not have any side effects. For instance, if I write a line and do not store the result in a variable, removing the line should not have any impact.

```ocaml
(* not stored in a variable: skipped by the compiler *)
Printf.printf "%s\n" "Hello, World"
```

🔥 Every printing function returning `Unit` is not pure.

#### Referential transparency

This concept is quite related to the concept of Purity. As functions are pure, it means that we can replace the function by its result without impacting the program.

```diff
let f x = x -1
-let y = f 5
(* After substitution, it becomes: *)
+let y = 4
```
</div></div>

<hr class="sep-both">

## Getting Started

<div class="row row-cols-md-2"><div>

#### OCaml REPL

OCaml Top-Level, a.k.a. REPL, is a console in which we write expression, and they are evaluated on the fly 🚀.

```shell!
$ ocaml
        OCaml version 4.14.1

# "Hello, World";;
- : string = "Hello, World"
# 
```

⚠️ Every expression must end with `;;` unlike in OCaml files.

➡️ There is no need to use printing utilities.
</div><div>

#### OCaml Programs

OCaml files have the extension `.ml` or `.mli` <small>(interface~=headers)</small>.

```ocaml
(* example filename: hello_world.ml *)
let _ = Format.printf "Hello, World!@."
```

```shell!
$ ocamlc hello_world.ml  # generate a.out
$ ./a.out
Hello, World!
```

⚠️ All of ocaml statements must start with a keyword such as `let`. Other statements are ignored <small>(unlike in the REPL where they are executed)</small>.

➡️ See also: [Batch compilation (ocamlc)](https://v2.ocaml.org/manual/comp.html). Common options: `-o`, `-c`, `-I`. A `.ml` object file is a `.cmo` while it's a `.cmi` for a `.mli`.
</div></div>

<hr class="sep-both">

## OCaml Basics

<div class="row row-cols-md-2"><div>

#### Declare a variable

Simple declarations:

```ocaml
let x = 5
let y = "test"
let x = y      (* cannot edit, only redeclare *)
```

You can declare multiple variables at once:

```ocaml
let x = 5 and y = "test"
(* create two variables *)
```

Local variables are only available in the scope of the declaration:

```ocaml
(* the last expression is the value of "res" *)
(* res = 750, x/y/z are undefined *)
let res =
	let x = 5 in
	let y = 10 in
	let z = 15 in
	x * y * z
```

⚠️ The name of the variable must start with a lowercase.

⚠️ You cannot use a variable that was not declared.

🔥 If a variable name equal to `_`, it's considered as a temporary variable and discarded by the compiler after evaluating it.

```ocaml
let _ = (* some expression with a side-effect *)
(* _ is not defined *)
```

<br>

#### Print some text in the terminal

It's common to use `@.` instead of `\n` as it flushes the buffer too.

```ocaml
(* all of them are roughly the same *)
let _ = Printf.printf "%s\n" "Hello, World"
let _ = Format.printf "%s\n" "Hello, World"
let _ = Format.printf "%s@." "Hello, World" (* 🚀 *)
```
</div><div>

#### Types

A few of the common types are:

```ocaml
let var = 5 + 0x29a       (* type = int *)
let var = 5.0 +. 5.       (* type = float *)
let var = true && false   (* type = bool *)
let var = '5'             (* type = char *)
let var = "5"             (* type = string *)
let var = ()              (* type = unit *)
```

#### Conversions

Functions to convert a variable of type `a` to `b` have the form `b_of_a`.

```ocaml
(* convert an int to a string *)
let var = string_of_int 5
```

#### Operators

Here is a list of most [operators](/programming-languages/_paradigm/stuff/operators.md).

```ocaml
(* arithmetic betwenn integers *)
let sum = 5 + 5           (* 10 *)
let subtraction = 5 - 5   (* 0 *)
let product = 5 * 5       (* 25 *)
                          (* see also: / and mod *) 

(* arithmetic betwenn floats *)
let sum = 5. +. 5.        (* 10. *)    
let pow = 5. ** 2.        (* 25. *)
                          (* see also: -. *. /. *)     

let equal = 5 = 5         (* true ⚠️ not "==" *)
let different = 5 <> 5    (* false ⚠️ not "!=" *)
let negation = not true   (* false ⚠️ not "!" *)
                          (* see also: >, >=, <, <= *)

let op = true || false    (* true ☠️ not "or" *)
let op = true && false    (* false *)

let str = "ab" ^ "c";     (* concatenation *)
```

⚠️ `!`, `!=` and `==` are reserved for addresses comparisons.
</div></div>

<hr class="sep-both">

## OCaml Functions

<div class="row row-cols-md-2"><div>

#### Declare a function

There are two keywords to declare functions: `fun` or `function`, while you may use neither of them.

```ocaml
(* f(x,y) = x * y *)
let f x y = x * y (* 🚀 *)
let f = fun x y -> x * y
let f = fun x -> fun y -> x * y
let f = function x -> function y -> x * y (* 😶 *)
```

You may notice it, in OCaml, functions are [curried](https://en.wikipedia.org/wiki/Currying) by default, which means that a function that appears to take multiple arguments is actually a series of functions that take one argument each.

Also, functions are only returning one value.

<br>

#### Call a function

The process to call a function is pretty straightforward:

```ocaml
let v1 = f 5 5        (* 25 *)
let v2 = f 5 (-1)     (* -5 *)
let v3 = f 5 (f 6 v2) (* -150 *)
```
</div><div>

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* do not use "unit"
* [Functions on string](https://ocaml.org/api/String.html) (String.equal, String.length, ex: `String.length "5"`, `"ab" ^ "c"`)
* Lists: `[]`, `@::[]`, `5::[]`
* `Stdlib.compare a b` (-1, 0, 1)
</div><div>

<details class="details-border">
<summary>ocamlfind</summary>

OCaml find to do a lot of things involving libraries. One usage could be to compile using `ocamlc` files that use external libraries.

```bash
# create a file "test"
# while compiling with debug information (-g)
# avg.ml and test.ml
# while linking external libraries: extlib and oUnit
#
# Read the documentation if you want to learn more about -package or -linkpkg, while -g/-o are options of ocamlc
ocamlfind ocamlc -o test -package extlib,oUnit -linkpkg -g avl.ml test.ml
```
</details>
</div></div>