# AVL trees

[Go back](../index.md#data-structures)

An **AVL** (Adelson-Velsky and Landis) is a balanced **Binary Search Trees**. We are making sure that the depth is $\pm 1$, instead of having something like the tree below with your usual **Binary Search Trees**. The complexity is now $\log{(n)}$.

![ABR bad - complexity O(n)](images/abr_bad.png)

Everything is the same as for a **Binary Search Trees**, but we will balance our tree in **add** and **remove**.