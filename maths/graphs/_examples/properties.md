# Graph Properties and Concepts Examples

<hr class="sep-both">

## Connected Graph Example

<div class="row row-cols-lg-2"><div>

Given the following graph $G$:

![Connected Graph Example](../_images/connected/connected1.svg)

#### What are the connected components?

We have $C_1=\{e,f,g\}$ and $C_2=\{a,b,c,d,h,i\}$ using the algorithm.

<div class="overflow-scroll mb-3">

<img src="/courses/maths/graphs/_examples/../_images/connected/connected1-1.png" class="" alt="Example 1 - connected algorithm" title="Example 1 - connected algorithm">
</div>

#### Is the graph connected?

No, we got more than one connected component.
</div><div>

#### Create a subgraph $G'$ with $\text{\{a,b,c,d\}}$.

We extract the vertices and their edges.

![Subgraph Example](../_images/connected/connected1-2.svg)

#### Is $G'$ connected? And super-connected?

We got only one component, so the graph is connected. The graph does seem to be super-connected. We apply the algorithm:

<div class="overflow-scroll mb-3">

<img src="/courses/maths/graphs/_examples/../_images/connected/connected1-3.png" class="" alt="Example 1 - super-connected algorithm" title="Example 1 - super-connected algorithm">
</div>

All vertices are marked with "+" and "-", the graph is super-connected.
</div></div>

<hr class="sep-both">

## Transitive closure and Connectivity Example

<div class="row row-cols-lg-2"><div>

Use the transitive closure to determine if $G$ is super-connected.

![Example 2 - Graph](../_images/connected/connected2.png)

Using Roy-Warshall's algorithm, we got the transitive closure:

<div class="overflow-scroll mb-3">
<img src="/courses/maths/graphs/_examples/../_images/connected/connected2-1.svg" class="" alt="Example 2 - Roy-Warshall's algorithm - result" title="Example 2 - Roy-Warshall's algorithm - result">
</div>

This is a complete graph $K_{6}$. Since the transitive closure is a complete graph, then $G$ is super-connected.
</div><div>

For reference, here is Roy-Warshall's algorithm:

<div class="overflow-scroll mb-3">
<img src="/courses/maths/graphs/_examples/../_images/connected/connected2-2.png" class="" alt="Example 2 - Roy-Warshall's algorithm - process" title="Example 2 - Roy-Warshall's algorithm - process">
</div>

The complete algorithm (text)

* **picking A**
* $s=C$, $p=B$, creating (B,C)? yes
* $s=C$, $p=E$, creating (E,C)? yes
* $s=C$, $p=F$, creating (F,C)? yes
* **picking B**
* $s=A$, $p=C$, creating (C,A)? yes
* $s=A$, $p=F$, creating (F,A)? no
* $s=A$, $p=D$, creating (D,A)? yes
* $s=C$, $p=F$, creating (F,C)? no
* $s=C$, $p=D$, creating (D,A)? no
* **picking C**
* $s=B$, $p=A$, creating (A,B)? yes
* $s=B$, $p=D$, creating (D,B)? no
* $s=B$, $p=E$, creating (E,B)? yes
* $s=B$, $p=F$, creating (F,B)? no
* $s=E$, $p=A$, creating (A,E)? yes
* $s=E$, $p=B$, creating (B,E)? yes
* $s=E$, $p=D$, creating (D,E)? yes
* $s=E$, $p=F$, creating (F,E)? yes
* **picking D**
* $s=A$, $p=E$, creating (E,A)? no
* $s=B$, $p=E$, creating (E,B)? no
* $s=C$, $p=E$, creating (E,C)? no
* $s=E$
* $s=F$, $p=E$, creating (E,F)? no
* **picking E**
* $s=A$, $p=B$, creating (B,A)? no
* $s=A$, $p=C$, creating (C,A) ? yes
* $s=A$, $p=D$, creating (D,A)? no
* $s=A$, $p=F$, creating (F,A)? no
* $s=B$, $p=A$, creating (A,B)? no
* $s=B$, $p=C$, creating (C,B)? no
* $s=B$, $p=D$, creating (D,B)? no
* $s=B$, $p=F$, creating (F,B)? no
* $s=C$, $p=A$, creating (A,C)? no
* $s=C$, $p=B$, creating (B,C)? no
* $s=C$, $p=D$, creating (D,C)? no
* $s=C$, $p=F$, creating (F,C)? no
* $s=D$, $p=A$, creating (A,D)? yes
* $s=D$, $p=B$, creating (B,D)? yes
* $s=D$, $p=C$, creating (C,D)? yes
* $s=D$, $p=F$, creating (F,D)? yes
* $s=F$, $p=A$, creating (A,F)? yes
* $s=F$, $p=B$, creating (B,F)? yes
* $s=F$, $p=C$, creating (C,F)? yes
* $s=F$, $p=D$, creating (D,F)? no
* $s=F$
* **picking F**
* done
</div></div>