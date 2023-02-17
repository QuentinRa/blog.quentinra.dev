  # OCaml programming

OCaml is a functional language, from the family of Meta Languages (".ml", along with SML or CAML). According to ocaml.org, "OCaml is a general-purpose, industrial-strength programming language with an emphasis on expressiveness and safety". We are currently in [OCaml 4.14](https://github.com/ocaml/ocaml) <small>(OCaml 5.0 is in progress)</small>.

* [The official manual](https://ocaml.org/manual/index.html)
* [The official tutorial](https://ocaml.org/docs) (the new version look nice 😍)
* I made some tutorials to [install OCaml on **Windows**/Linux/MacOS here](https://plugins.jetbrains.com/plugin/18531-ocaml/documentation)
* You can also use **OCaml in your browser** with [TryOCamlPro](https://try.ocamlpro.com/) (online REPL)
* [ocamlverse.net](http://ocamlverse.net/) (an open-source wiki with a lot of knowledge related to OCaml)

> If you are into functional programming, you should check out Haskell, as there are no side effects in it.

<hr class="sl">

## Opam

Opam is a package manager for OCaml, if you are familiar with Python, then this is roughly the same as pip (or npm/yarn for Node.js). To summarize: **you can use opam to install ocaml, packages, or pack your projects as "packages" for others to use it**.

<details class="details-border">
<summary>Some opam-related commands</summary>

```bash
# install (please refer to https://plugins.jetbrains.com/plugin/18531-ocaml/documentation)
sudo apt-get install opam
# init opam
opam init
# see ocaml versions (=switch) installed
# or "ls -l ~/.opam/
opam switch
# install ocaml 4.12.0 - a bit long
opam switch create 4.12.0
# install the package xxx for the current switch
# see https://opam.ocaml.org/packages/
opam install xxx
opam update # and opam update xxx
opam upgrade # and opam upgrade xxx
```
</details>

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

<hr class="sr">

## OCaml REPL

The OCaml Top-Level, also called the **REPL**, is something like you got in Python or Java (recently), allowing you to write commands and see the result. You can start it using the command **`ocaml`**. Every expression must end with `;;` (unlike in a `.ml`).

One thing that make the REPL useful, is that every expression is evaluated and its value is printed to the console. In other words, you won't have to call "printf", and you won't have to worry that an expression is not called (as explained below).

<hr class="sl">

## OCaml and .ml files

You will usually write ocaml code in a `.ml` file, such as `main.ml`. Then, you will have to compile it using the command `ocamlc` which is working like `gcc` (in C programming).

* `ocamlc file.ml`: create a `a.out`
* `./a.out`: execute the code in "file.ml"

Here is a simple ocaml file (ex: file.ml)

```ocaml
let _ = Format.printf "Hello, World!@."
```

<hr class="sr">

## Functional languages

You must declare a variable with `let`. **You can't modify a variable, you will have to create a new one** (concept of **immutability** ✨).

```ocaml
let x = 5
x = 6 (* NOT POSSIBLE *)
let x = 6 (* delete the old x, create a new one *)
```

In functional languages, there should be no side effects. Hence, **if you are not storing something in a variable**, **the compiler will ignore it**, something like "If I don't see you use it later, then it means that you don't need it" (concept of **purity** ✨). In other words, a function returning "void" such as a print is impure. Fortunately, variables starting with a `_` are not stored by the compiler, so you can use this when calling an impure function.

```ocaml
Printf.printf "%s\n" "Hello, World" (* IGNORED !!! *)

(* all of them are equivalent *)
let _ = Printf.printf "%s\n" "Hello, World"
let _ = Format.printf "%s\n" "Hello, World" (* Printf.printf is "weird", use Format *)
let _ = Format.printf "%s@." "Hello, World" (* do this one *)

(* In OCaml, "1+2" without parenthesis is considered as given 3 parameters '1' '+' '2' to a function, so add parenthesis *)
let _ = Format.printf "%d@." (1+2)
(* same for "-1" *)
let _ = Format.printf "%d@." (-1)
```

To be accurate, in OCaml **everything is a value**, so you can give "`-`" (minus) to a function, as for OCaml "`-`" is a function taking two integers and returning one integer. A function taking another function in argument is called a **higher-order function** ✨ (`fonction d'ordre supérieur`).

<details class="details-border">
<summary>Summary of functional paradigm</summary>

* **Immutability**: you can modify a variable
* **Referential transparency**: if `f(x)=y`,
  writing `y` or `f(x)` must be the same. 
* **Purity**: `f(x)-f(x)` is equals to 0, there is no side effects, and you can predict the outcome of your code
* **Implicit types**: types are implicit
* **First-class citizens**: a function can be given as parameter to another function called higher-order function (`Fonction d'ordre supérieur`)
</details>

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

## Meaningless knowledge

<details class="details-e mt-4">
<summary>Comments</summary>

In OCaml, comments are not ignored, and they are really parsed... If you are writing a `"` (quote), the parser will think that you started writing a string, even if you are inside a comment. Hence, if the string is not properly finished (no matching quote), you will have an error, as you would if you wrote a non-terminated string in your code.

It can lead to surprising comments ✌, this one bellow (try it), is a valid comment, but most ocaml highlighters such as the one I'm using, are not parsing it properly.

```ocaml
(* "this is a string *)" *)
```

Also, in OCaml, you can have a comment inside another comment. What I mean, is that you can have a closing comment tag inside another comment... In every other language, you will see an error because the comment would be "(* (* *)", but in OCaml, the code below is working fine

```ocaml
(* (* *) *)
```

</details>

<hr class="sl">

## Sources

**French course**

* [ENSIIE Teachings](https://www.ensiie.fr/)
* [Univ. Lille1 teachings](https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-1.pdf) (courses 1 to 4, change the number in the URL)
* [Wikipedia](https://en.wikipedia.org/wiki/Functional_programming#Concepts)
* [GeeksForGeeks](https://www.geeksforgeeks.org/functional-programming-paradigm/)

**Exercises**

* [LearnOcaml (GitHub)](https://github.com/ocaml-sf/learn-ocaml) and [Online demo](https://ocaml-sf.org/learn-ocaml-public/)

**Courses**

* [RealWorldOCaml](http://dev.realworldocaml.org/) (an amazing free ebook about OCaml)
* [The official tutorial](https://ocaml.org/docs) along with [OCaml 4.14 documentation and reference](https://v2.ocaml.org/releases/4.14/ocaml-4.14-refman.pdf)
* [OCaml: LearnCode](https://ocaml-learn-code.com/) (an app to learn/code OCaml, along with some stuff on their website)
* [An online free ebook about OCaml](https://cs3110.github.io/textbook/cover.html)