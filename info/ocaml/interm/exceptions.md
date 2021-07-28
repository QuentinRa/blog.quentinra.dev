# Exceptions

[Go back](..)

An exception is the result of something exceptional
happening in your program. This could be

* an error
* end a calculation
* switch to another branch of your code

The latter two a something that I finding disgusting
but functional programmers don't seem to mind doing that.

<hr class="sl">

**Create an exception** (if needed)

```ocaml
exception MyException;;

(* take a string, for a string in argument *)
exception MyException of string;;
exception MyException of int;;
(* ... *)
```

<hr class="sr">

**Raise**

You can raise an exception using the ``raise`` keyword.

```ocaml
exception MyException of string;;
raise (MyException "a message here");;
```

<hr class="sl">

**catch**

```ocaml
exception MyException of string;;

try 
    (* code that might raise an exception *)
    raise (MyException "a message here");;
with (* catch *)
| MyException f -> (* do something here, f will contains
 the error message but you may use _ if you don't need it *)     
| _ -> (* do something here *)     
```

<hr class="sr">

**failwith**

This is a function raising an exception and taking a message.
We usually use it instead of raise and so... for basic
cases.

```ocaml
let my_function x =
  failwith "not implemented yet."
```

```ocaml
my_function 5 ;;
(* Exception: Failure "not implemented yet.". *)
```