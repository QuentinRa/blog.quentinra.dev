# Folds

[Go back](..)

Do you remember recursive functions with accumulators?
Well folds are a way to apply that on a list.

For instance, let's says you can to know the number
of ``1`` in a list. You may use an accumulator that
you will increase each time you find a ``1`` right?

With an accumulator

```ocaml
(* we got 3 ones *)
let my_list = [1;3;5;6;7;2;1;6;8;2;1;];;

let count_of_one (l: int list) : int = 
  let rec coo_acc (l: int list) (count: int) : int = match l with
    | [] -> count
    | hd::tl -> coo_acc tl (if hd = 1 then (count+1) else count)
  in coo_acc l 0
;;

count_of_one my_list;;
(* - : int = 3 *)
```

Then we will rewrite this using fold. We can either use

* **List.fold_left**: ``('a -> 'b -> 'a) -> 'a -> 'b list -> 'a``
* **List.fold_right**: ``('a -> 'b -> 'b) -> 'a list -> 'b -> 'b``

The differences are

* fold_left is terminal, fold_right is nonterminal
* <span>
    \(
    f_{n}(f_{n-1}(...f_{2}(f_{1}())...))
    \)
    </span> (fold left) vs <span>
    \(
    f_{1}(f_{2}(...f_{n-1}(f_{n}())...))
    \)
    </span> (fold right)
  
TL;DR: use fold_left even that means that you may have to
use a ``List.rev`` right after, but at least your function
will "always" works.

So using fold we will do

```ocaml
let count_of_one (l: int list) : int = 
  List.fold_left 
  (* our function *)
  (fun count hd -> if hd = 1 then (count+1) else count)
   0 (* default accumulator value *)
   my_list (* our list *)
;;

count_of_one my_list;;
(* - : int = 3 *)
```

or using fold_right

```ocaml
let count_of_one (l: int list) : int = 
  List.fold_right 
  (* our function *)
  (fun hd count -> if hd = 1 then (count+1) else count)
  my_list (* our list *)
  0 (* default accumulator value *)
;;

count_of_one my_list;
(* - : int = 3 *)
```