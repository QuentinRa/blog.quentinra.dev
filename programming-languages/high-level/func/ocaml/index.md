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

🔥 xxxx

<br>

#### Print some text in the terminal

xxx

```
let
let
let
let
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

let op = true || false    (* true ⚠️ not "or" *)
let op = true && false    (* false *)

let str = "ab" ^ "c";     (* concatenation *)
```

⚠️ `!`, `!=` and `==` are reserved for addresses comparisons.

⚠️ `and` and `or` 
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* variable: `_*` is not saved by the compiler
* do not use "unit"
* [Functions on string](https://ocaml.org/api/String.html) (String.equal, String.length, ex: `String.length "5"`, `"ab" ^ "c"`)
* Lists: `[]`, `@::[]`, `5::[]`
* `Stdlib.compare a b`
</div><div>

</div></div>