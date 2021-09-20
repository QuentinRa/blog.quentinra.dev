# OCaml

![note: remade in progress](https://img.shields.io/badge/note-remade%20in%20progress-red) <small>(upcoming)</small>

OCaml is a functional language, from the family of Meta Languages (".ml", along with SML or CAML). Unfortunately, OCaml is **impure**, as it allows side-effects. It's strongly advised to read the course about **Functional programming** before starting so you know about immutable, purity, and things like this. We are currently in [OCaml 4.12](https://github.com/ocaml/ocaml).

* [The official manual](https://ocaml.org/manual/index.html)
* [The official tutorials](https://ocaml.org/learn/tutorials/)

> We are using a lot OCaml as students, because a lot of students learned this one before, but I would be better to look as Haskell 🙄, as there are no side-effects.

<hr class="sr">

## Introduction

As a lot of languages such as Python or Java, you are able to write OCaml in a console. Otherwise, you can also write a `file.ml` and compile it like you would in C. You can use

* `ocaml`: to open OCaml console
* `ocamlc file.ml`: to compile a OCaml file and create a `a.out` <small>(this is working like `gcc` in C)</small>.

As the installation is hard on Windows, I made a tutorial here to [install OCaml on Windows](intro/install-win.md). On Linux you should not have a problem. You can also use OCaml in your browser with [TryOCamlPro](https://try.ocamlpro.com/) (this may be enough/the best solution for a lot of you).

<hr class="sl">

## Write some code

If you are using the console, then you must write
``;;`` at the end of each statement, otherwise you
don't have to.

Comments are made using the delimiters ``(*`` and `*)`

```ocaml
(* this is a comment *)
"Hello world" ;;
(* output - : string = "Hello world" *)

(* in a .ml file, use Printf.printf *) 
let _ = Printf.printf "%s" "Hello world"
```

<hr class="sr">

## Basic concepts

The required elements to write some code are

* [Types](basic/types.md)
* [Operators](basic/operators.md)
* [Structures](basic/structures.md)
* [Variables](basic/variables.md)
* [Functions](basic/functions.md)
* [Recursion](basic/rec.md)

You might challenge yourself with these exercises

* [MCQ](basic/mcq.md)
* [Write some code](basic/exercises.md)

<hr class="sl">

## Intermediary concepts

Then you need to know about all of these since 
aside from zippers, you will use them quite a lot.

* [Composite types / couples](interm/couples.md)
* [Creating types](interm/types.md)
* [Lists](interm/lists.md)
* [Match](interm/match.md)
* [Folds](interm/fold.md)
* [Zippers](interm/zippers.md)
* [Exceptions](interm/exceptions.md)

And you may want to do some tests using assertions

*  [Asserts](interm/assets.md)

And here some exercises

* MCQ (not yet)
* [Write some code](interm/exercises.md)

<hr class="sr">

## Advanced concepts

None for now.

* Modules
* Read/Write

You may want to look into the logic course to continue
learning about the depth of this new paradigm.
``Lisp`` and `Haskell` may also be good choices if
you are eager to learn other functional languages.

<hr class="sl">

## Sources

[References](ref.md)