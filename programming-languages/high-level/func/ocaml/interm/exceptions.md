# Exceptions

[Go back](../index.md#intermediary-concepts)

An exception is the result of something exceptional happening in your program. This could be **an error**, **to end a function/calculation**, or to **switch to another branch of your code**.

<details class="details-e">
<summary>Example of exception to exit a function</summary>

* you got a list of 1 000 000 elements
* you are making sure that each element is only inserted once (=list of unique values)
* in OCaml, you must recreate the whole list, and you may add the element inside
* **BUT**, if the element is inside, it's better to exit the function and returns the previous set, rather than concatenating the set you were creating, with the rest of the set
* You will use an exception here
</details>

<hr class="sl">

## Pre-defined exceptions

* `Division_by_zero`
* `Failure s`: can't work with the given arguments
* `Invalid_argument s`: given arguments do not make sense
* `Match_failure (s,i,i)`: missing match case
* `Not_found`: something was not found

<hr class="sr">

## Raise an exception

Simply call `raise` with the exception

```ocaml
raise Division_by_zero
raise (Failure "message") 
raise (Invalid_argument "message") 
raise (Match_failure ("t",0,1));;
raise Not_found
```

As these exceptions are used a lot, you got some shortcuts

```ocaml
invalid_arg "message" (* raise (Invalid_argument "message") *)
failwith  "message" (* raise (Failure "message") *)
```

<hr class="sr">

## Catch an exception

You may capture an exception using `try ... with`.

```ocaml
let get_in_list x list = try 
		raise Not_found
	with Not_found -> x

(* 5 *)
let get_five = get_in_list 5 [0]
```

If an exception got an argument

```ocaml
let get_message x = try 
		failwith "message" 
	with Failure m -> m 

(* "message" *)
let get_message = get_message 5
```

If an exception got an argument, and you don't care about its value

```ocaml
let get_message x = try 
		failwith "message" 
	with Failure _ -> "Error"

(* "Error" *)
let get_message = get_message 5
```

<hr class="sl">

## Custom exceptions

```ocaml
exception MyException1
exception MyException2 of string
exception MyException3 of int

raise MyException1
raise (MyException2 "string")
raise (MyException3 0)
```