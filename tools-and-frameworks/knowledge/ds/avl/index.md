# AVL trees

<div class="row row-cols-lg-2"><div>

An AVL (Adelson-Velsky and Landis) is a balanced [Binary Search Tree](../bst/index.md). We will ensure that there is no more than one level of "depth" between branches. The complexity is now $\log{(n)}$.

This is an example of a bad BST ($O(n)$) :

<div class="text-center">

![Bad BST - complexity O(n)](_images/abr_bad.png)
</div>
</div><div>

Everything is the same as for a **Binary Search Trees**, but we will call a function to balance our tree after **add** and **remove**.

Only the implementation of the said function is explained here.

* ✅: faster than an ordered list for `add, remove`
* ✅: better than an unbalanced BST
* ✅: implementation is mostly the same as for a BST
* ❌: add and remove are **difficult** to understand/implement
* ❌: slightly slower than an ordered list for `mem`, `get_min`

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

## Rotations

<div class="row row-cols-lg-2"><div>

Each time we add an element <small>(parent node determined by the algorithm)</small>, we may have to correct imbalances using one of the 4 patterns below:

<div class="text-center">

[comment]: <> ([h [l] [rh [rl] [rr]] ])
[comment]: <> ([rh [h [l] [rl]] [rr] ])

![AVL Rotate Left - Begin](_images/rotate_l_1.jpg)
**Left Rotation**
![AVL Rotate Left - End](_images/rotate_l_2.jpg)

If we are adding a child to rr.
</div>

<div class="text-center mt-5">

[comment]: <> ([h [lh [ll] [lr]] [r]])
[comment]: <> ([lh [ll] [h [lr] [r]]])

![AVL Rotate Right - Begin](_images/rotate_r_1.jpg)
**Right Rotation**
![AVL Rotate Right - End](_images/rotate_r_2.jpg)

If we are adding a child to ll.
</div>
</div><div>

<div class="text-center">

[comment]: <> ([h [lh [ll] [lrh [lrl] [lrr]]] [r]])
[comment]: <> ([h [lrh [lh [ll] [lrl]] [lrr]] [r]])
[comment]: <> ([lrh [lh [ll] [lrl]] [h [lrr] [r]]])

![AVL Rotate Left-Right - Begin](_images/rotate_r_1.jpg)
Inserting in lr
![AVL Rotate Left-Right - Balance](_images/rotate_lr_1.jpg)
Apply Left Rotation
![AVL Rotate Left-Right - Half done](_images/rotate_lr_2.jpg)
Apply Right Rotation
![AVL Rotate Left-Right - End](_images/rotate_lr_3.jpg)

If we are adding a child to **lr** <small>(=lrh if lr is empty, otherwise either lrl or lrr)</small>.
</div>

<div class="text-center mt-5">

[comment]: <> ([h [l] [rh [rlh [rll] [rlr]] [rr]]])
[comment]: <> ([h [l] [rlh [rll] [rh [rlr] [rr]]]])
[comment]: <> ([rlh [h [l] [rll]] [rh [rlr] [rr]]])

![AVL Rotate Right-Left - Begin](_images/rotate_l_1.jpg)
Inserting in rl
![AVL Rotate Right-Left - Balance](_images/rotate_rl_1.jpg)
Apply Right Rotation
![AVL Rotate Right-Left - Half done](_images/rotate_rl_2.jpg)
Apply Left Rotation
![AVL Rotate Right-Left - End](_images/rotate_rl_3.jpg)

If we are adding a child to **rl** <small>(=rlh if lr is empty, otherwise either rll or rlr)</small>.
</div>
</div></div>

<hr class="sep-both">

## Balancing Algorithm

<div class="row row-cols-lg-2"><div>

The **height** means the length of the longest path from that node to a leaf. The **Balance factor** of a node `bf(node)` is the difference of height between two branches <small>(left child node minus right child node)</small>.

<br>

#### Find where the tree is unbalanced

Calculate the balance factor of the root:

* `bf(root) = 2`: the tree is left-balanced
* `bf(root) = 2`: the tree is right-balanced
* Otherwise, do nothing
</div><div>

#### Correct a left-balanced tree

* `bf(right) = 1`: Apply a Rotate Right Left
* `bf(right) = 0`: ❌ (impossible)
* `bf(right) = -1`: Apply Rotate Left

<br>

#### Correct a right-balanced tree

* `bf(left) = 1`: Apply a Rotate Right
* `bf(left) = 0`: ❌ (impossible)
* `bf(left) = -1`: Apply Rotate Left Right
</div></div>

<hr class="sep-both">

## Example 1 - Rotate Left

<div class="row justify-content-center mt-4"><div class="col-4">

[comment]: <> (["1" ["0"] ["3" ["2"] ["4" [Empty] ["5"]]]])

![AVL example 1 - Rotate left](_images/example/ex1_1.jpg)
</div><div class="col-6">

* Adding 5
* $bf(tree) = depth(left) - depth(right) = 0 - 2 = -2$
* The tree is **Right balanced**
* $bf(right) = depth(r\\_left) - depth(r\\_right) = 0 - 1 = -1$
* **Rotate Left**
</div></div>

