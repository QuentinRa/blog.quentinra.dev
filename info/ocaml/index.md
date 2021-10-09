# OCaml

OCaml is a functional language, from the family of Meta Languages (".ml", along with SML or CAML). Unfortunately, OCaml is **impure**, as it allows side-effects. It's strongly advised to read the course about **Functional programming** before starting so you know about immutable, purity, and things like this. We are currently in [OCaml 4.12](https://github.com/ocaml/ocaml).

* [The official manual](https://ocaml.org/manual/index.html)
* [The official tutorials](https://ocaml.org/learn/tutorials/)

> We are using a lot OCaml in my school, because a lot of students learned it before, but I would be better to learn functional programming with a language like Haskell 🙄, as there are no side-effects in it.

<hr class="sr">

## Introduction

As a lot of languages such as Python or Java (👀), you are able to write OCaml in a **console** (REPL). Otherwise, you can also write a `file.ml` and compile it like you would in C. You can use

* `ocaml`: to open OCaml console
* `ocamlc file.ml`: to compile a OCaml file and create a `a.out` <small>(this is working like `gcc` in C)</small>.

As the installation is hard on Windows, I gathered tutorials here to [install OCaml on Windows](intro/install-win.md). On Linux you should not have a problem. You can also use OCaml in your browser with [TryOCamlPro](https://try.ocamlpro.com/) (this may be enough/the best solution for a lot of you).

<hr class="sr">

## Interfaces

OCaml is allowing programmers to define what parts of their code is available in others `.ml` files. **A file is made of two files**: `.ml` (private) and the `.mli` (public). If there is no `.mli`, then the content of the `.ml` is copied in the `.mli` **making everything public**.

If you don't want to make everything public, you need to **copy and paste** code from the `.ml` to the `.mli`. I know this is triggering that you need to copy and paste code, but my teacher told me that there is no other way. **Note that for functions, you are putting the declaration in the mli, not the whole function**.

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="#mli" class="nav-link tab-link active" data-bs-toggle="tab">file.mli</a>
    </li>
    <li class="nav-item">
        <a href="#ml" class="nav-link tab-link" data-bs-toggle="tab">file.ml</a>
    </li>
</ul>
<div class="tab-content">
<div class="tab-pane fade show active" id="mli">

```ocaml
(* Others files can use the function add or the type set *)

type set = int list
(* a set is a list of ints *)

val add : set -> int -> set
(** [add s e]: take a set, a int, and return the set with the new element inside.
 The set is ordered and the values are uniques. *)
```
</div>
<div class="tab-pane fade" id="ml">

```ocaml
(* copy paste of the public parts aside the functions *)
type set = int list

(* this is private *)
exception Exit_add

(** "override add" *)
let add e set = try
	let rec add_acc s = match s with
		| [] -> [e]
		| hd::tl ->
			if e = hd raise Exit_add
    	    else if hd > e then hd::(add_acc tl) (* head unchanged, checking the rest *)
    	    else e::s (* add first, as it is the lowest value *)
    in add_acc set
with Exit_add -> set (* using exceptions to exit faster, and return the unchanged list *)
```
</div>
</div>

<hr class="sl">

## Sources

[References](ref.md)