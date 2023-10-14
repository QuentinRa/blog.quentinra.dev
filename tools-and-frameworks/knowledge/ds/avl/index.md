# AVL trees

<div class="row row-cols-md-2"><div>

An AVL (Adelson-Velsky and Landis) is a balanced [Binary Search Tree](../bst/index.md). We will ensure that there is no more than one level of depth between branches. The complexity is now $\log{(n)}$.

This is an example of a bad BST ($O(n)$) :

<div class="text-center">

![Bad BST - complexity O(n)](_images/abr_bad.png)
</div>
</div><div>

Everything is the same as for a **Binary Search Trees**, but we will add a logic balance our tree during **add** and **remove**.

* ✅: faster than an ordered list for `add, remove`
* ✅: better than an unbalanced BST
* ✅: implementation is mostly the same as for a BST
* ❌: add and remove are **difficult** to understand/implement
* ❌: sightly slower than an ordered list for `mem`, `get_min`

<details class="details-n">
<summary>Time comparisons - 500 000 values between 0 and 10 000</summary>

Test results of an implementation in [OCaml](/programming-languages/high-level/func/ocaml/index.md).

```text!
>>>>>>>>>> TIME FOR A LIST <<<<<<<<<<
Average time of add:                     0.000046
Average time of remove:                  0.000047
Average time for mem:                    0.002340
Average time for get_min:                0.001870
Average time for cardinal:               0.353290 (long)
>>>>>>>>>> TIME FOR BST <<<<<<<<<<
Average time of add:                     0.000002
Average time of remove:                  0.000002
Average time for mem:                    0.006270
Average time for get_min:                0.003290
Average time for cardinal:               inf (too long)
>>>>>>>>>> TIME FOR AVL <<<<<<<<<<
Average time of add:                     0.000010
Average time of remove:                  0.000005
Average time for mem:                    0.003430
Average time for get_min:                0.002800
Average time for cardinal:               inf (too long)
```
</details>

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>
</div></div>