[comment]: <> (["h=1" ["l=0"] ["rh=3" ["rl=2"] ["rr=4" [Empty] ["5"]]]])
[comment]: <> (["rh=3" ["h=1" ["l=0"] ["rl=2"]] ["rr=4" [Empty] ["5"]]])
[comment]: <> (["3" ["1" ["0"] ["2"]] ["4" [Empty] ["5"]]])

![AVL example 1 - Rotate left - init](_images/example/ex1_2.jpg)
![AVL example 1 - Rotate left - do](_images/example/ex1_3.jpg)
![AVL example 1 - Rotate left - clean](_images/example/ex1_4.jpg)

<hr class="sep-both">

## Example 2 - Rotate Right

<div class="row justify-content-center mt-4"><div class="col-4">

[comment]: <> (["4" ["2" ["1" ["0"] [Empty]] ["3"]] ["5"]])

![AVL example 2 - Rotate right](_images/example/ex2_1.jpg)
</div><div class="col-6">

* Adding 0
* $bf(tree) = depth(left) - depth(right) = 2 - 0 = 2$
* The tree is **Left balanced**
* $bf(left) = depth(l\\_left) - depth(l\\_right) = 1 - 0 = 1$
* **Rotate Right**
</div></div>

[comment]: <> (["h=4" ["lh=2" ["ll=1" ["0"] [Empty]] ["lr=3"]] ["r=5"]])
[comment]: <> (["lh=2" ["ll=1" ["0"] ["Empty"]] ["h=4" ["lr=3"] ["r=5"]]])
[comment]: <> (["2" ["1" ["0"] ["Empty"]] ["4" ["3"] ["5"]]])

![AVL example 2 - Rotate right - init](_images/example/ex2_2.jpg)
![AVL example 2 - Rotate right - do](_images/example/ex2_3.jpg)
![AVL example 2 - Rotate right - clean](_images/example/ex2_4.jpg)

<hr class="sep-both">

## Example 3 - Rotate Left Right

<div class="row justify-content-center mt-4"><div class="col-4">

[comment]: <> (["4" ["1" ["0"] ["3" ["2"] ["Empty"]]] ["5"]])

![AVL example 3 - Rotate Left Right](_images/example/ex3_1.jpg)
</div><div class="col-6">

* Adding 2
* $bf(tree) = depth(left) - depth(right) = 2 - 0 = 2$
* The tree is **Left balanced**
* $bf(left) = depth(l\\_left) - depth(l\\_right) = 0 - 1 = -1$
* **Rotate Left Right**
    * We will Rotate Left the left
    * We will Rotate Right the tree
</div></div>

[comment]: <> (["h=4" ["lh=1" ["ll=0"] ["lrh=3" ["lrl=2"] ["lrr=Empty"]]] ["r=5"]])
[comment]: <> (["h=4" ["lrh=3" ["lh=1" ["ll=0"] ["lrl=2"]] ["lrr=Empty"]] ["r=5"]])
[comment]: <> (["lrh=3" ["lh=1" ["ll=0"] ["lrl=2"]] ["h=4" ["lrr=Empty"] ["r=5"]]])
[comment]: <> (["3" ["1" ["0"] ["2"]] ["4" ["Empty"] ["5"]]])

![AVL example 3 - Rotate Left Right - Begin](_images/example/ex3_2.jpg)
**Left Rotation**
![AVL example 3 - Rotate Left Right - Left Rotation](_images/example/ex3_3.jpg)
**Right Rotation**
![AVL example 3 - Rotate Left Right - Right Rotation](_images/example/ex3_4.jpg)
![AVL example 3 - Rotate Left Right - Done](_images/example/ex3_5.jpg)

<hr class="sep-both">

## Example 4 - Rotate Right Left

<div class="row justify-content-center mt-4"><div class="col-4">

[comment]: <> (["1" ["0"] ["4" ["3" ["2"] ["Empty"]] ["5"] ]])

![AVL example 4 - Rotate Right Left](_images/example/ex4_1.jpg)
</div><div class="col-6">

* Adding 2
* $bf(tree) = depth(left) - depth(right) = 0 - 2 = -2$
* The tree is **Right balanced**
* $bf(right) = depth(r\\_left) - depth(r\\_right) = 1 - 0 = 1$
* **Rotate Right Left**
    * We will Rotate Right the right
    * We will Rotate Left the tree
</div></div>

[comment]: <> (["h=1" ["l=0"] ["rh=4" ["rlh=3" ["rll=2"] ["rlr=Empty"]] ["rr=5"] ]])
[comment]: <> (["h=1" ["l=0"] ["rlh=3" ["rll=2"] ["rh=4" ["rlr=Empty"] ["rr=5"]]]])
[comment]: <> (["rlh=3" ["h=1" ["l=0"] ["rll=2"]] ["rh=4"["rlr=Empty"] ["rr=5"]]])
[comment]: <> (["3" ["1" ["0"] ["2"]] ["4"["Empty"] ["5"]]])

![AVL example 4 - Rotate Right Left - Begin](_images/example/ex4_2.jpg)
**Right Rotation**
![AVL example 4 - Rotate Right Left - Right Rotation](_images/example/ex4_4.jpg)
**Left Rotation**
![AVL example 4 - Rotate Right Left - Left Rotation](_images/example/ex4_3.jpg)
![AVL example 4 - Rotate Right Left - Done](_images/example/ex4_5.jpg)