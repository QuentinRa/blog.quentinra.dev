# OCaml

OCaml is a functional language, from the family of Meta Languages (".ml", along with SML or CAML). Unfortunately, OCaml is **impure**, as it allows side effects. It's strongly advised to read the course about **Functional programming** before starting, so you know about immutable, purity, and things like this. We are currently in [OCaml 4.12](https://github.com/ocaml/ocaml).

* [The official manual](https://ocaml.org/manual/index.html)
* [The official tutorials](https://ocaml.org/learn/tutorials/)

> We are using a lot OCaml in my school because a lot of students learned it before, but it would be better to learn functional programming with a language like Haskell 🙄, as there are no side effects in it.

<hr class="sr">

## Introduction

Like a lot of languages such as Python or Java (👀), you are able to write OCaml in a **console** (REPL). Otherwise, you can also write a `file.ml` and compile it like you would in C. You can use

* `ocaml`: to open OCaml console
* `ocamlc file.ml`: to compile a OCaml file and create a `a.out` <small>(this is working like `gcc` in C)</small>.

As the installation is hard on Windows, I gathered tutorials here to [install OCaml on Windows](intro/install-win.md). On Linux, you should not have a problem. You can also use OCaml in your browser with [TryOCamlPro](https://try.ocamlpro.com/) <small>(**I trough this was a good solution, but it made me write poor code** because I was adding `;;` or parenthesis in a lot of unneeded places)</small>.

<hr class="sr">

## Functional languages

You must declare a variable with `let`. **You can't modify a variable, you will have to create a new one** (=**immutable** ✨).

```ocaml
let x = 5
x = 6 (* NOT POSSIBLE *)
let x = 6 (* delete the old x, create a new one *)
```

In functional language, there should be no side effect. Hence, **if you are not storing something in a variable**, **the compiler won't evaluate this line**, as you are not using the result of the function (=**purity** ✨). The variable starting by a `_` are not stored by the compiler, so you can print a value like this
printing

```ocaml
Printf.printf "%s\n" "Hello, World" (* SKIPPED !!! *)

(* all of them are equivalent *)
let _ = Printf.printf "%s\n" "Hello, World"
let _ = Format.printf "%s\n" "Hello, World"
let _ = Format.printf "%s@." "Hello, World" (* my teacher and mine *)

(* in OCaml, 1+2 = 3 parameters '1' '+' '2', so add parenthesis *)
let _ = Format.printf "%d@." (1+2)
(* same *)
let _ = Format.printf "%d@." (-1)
```

To be accurate, in OCaml **everything is a value**, so you can give `-` (minus) to a function, as for OCaml `-` is a function taking two integers and returning one integer. A function taking another function is argument is called **higher-order function** ✨ (`fonction d'ordre supérieur`).

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

...

<hr class="sl">

## Advanced concepts

* [Interfaces](advanced/interfaces.md)
* [Modules](advanced/modules.md)
* [Functors](advanced/functors.md)

<hr class="sl">

## Data structures

We are testing different ways of storing of big amount of data, along with the efficiency.

* [Binary Search Trees](data/bst.md) (`ABR`)
* [AVL trees](data/avl.md)

<hr class="sr">

## Sources

...