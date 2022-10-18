# Modules

[Go back](../index.md#advanced-concepts)

We can group declarations of functions and new types in a container, called a **module**. This is a sort of class, if you are familiar with this notion. The declarations of functions/types inside the modules are described in **a module type**, and your module will take the type of **module type**.

If you are familiar with Java, a **module type** is an interface, and a **module** is a class implementing the interface. You can have many **modules** implementing one interface, but every module can only **implement one module type**.

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="#mli" class="nav-link tab-link active" data-bs-toggle="tab">example.mli</a>
    </li>
    <li class="nav-item">
        <a href="#ml" class="nav-link tab-link" data-bs-toggle="tab">example.ml</a>
    </li>
    <li class="nav-item">
        <a href="#run" class="nav-link tab-link" data-bs-toggle="tab">example_test.ml</a>
    </li>
	<li class="nav-item">
		<a href="#compile" class="nav-link tab-link" data-bs-toggle="tab">compile</a>
	</li>
</ul>
<div class="tab-content">
<div class="tab-pane fade show active" id="mli">

```ocaml
(* we are declaring that every module having this type,
 will have to define the function add, and will have a type called set.*)
module type IntSetListType = sig
	(* Others files can use the function add or the type set *)

    type set = int list
    (* a set is a list of ints *)

    val add : set -> int -> set
    (** [add s e]: take a set, an int, and return the set with the new element inside. *)
end

(* The set is an implementation of IntSetListType with ordered and unique values *)
module OrderedUniqueIntSetList : IntSetListType
```
</div>
<div class="tab-pane fade" id="ml">

```ocaml
(* copy paste of the public parts aside the functions and the modules that are implemented *)
module type IntSetListType = sig
    type set = int list

    val add : set -> int -> set
end

module OrderedUniqueIntSetList = struct
	type set = int list

	(* this is private *)
	exception Exit_add

	(** "override add" *)
	let add set e = try
		let rec add_acc s = match s with
			| [] -> [e]
			| hd::tl ->
				if (e = hd) then raise Exit_add
	            else if (hd > e) then hd::(add_acc tl) (* head unchanged, checking the rest *)
	            else e::s (* add first, as it is the lowest value *)
	    in add_acc set
	with Exit_add -> set (* using exceptions to exit faster, and return the unchanged list *)
end
```
</div>
<div class="tab-pane fade" id="run">

```ocaml
open Example

(* renaming, not required at all, you could use OrderedUniqueIntSetList *)
module OL = OrderedUniqueIntSetList

(* list with five *)
let five = OL.add [] 5
(* print the first value *)
let _ = Format.printf "%d@." (List.hd five)
```
</div>
<div class="tab-pane fade" id="compile">

<p class="pt-3">You can compile with these commands</p>

```bash
$ ocamlc -c example.mli
$ ocamlc -c example.ml
$ ocamlc -c example_test.ml
# creating executable
$ ocamlc example.cmo example_test.cmo -o example_test
$ ./example_test
5 # ok
```
</div>
</div>

**Unfortunately**, this code is not very good. The one using my interface knows that I'm using lists, so I would not be able to change it. Here is a more generic version.

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="#mli2" class="nav-link tab-link active" data-bs-toggle="tab">example.mli</a>
    </li>
    <li class="nav-item">
        <a href="#ml2" class="nav-link tab-link" data-bs-toggle="tab">example.ml</a>
    </li>
    <li class="nav-item">
        <a href="#run2" class="nav-link tab-link" data-bs-toggle="tab">example_test.ml</a>
    </li>
	<li class="nav-item">
		<a href="#compile2" class="nav-link tab-link" data-bs-toggle="tab">compile</a>
	</li>
</ul>
<div class="tab-content">
<div class="tab-pane fade show active" id="mli2">

```ocaml
(*
Every module having this type will have to define
what are elt, what is set, and what's the code for add.
*)
module type AbstractIntSet = sig
	type elt = int (* for now, this is still inside the mli *)
    type set (* type up to the implementation *)

    val add : set -> elt -> set
    (** [add s e]: take a set, an element, and return the set with the new element inside. *)

	val empty : set
    val first : set -> elt
    (** [first s]: returns the first element *)
end

(* The IntSet is an implementation of AbstractSet *)
module IntSet : AbstractIntSet
```
</div>
<div class="tab-pane fade" id="ml2">

```ocaml
(* copy paste of the public parts aside the functions and the modules that are implemented *)
module type AbstractIntSet = sig
	type elt = int
    type set
    val add : set -> elt -> set
    val empty : set
	val first : set -> elt
end

(* in my implementation, called IntSet, I'm using a list,
 with ordered and unique values. Aside from the one reading this code, no one else knows.
 *)
module IntSet : AbstractIntSet = struct
	type elt = int
	type set = elt list

	(* this is private *)
	exception Exit_add

	(** "override add" *)
	let add set e = try
		let rec add_acc s = match s with
			| [] -> [e]
			| hd::tl ->
				if (e = hd) then raise Exit_add
	            else if (hd > e) then hd::(add_acc tl) (* head unchanged, checking the rest *)
	            else e::s (* add first, as it is the lowest value *)
	    in add_acc set
	with Exit_add -> set (* using exceptions to exit faster, and return the unchanged list *)

	let first = List.hd
	let empty = []
end
```
</div>
<div class="tab-pane fade" id="run2">

```ocaml
open Example

(* list with five *)
let set = IntSet.add IntSet.empty 5
(* print the first value *)
let _ = Format.printf "%d@." (IntSet.first set)
```
</div>
<div class="tab-pane fade" id="compile2">

<p class="pt-3">You can compile with these commands</p>

```bash
$ ocamlc -c example.mli
$ ocamlc -c example.ml
$ ocamlc -c example_test.ml
$ ocamlc example.cmo example_test.cmo -o example_test
$ ./example_test
5 # ok
```
</div>
</div>