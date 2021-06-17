# OCaml

This is a meta-language (.ml), that will be used
to demonstrate the ``functional programming`` paradigm.

You should remember that the concepts are

* everything is a **value**
* **implicit types**
* variables are **immutables** (=can change the value)
* **pure** (giving some parameters we should always
  have the same predictable result at the end, no
  side-effects so a function must return a value)
* **referential transparency** (if `f(x) = y` then writing
  `f(x)` or `y` is the same, and `f(x)-f(x)` is equal
  to `0`)

[Here](intro/fp.md) something more complete.

<div class="sr"></div>

## Introduction

You can write OCaml in a ``.ml`` file, then compile
using ``ocamlc``. You can also write some code in a
console (`ocaml`) like in python or a lot of languages.

Installing ``ocaml`` may be a pain in the ass if you are
not on Linux. 

* Some are using the [online console](https://try.ocamlpro.com/)
* [a french tutorial](https://carnot.cpge.info/index.php/2018/01/28/installer-ocaml-sur-sa-machine/)
presenting tools for macOS and Windows
* you can try this tutorial [OCaml with opam](https://fdopen.github.io/opam-repository-mingw/installation/)
* you can try ``WinCaml`` but it's a virus according to Norton
  and the site is ranked as dangerous (seems like it
  happened after the website moved and the old site
  is down...)

or you can follow one of these tutorials

* [Install OCaml + use in VSCode](intro/install-m.md)
* [Install OCaml in WSL](intro/install-wsl.md)
* [OCaml in Intellij](intro/install-idea.md)

<div class="sl"></div>

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

<div class="sr"></div>

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

<div class="sl"></div>

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

<div class="sr"></div>

## Advanced concepts

None for now.

* Modules
* Read/Write

You may want to look into the logic course to continue
learning about the depth of this new paradigm.
``Lisp`` and `Haskell` may also be good choices if
you are eager to learn other functional languages.

<div class="sl"></div>

## Sources

[References](ref.md)