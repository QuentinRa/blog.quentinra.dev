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

As the installation is hard on Windows, I gathered tutorials here to [install OCaml on Windows](intro/install-win.md). On Linux, you should not have a problem. You can also use OCaml in your browser with [TryOCamlPro](https://try.ocamlpro.com/) (this may be enough/the best solution for a lot of you).

<hr class="sr">

## Advanced concepts

* [Interfaces](advanced/interfaces.md)
* [Modules](advanced/modules.md)
* [Functors](advanced/functors.md)

<hr class="sl">

## Sources

[References](ref.md)