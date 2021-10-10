# Interfaces

[Go back](../index.md#advanced-concepts)

OCaml is allowing programmers to define what parts of their code are available in others `.ml` files. **A file is made of two files**: `.ml` (private) and the `.mli` (public). If there are no `.mli`, then the content of the `.ml` is copied in the `.mli` **making everything public**.

If you don't want to make everything public, you need to **copy and paste** code from the `.ml` to the `.mli`. I know this is triggering that you need to copy and paste code, but my teacher told me that there is no other way. **Note that for functions, you are putting the declaration in the mli, not the whole function**.

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
(* Others files can use the function add or the type set *)

type set = int list
(* a set is a list of ints *)

val add : set -> int -> set
(** [add s e]: take a set, an int, and return the set with the new element inside.
 The set is ordered and the values are uniques. *)
```
</div>
<div class="tab-pane fade" id="ml">

```ocaml
(* copy-paste of the public parts aside from the functions *)
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
```
</div>
<div class="tab-pane fade" id="run">

```ocaml
(* name of the file, having the function
we are importing *)
open Example

(* list with five *)
let five = add [] 5
(* print the first value *)
let _ = Format.printf "%d@." (List.hd five)
```
</div>
<div class="tab-pane fade" id="compile">

For the compilation, you will have to compile the `.mli` before the `.ml`.

```bash
# create a example.cmi
$ ocamlc -c example.mli
# create a example.cmo
$ ocamlc -c example.ml
# create example.cmi and example.cmo
# as there is no .mli
$ ocamlc -c example_test.ml
# creating executable
# example before example_test (because of open Example)
$ ocamlc example.cmo example_test.cmo -o example_test
$ ./example_test
5 # ok
```
</div>
</div>

<hr class="sl">

## What is important to remember

* **in the .mli** (public)
  * declare types
  * declare functions
  * declare modules (next section)
* **in the .ml** (private)
  * declare types (again)
  * implement every declared function
  * implement every declared module (next section)
  * you can declare private functions/types
* **in another file**
  * Use `open File_name` to import `file_name.ml`
* **compilation**
  * compile the mli (cmi) before the ml (cmo)
  * when creating a binary (=listing cmo files), **the order matters**

```bash
$ ocamlc example_test.cmo example.cmo -o example_test
# example.cmo should've been before example_test.cmo
File "_none_", line 1:
Error: Required module `Example' is unavailable
```