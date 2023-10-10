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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>

</div></div>