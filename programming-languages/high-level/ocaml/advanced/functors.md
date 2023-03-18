# Functors

[Go back](../index.md#advanced-concepts)

You can give modules as parameters to other modules. These modules are called **functors**. For instance, you could make a module implementing methods for a set, while not knowing if you are elements are int, strings, etc. This module ("set") will take in argument another module ("element type") describing the type of an element, which you will use when coding your module.

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

(* declaring a module describing a set *)
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
As always, the set "GenericSet" will have to implement "AbstractSet" types and methods.

We are adding an argument that will have to be provided when creating the generic set: S.
And we are saying that the type of elt (=type of an element) will be equals to the type
stored in the type t of S.
*)
module GenericSet (S: SetElementType) : AbstractSet with type elt = S.t
```
</div>
<div class="tab-pane fade" id="ml">

```ocaml
(* copy-paste of the public parts aside from the functions and the modules that are implemented *)
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
	You do not know the type of the elt, aside from the fact
	that the function s will give you the type.

	You could use this complete definition, but I'm opting for the shorter one
	module GenericSet (S: SetElementType) : AbstractSet with type elt = S.t = struct
 *)
module GenericSet (S: SetElementType) = struct
	(* the type elt is equals to the type inside t *)
	type elt = S.t

	(* implement it hovewer you want *)
	type set = elt list
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
(* you could do that too, no need for a ; if you have multiple fields *)
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