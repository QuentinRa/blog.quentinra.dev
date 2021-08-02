# Transitive closure

[Go back](..#advanced-terminology)

The transitive closure or ``Fermeture transitive``
noted $\tau$ (tau) is made by adding all the edges that
can be deduced by transitivity.

For instance, if we have $(a,b)$ and $(b,c)$, then we will
create $(a,c)$ if $(a,c)$ does not exists. This is a simple
example but sometimes it could be like
$(a,b)-(b,c)-(c,d)-...-(y-,z)$ then we create $(a,z)$ ...

**Roy–Warshall algorithm** (also called Floyd–Warshall)

* for each vertex $V$
  * for each predecessor of $V$, $p$
    * for each successor of $V$, $s$
      * create $(p,s)$ if $(p,s)$ does not exists

<hr class="sl">

## Example (Roy-Warshall algorithm)

Apply Roy-Warshall algorithm on

![](images/tc1.png)

<blockquote class="spoiler">

* **picking** A
* $p=C$, $s=B$, creating (C, B)? yes 
* **picking** B
* $p=A$, $s=D$, creating (A, D)? yes
* $p=A$, $s=C$, creating (A, C)? yes
* $p=C$, $s=D$, creating (C, D)? yes
* **picking** C
* $p=B$, $s=A$, creating (B, A)? yes
* $p=A$, $s=B$, creating (A, B)? no
* **picking** D
* done
</blockquote>