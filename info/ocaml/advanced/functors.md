# Functors

[Go back](../index.md#advanced-concepts)

You can give parameters to modules using functors. For instance, you could make a module implementing methods for a set, while not knowing if you are elements are int, strings, etc.

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
(* declaring a module having a type t.*)
module type SetElementType = sig
	type t
end

module type AbstractSet = sig
	(* types *)
	type elt
    type set
    (* functions *)
    val add : set -> elt -> set
	val empty : set
    val first : set -> elt
end

(*
As always, the set "GenericSet" will have to implements "AbstractSet" types
and methods.

We are adding an argument that will have to provided when creating the generic set: S.
And we are saying that the type of elt (=type of an element) will be equals to the type
stored in the type t of S.
*)
module GenericSet (S: SetElementType) : AbstractSet with type elt = S.t
```
</div>
<div class="tab-pane fade" id="ml">

```ocaml
(* copy paste of the public parts aside the functions *)
module type SetElementType = sig
	type t
end

module type AbstractSet = sig
	(* types *)
	type elt
    type set
    (* functions *)
    val add : set -> elt -> set
	val empty : set
    val first : set -> elt
end

(*
	You do not know the type of the elt, aside the fact
	that the function s will give you the type.

	Note: I commented out some part of the definition, because you can remove it inside the .ml
 *)
module GenericSet (S: SetElementType) (*: AbstractSet with type elt = S.t*) = struct
	(* the type elt is equals to the type in t *)
	type elt = S.t

	(* implement it like you want *)
	type set = S.t list
	let add set e = e::set
	let empty = []
    let first = List.hd
end
```
</div>
<div class="tab-pane fade" id="run">

```ocaml
open Example

module Int_type = struct
	type t = int
end

module Int_Set = GenericSet(Int_type)
module String_Set = GenericSet(struct type t = string end)

(* list with five *)
let set = Int_Set.add Int_Set.empty 5
let _ = Format.printf "%d@." (Int_Set.first set)

(* list with "five" *)
let set = String_Set.add String_Set.empty "five"
let _ = Format.printf "%s@." (String_Set.first set)
```
</div>
<div class="tab-pane fade" id="compile">

<p class="pt-3">You can compile with these commands</p>

```bash
$ ocamlc -c example.mli
$ ocamlc -c example.ml
$ ocamlc -c example_test.ml
$ ocamlc example.cmo example_test.cmo -o example_test
$ ./example_test
5
five
```
</div>
</div>