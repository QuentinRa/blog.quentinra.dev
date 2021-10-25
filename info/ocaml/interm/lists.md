# Lists

[Go back](../index.md#intermediary-concepts)

A list is an array of values. Every value in a list got the same type.

```ocaml
type 'a list = [] | (::) of 'a * 'a list
```

* `[]`: empty list
* `a::list`: create a list with `a` then a list `list`

> **Notice** that the type is `'a`, meaning that we can create list of int, float, ... or even a list of lists <small>(if 'a = int list then we got int list list)</small> with this constructor.

<hr class="sl">

## New list

As you read, a list is either an empty list or a value followed by a list, so we have

```ocaml
let empty_list = []
(* both are the same *)
let list_5 = 5::[]
let list_5 = [5]
(* Both are giving the same result *)
let list_7_5 = 7::list_5 (* append *)
let list_7_5 = [7;5] (* create *)
```

You may use `@` to add a value at the end of the list such as `[5;6]@[7]`, but my teachers are **against this** <small>("There is always a better way to do something, without using this sh*t")</small>.

> * `[]`: empty list <small>(result: `[]`)</small>
> * `[a;b;...]`: a list with a, b, ... <small>(result: `[a;b,...]`)</small>
> * `a::[]`: add `a` to empty list <small>(result: `[a]`)</small>
> * `a::b::[]`: add `b` then `a` to empty list <small>(result: `[a;b]`)</small>
> * `a::list`: add `a` to the list `list` <small>(result: `[a;...]`)</small>

> **Notice**: the values are separated by a semi-colon (`;`), we are already using commas (`,`) for composite types after all 😱.

<hr class="sr">

## Some functions

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

You got the [complete list of functions here](https://ocaml.org/api/List.html).