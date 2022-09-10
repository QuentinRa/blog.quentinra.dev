# OCaml

OCaml is a functional language, from the family of Meta Languages (".ml", along with SML or CAML). Unfortunately, OCaml is **impure**, as it allows side effects. It's strongly advised to read the course about **Functional programming** before starting, so you know about immutable, purity, and things like this. We are currently in [OCaml 4.14](https://github.com/ocaml/ocaml) <small>(OCaml 5.0 is in progress)</small>.

* [The official manual](https://ocaml.org/manual/index.html)
* [The official tutorials](https://ocaml.org/learn/tutorials/)

> If you are into functional programming, you should check out Haskell, as there are no side effects in it.

<hr class="sr">

## Introduction

Like a lot of languages such as Python or Java, you are able to write OCaml in a **console** (called REPL). Otherwise, you can also write a `file.ml` and compile it like you would in C. You can use

* `ocaml`: to open the top-level / REPL (OCaml)
* `ocamlc file.ml`: to compile a file in OCaml and create a `a.out` <small>(this is working like `gcc` in C)</small>.

There are some tutorials to [install OCaml on Windows/Linux/MacOS here](https://plugins.jetbrains.com/plugin/18531-ocaml/documentation/setup-wsl-windows). You can also use OCaml in your browser with [TryOCamlPro](https://try.ocamlpro.com/).

<hr class="sr">

## Functional languages

You must declare a variable with `let`. **You can't modify a variable, you will have to create a new one** (concept of **immutability** ✨).

```ocaml
let x = 5
x = 6 (* NOT POSSIBLE *)
let x = 6 (* delete the old x, create a new one *)
```

In functional languages, there should be no side effects. Hence, **if you are not storing something in a variable**, **the compiler won't evaluate this line**, something like "If you don't see you use it later, then it means that you don't need it" (concept of **purity** ✨). Variables starting by a `_` are not stored by the compiler, so you can use this print for impure functions such as print

```ocaml
Printf.printf "%s\n" "Hello, World" (* SKIPPED !!! *)

(* all of them are equivalent *)
let _ = Printf.printf "%s\n" "Hello, World"
let _ = Format.printf "%s\n" "Hello, World"
let _ = Format.printf "%s@." "Hello, World" (* mine *)

(* in OCaml, 1+2 = 3 parameters '1' '+' '2', so add parenthesis *)
let _ = Format.printf "%d@." (1+2)
(* same *)
let _ = Format.printf "%d@." (-1)
```

To be accurate, in OCaml **everything is a value**, so you can give `-` (minus) to a function, as for OCaml `-` is a function taking two integers and returning one integer. A function taking another function in argument is called a **higher-order function** ✨ (`fonction d'ordre supérieur`).

> **CONSOLE ONLY**
> * you need to add `;;` at the end of every expression
> * you do not need to use printf/store expressions in variables

<hr class="sl">

## Basic concepts

* [Types, operators and structures](basic/syntax.md)
* [Declaring a variable](basic/variables.md)
* [Functions](basic/functions.md)
* [Recursive functions](basic/rec.md)

You might challenge yourself with these exercises

* [MCQ](basic/mcq.md)
* [Write some code](basic/exercises.md)

<hr class="sr">

## Intermediary concepts

* [Composite types](interm/tuples.md)
* [Creating new types](interm/types.md)
* [Lists](interm/lists.md)
* [Pattern Matching](interm/match.md) 🚀
* [Exceptions](interm/exceptions.md)
* [Asserts](interm/asserts.md)

And here are some exercises

* MCQ (not yet)
* [Write some code](interm/exercises.md)

<hr class="sl">

## Advanced concepts

* [Interfaces](advanced/interfaces.md)
* [Modules](advanced/modules.md)
* [Functors](advanced/functors.md)

<hr class="sl">

## Data structures

We are testing different ways of storing big amounts of data, along with their efficiency.

* [Binary Search Trees](data/bst.md) (`ABR`)
* [AVL trees](data/avl.md)
* [Zippers](data/zippers.md)

<hr class="sr">

## Sources

**French course**

* [ENSIIE Teachings](https://www.ensiie.fr/)
* [Univ. Lille1 teachings](https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-1.pdf) (course 1 to 4, change the number in the URL)

**Exercises**

* [LearnOcaml (GitHub)](https://github.com/ocaml-sf/learn-ocaml) and [Online demo](https://ocaml-sf.org/learn-ocaml-public/)