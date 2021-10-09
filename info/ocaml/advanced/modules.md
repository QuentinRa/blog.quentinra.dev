# Modules

[Go back](../index.md#advanced-concepts)

We can group declarations of functions and new types in a container, called a **module**. This is a sort of class, if you are familiar with this notion. The declarations of functions/types inside the modules are described in **a module type**, and you module will take the type of a **module type**.

If you are familiar with Java, a **module type** is an interface, and a **module** is a class implementing the interface. You can have many **modules** implementing one interface, but every module can only **implements one module type**.

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
    (** [add s e]: take a set, a int, and return the set with the new element inside. *)
end

(* The set is an implementation of IntSetListType with ordered and unique values *)
module OrderedUniqueIntSetList : IntSetListType
```
</div>
<div class="tab-pane fade" id="ml">

```ocaml
(* copy paste of the public parts aside the functions *)
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