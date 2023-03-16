# Zippers

[Go back](../index.md#data-structures)

**A zipper is a structure with two fields**: `left` and `right`. You got multiple ways of representing this in OCaml, but we will consider using a sort of `C` structure/record. We are defining fields/members and their types between `{}`, and we can access fields with `variable.field`.

```ocaml
type 'a zipper = {
	left : 'a list;
	right : 'a list;
}
```

```ocaml
(* create *)
let my_zipper = {left= []; right= [] }
(* get *)
let left = my_zipper.left;;
let right = my_zipper.right;;
```

> This is something that may be used in documents (ex: Word). Your cursor is always between two lists of characters (left and right).