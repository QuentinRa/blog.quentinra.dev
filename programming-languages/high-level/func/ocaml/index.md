# OCaml

<div class="row row-cols-md-2"><div>

[OCaml](https://ocaml.org/) is a functional language. It's part of the family of [Meta Language](https://en.wikipedia.org/wiki/ML_(programming_language)) (ML). It adds object-oriented features to Caml.

* [Documentation](https://ocaml.org/docs) <small>(⛪)</small>
* [Manual](https://v2.ocaml.org/manual/index.html) <small>(⛪)</small>
* [Online OCaml REPL](https://try.ocamlpro.com/) <small>(🚀)</small>
* [ocamlverse.net](http://ocamlverse.net/) <small>(🚀)</small>
* [ocaml-sf](https://ocaml-sf.org/learn-ocaml-public) <small>(👻)</small>
* [RealWorldOCaml](http://dev.realworldocaml.org/) <small>(📚)</small>
* [OCaml Programming](https://cs3110.github.io/textbook/cover.html) <small>(📚)</small>
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

## OCaml as a functional language

<div class="row row-cols-md-2"><div>

#### Implicit types

Types are implicit and should not be made explicit.

#### Immutability

The concept of immutability means that we can't modify a variable, e.g., all variables are constants.

```ocaml
let x = 5
x = 6 (* ❌ NOT ALLOWED *)
let x = 6 (* Delete and create a new one *)
```

<br>

#### Higher-order function

Everything is a value, or said otherwise, every element is a [first-class citizen](https://en.wikipedia.org/wiki/First-class_citizen) in OCaml. For instance, we can pass a function as an argument to another function, called [Higher-order function](https://en.wikipedia.org/wiki/Higher-order_function).

```ocaml
(* ⚠️ "1+2" is read by ocaml as "1" "+" "2" *)
(* e.g. three arguments *)
let _ = Format.printf "%d@." 1+2   (* ❌ *)
let _ = Format.printf "%d@." (1+2) (* ✅ *)
```
</div><div>

#### Purity

Functions should not have any side effects. For instance, if I write a line and do not store the result in a variable, removing the line should not have any impact.

```ocaml
(* not stored in a variable: skipped by the compiler *)
Printf.printf "%s\n" "Hello, World"
```

🔥 Every printing function returning `Unit` is not pure.

#### Referential transparency

This concept is quite related to the concept of Purity. As functions are pure, it means that we can replace the function by its result without impacting the program.

```diff
let f x = x -1
-let y = f 5
(* After substitution, it becomes: *)
+let y = 4
```
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

## OCaml Basics

<div class="row row-cols-md-2"><div>

#### Declare a variable

Simple declarations:

```ocaml
let x = 5
let y = "test"
let x = y      (* cannot edit, only redeclare *)
```

You can declare multiple variables at once:

```ocaml
let x = 5 and y = "test"
(* create two variables *)
```

Local variables are only available in the scope of the declaration:

```ocaml
(* the last expression is the value of "res" *)
(* res = 750, x/y/z are undefined *)
let res =
	let x = 5 in
	let y = 10 in
	let z = 15 in
	x * y * z
```

⚠️ The name of the variable must start with a lowercase.

⚠️ You cannot use a variable that was not declared.

🔥 If a variable name equal to `_`, it's considered as a temporary variable and discarded by the compiler after evaluating it.

```ocaml
let _ = (* some expression with a side-effect *)
(* _ is not defined *)
```

<br>

#### Print some text in the terminal

It's common to use `@.` instead of `\n` as it flushes the buffer too.

```ocaml
(* all of them are roughly the same *)
let _ = Printf.printf "%s\n" "Hello, World"
let _ = Format.printf "%s\n" "Hello, World"
let _ = Format.printf "%s@." "Hello, World" (* 🚀 *)
```
</div><div>

#### Types

A few of the common types are:

```ocaml
let var = 5 + 0x29a       (* type = int *)
let var = 5.0 +. 5.       (* type = float *)
let var = true && false   (* type = bool *)
let var = '5'             (* type = char *)
let var = "5"             (* type = string *)
let var = ()              (* type = unit *)
```

#### Conversions

Functions to convert a variable of type `a` to `b` have the form `b_of_a`.

```ocaml
(* convert an int to a string *)
let var = string_of_int 5
```

#### Operators

Here is a list of most [operators](/programming-languages/_paradigm/stuff/operators.md).

```ocaml
(* arithmetic betwenn integers *)
let sum = 5 + 5           (* 10 *)
let subtraction = 5 - 5   (* 0 *)
let product = 5 * 5       (* 25 *)
                          (* see also: / and mod *) 

(* arithmetic betwenn floats *)
let sum = 5. +. 5.        (* 10. *)    
let pow = 5. ** 2.        (* 25. *)
                          (* see also: -. *. /. *)     

let equal = 5 = 5         (* true ⚠️ not "==" *)
let different = 5 <> 5    (* false ⚠️ not "!=" *)
let negation = not true   (* false ⚠️ not "!" *)
                          (* see also: >, >=, <, <= *)

let op = true || false    (* true ☠️ not "or" *)
let op = true && false    (* false *)

let str = "ab" ^ "c";     (* concatenation *)
```

⚠️ `!`, `!=` and `==` are reserved for addresses comparisons.
</div></div>

<hr class="sep-both">

## Control-flow and Branching

<div class="row row-cols-md-2"><div>

#### OCaml Branching

As a reminder, everything is a value in OCaml, including statements.

```ocaml
let xxx = if condition then value_if_true else value_if_false

(* simple example *)
let n = if 10 > 0 then 10 else 15

(* example within the code *)
let f x =
    let r = if x > 0 then 30 else 15 in
    x + r
```

You can use `else if`:

```ocaml
if ... then ... else if ... then ... else ...
(* which is actually *)
if ... then ... else (if ... then ... else ...)
```

#### Assert

Assert is a function taking a boolean and raising an [exception](#exceptions) (`Assert_failure`) if the boolean is false. It's used to test the code.

```ocaml
let f x = x
let _ = assert (f 5 = 5)
```

</div><div>

#### Exceptions

An exception means something unexpected occurred. It's commonly used to report errors, while in OCaml, it's often used to stop the execution of a function when we got our result.

Some pre-defined exceptions: 

* `Division_by_zero`
* `Failure s`: we can't work with the given arguments
* `Invalid_argument s`: the given arguments do not make sense
* `Match_failure (s,i,i)`: missing match case
* `Not_found`: something was not found

To raise an exception:

```ocaml
(* Custom Exceptions *)
exception MyException1
exception MyException2 of string
raise MyException1
raise (MyException2 "message")
(* raise an exception *)
invalid_arg "message" (* raise (Invalid_argument "message") *)
failwith  "message"   (* raise (Failure "message") *)
(* Catch an exception *)
try 
    raise Failure "message"
with Failure m -> (* do something | m is a variable name *)
```

<details class="details-n">
<summary>Example of using exceptions to stop the execution of a function</summary>

Imagine we want to add an element in a set <small>(unique values)</small>. When we notice the element is already in, we raise an exception and return the existing set instead of creating a new one.

```ocaml
let add_to_uniq_list e list =
  let rec aux_unique_list acc = function
    | [] -> List.rev (e::acc) (* not in; add our element *)
    | x :: xs ->
        if x = e then (* raise an exception *)
          raise (Failure "Already in")
        else (* recreate the set *)
          aux_unique_list (x :: acc) xs
  in
  try
    aux_unique_list [] list
  with (* return the list unchanged *)
  | Failure _ -> list
;;

(* examples *)
create_unique_list 5 [3;6;4];;
create_unique_list 3 [3;6;4];;
```
</details>
</div></div>

<hr class="sep-both">

## OCaml Functions

<div class="row row-cols-md-2"><div>

#### Declare a function

There are two keywords to declare functions: `fun` or `function`, while you may use neither of them.

```ocaml
(* f(x,y) = x * y *)
let f x y = x * y (* 🚀 *)
let f = fun x y -> x * y
let f = fun x -> fun y -> x * y
let f = function x -> function y -> x * y (* 😶 *)
```

You may notice it, in OCaml, functions are [curried](https://en.wikipedia.org/wiki/Currying) by default, which means that a function that appears to take multiple arguments is actually a series of functions that take one argument each.

Also, functions are only returning one value.

<br>

#### Call a function

The process to call a function is pretty straightforward:

```ocaml
let v1 = f 5 5        (* 25 *)
let v2 = f 5 (-1)     (* -5 *)
let v3 = f 5 (f 6 v2) (* -150 *)
```
</div><div>

#### Recursive Functions

A [recursive](/programming-languages/_paradigm/stuff/recursivity.md) function is a function calling itself. You must add the `rec` keyword or you will get an `Unbound value` error.

```ocaml
let rec pow x power = 
  if power = 1
  then x
  else x * (pow x (power-1))

let _ = pow 5 3 (* 125 *)
```

To write terminal recursive function, we use an accumulator.

```ocaml
let pow x power =
    let rec pow_acc power acc = 
        if power <= 0
        then acc (* done, return result *)
        else let new_acc = x * acc
            in let new_power = power - 1
            in pow_acc new_power new_acc
            (* <=> pow_acc (power-1) (x * acc) *)
    in pow_acc power 1 (* x^0 = 1 *)

let _ = pow 5 3 (* 125 *)
```
</div></div>

<hr class="sep-both">

## OCaml Advanced Types

<div class="row row-cols-md-2"><div>

#### Composite types

A composite type, commonly called a tuple or record, is a type made of multiple types. It's useful as function can only return one value.

```ocaml
let person = ("name", 5)
(* same, but less readable 🙄 *)
let person = "name", 5
```

The type is `string * int`.

```ocaml
let name = fst person (* "name" *)
let age = snd person (* 5 *)
(* deconstruct *)
let (name, age) = person
let (name, _) = person (* name only *)
let (_, age) = person (* age only *)
```

<br>

#### Strings

There are [multiple functions](https://v2.ocaml.org/api/String.html) for strings.

```ocaml
let equal = String.equal "a" "b" (* false *)
let length = String.length "a" (* 1 *)
```
</div><div>

#### Lists

There are [multiple functions](https://v2.ocaml.org/api/List.html) for lists. Lists are generic,  as per the `'a`. `[]` is an empty list and `a::list` means adding `a` to `list`.

```ocaml
(* the official type of a List *)
type 'a list = [] | (::) of 'a * 'a list
```

Common uses:

```ocaml
let empty_list = []
let list = 7::list  (* add 7 at the front of list *)
let list = list@[7] (* add 7 at the end of list *)
let list = 7::5::[] (* same as 7::(5::[]) *)
let list = [7;5]    (* same as 7::5::[] *)
```

⚠️ Beware that using `,` such as `[7,5]` means the list `[(7, 5)]` <small>(tuple)</small>.

```ocaml
let length = List.length [5;6] (* 2 *)
let merge = List.concat [[5;6];[7;8]] (* [5;6;7;8] *)
let reversed = List.rev [5;6] (* [6;5] *)
let head = List.hd [5;6] (* 5 *)
let tail = List.tl [5;6] (* [6] *)
let is_inside = List.mem 5 [5;6] (* true *)

(* higher-order function 🚀 *)
let plus_one = List.map (fun x -> x+1) [5;6] (* [6;7] *)
let remove_five = List.filter (fun x -> x <> 5) [5;6] (* [6] *)
```
</div></div>

<hr class="sep-both">

## OCaml Custom Types

<div class="row row-cols-md-2"><div>

#### Type Inference

Types are inferred, but you may add `: type` after a variable name.

```ocaml
let x : float = 5.0
```

When a value could be of any type, we use `'a`, `'b` etc.

```ocaml
let f x = 5.0 (* the type of x is unknown: 'a *)
```

Types for function are the type of each parameter, with parenthesis if needed, followed by the return type, and separated with `->`.

```ocaml
(* int -> int -> int *)
let f x y = x + y (* x = int, y = int, return int *)

(* ('a -> int -> b') -> 'a -> b' *)
let g h x = h x 10 (* h = function, x = 'a, return b' *)
```

➡️ Only the type of the second parameter of `h` can be inferred. We could infer that `h` is a function as there is a function call `h x 10`.
</div><div>

#### Create a type

You can declare of type composed of other types:

```ocaml
type person = string * int
let john : person = ("John Doe", 42)

type float_list = float list
let x : float_list = [5.;3.;6.]
```

<br>

#### Constructors

A constructor is a way to create variables of a new type.

```ocaml
type person = Person of string * int
let john = Person ("John Doe", 42)
```

You can have multiple of them:

```ocaml
type tree = Empty | Node of tree * int * tree
type tree = | Empty | Node of tree * int * tree
type tree =
    | Empty
    | Node of tree * int * tree

let empty_tree = Empty
let a_node = Node (empty_tree, 1, empty_tree)
let another_node = Node (node_1, 1, node_1)
```
</div></div>

<hr class="sep-both">

## Pattern Matching 🛣️

<div class="row row-cols-md-2"><div>

#### Implicit Pattern Matching

Pattern Matching can be <small>(implicitly)</small> used with a type that has a constructor to extract its values:

```ocaml
let Person(name, age) = john
(* name = "John Doe", age = 42 *)
```

➡️ Both `name` and `age` are variable names. It could be `_`.

<br>

#### Match With Clause

For multiple constructors, we use `match with`:

```ocaml
type person = Anonymous | Person of string * int
let get_name p = match p with
    | Anonymous -> "Anonymous"
    | Person (name, _) -> name

let _ = get_name (Person ("Henry", 24)) (* "Henry" *)
```

<br>

#### Match Default clause

We can use `_` for a default clause.

```ocaml
let is_anonymous p = match p with
    | Anonymous -> true
    | _ -> false (* any other constructor *)

let _ = is_anonymous Anonymous (* true *)
```
</div><div>

#### Match Merge clauses

You can merge conditions by separating them by `|`:

```ocaml
let is_alive p = match p with 
    | Anonymous | Person(_,_) -> true
```

<br>

#### Match Multiple Variables

You can match multiple variables in one clause:

```ocaml
let are_both_anonymous p1 p2 = 
    match p1, p2 with
    | Anonymous, Anonymous -> true
    | _ -> false
```

<br>

#### Match With Lists

As a reminder, lists have the `[]` and the `a::list` <small>(recursive)</small> constructors.

```ocaml
let is_empty l = match l with | [] -> true | _ -> false

(* is e inside l ?*)
let rec mem l e = match l with
    | [] -> false
    | hd::tl -> e = hd || mem tl e
	
(* return the first two values, or raise Not_found *)
let first_two l = match l with
    | a::b::_ -> [a;b]
    | _ -> raise Not_found
```
</div></div>

<hr class="sep-both">

## Interfaces and Modules

<div class="row row-cols-md-2"><div>

#### Interfaces

When we compile a `.ml`, OCaml will create a `.mli` with the same contents as the `.ml`. It will compile both giving us a `.cmo` and a `.cmi`.

We can create the `.mli` ourselves. It's an **interface** that represents what other `.ml` importing this file can use. It contains:

* type declarations 🪨
* function declarations 🌿
* module declarations 📚
* exception declarations 🔥
* ...

Use `open File_name` to import `file_name.ml`.

Note that everything inside the `.mli` **should be copied to** the `.ml`.

<details class="details-n">
<summary>Example with a simple project</summary>

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

(** "implement add" *)
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
<div class="tab-pane fade pt-3" id="compile">

You must compile the `.mli` before the `.ml`.

```bash
$ ocamlc -c example.mli # example.cmi
$ ocamlc -c example.ml  #  example.cmo
$ ocamlc -c example_test.ml # both .cmi and .cmo
# creating an executable
$ ocamlc example.cmo example_test.cmo -o example_test
$ ./example_test
5 # ok
```
</div>
</div>
</details>

It's worth emphasizing that the order during compilation matters:

```ps
$ ocamlc example_test.cmo example.cmo -o example_test
# example.cmo should've been before example_test.cmo
# as the latter include the former
File "_none_", line 1:
Error: Required module `Example` is unavailable
```
</div><div>

...
</div></div>

<hr class="sep-both">

## Advanced Content

<div class="row row-cols-md-2"><div>

#### Folding on Lists

Aside from `List.map` to execute a function on all values of the list, there are two functions on Lists to compute a value from a list:

For instance, if we want the sum of the elements in a list. They allow us to get rid of accumulators when using lists.

* List.fold_left: `('a -> 'b -> 'a) -> 'a -> 'b list -> 'a`
* List.fold_right: `('a -> 'b -> 'b) -> 'a list -> 'b -> 'b`

`List.fold_left` is terminal while `ist.fold_right` isn't.

<div>$$
\[
\begin{split}
f_{n}(f_{n-1}(...f_{2}(f_{1}(list))...))\quad \scriptsize\text{(fold left)}\\
\textbf{vs}\\
f_{1}(f_{2}(...f_{n-1}(f_{n}(x))...))\quad \scriptsize\text{(fold right)}
\end{split}
\]
</div>

<details class="details-n">
<summary>Ex: List.length with fold 🔥</summary>

With a fold_left

```ocaml
let get_length l =
  List.fold_left
    (fun acc _ -> acc + 1) (* update *)
    0 (* init *)
    l (* what are we iterating? *)
```

With a fold_right

```ocaml
let get_length l =
  List.fold_right
    (fun _ acc -> acc + 1) (* update *)
    l (* what are we iterating? *)
    0 (* init *);;
```
</details>

<details class="details-n">
<summary>Ex: List.min with fold 🔥</summary>

With a fold_left

```ocaml
let get_min l =
  (* raise exception if not in the list *)
  if l = [] then raise Not_found
  (* else do your job *)
  else List.fold_left
      (fun acc v -> if v < acc then v else acc) (* update *)
      (List.hd l) (* init *)
      l (* what are we iterating? *)
        
;;
```

With a fold_right

```ocaml
let get_min l =
  (* raise exception if not in the list *)
  if l = [] then raise Not_found
  (* else do your job *)
  else List.fold_right
      (fun v acc -> if v < acc then v else acc) (* update *)
      l (* what are we iterating? *)
      (List.hd l) (* init *)
```
</details>
</div><div>
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-md-2"><div>

#### OCaml Comments

The following comments are valid in OCaml:

<div class="row row-cols-md-2"><div>

```ocaml
(* "*)" *)
```
</div><div>

```ocaml
(* (* *) *)
```
</div></div>

While the following comment is invalid <small>(unterminated string)</small>:

```ocaml
(* " *)
```
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* do not use "unit"
* `Stdlib.compare a b` (-1, 0, 1)
* partial function (function not entirely called)

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
</div><div>
</div></div>