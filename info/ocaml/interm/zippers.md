# Zippers

[Go back](..)

Zippers are pretty convenient when you want something
a bit more format than a couple to handle multiples
types in one type.

It's quite a lot like a structure in ``C``. You
define members (here left and right)
and their types.

```ocaml
type 'a zipper = {
 left : 'a list;
 right : 'a list;
};;
```

Then you can do something like that

```ocaml
(* create *)
let my_zipper  = {left= []; right= []};;
(* get *)
let left = my_zipper.left;;
let right = my_zipper.right;;
```

This zipper here would be used if you got one big list but
want to place a cursor where you are. You can either go to
left (move an element from left to right or from right to
left) or delete a previous/next element...

You might not use them right now but they are quite helpful
and convenient.