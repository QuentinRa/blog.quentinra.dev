# Spanning subgraph

[Go back](..#advanced-terminology)

A spanning subgraph or `Graphe partiel/Sous-graphe couvrant` $G'$ of a graph $G$ is a graph 

* $V_{G'} = V_G$: having the same vertices
* $E_{G'}\ \subset\ E_G$: $G'$ edge set is a subset of $G$ edge set

<hr class="sl">

## $\tau$-equivalent

$G$ and $G'$ are said to be $\tau$-equivalent (read as tau-equivalent) if

* they have the same transitive closure
* $G'$ is a subgraph of $G$

<hr class="sr">

## $\tau$-minimal $\tau$-equivalent

Let $G'$ be a $\tau$-equivalent of $G$. $G'$ is $\tau$-minimal $\tau$-equivalent if removing one edge make it lose the $\tau$-equivalent property.

Note: you can replace minimal by maximal and removing by adding.

<hr class="sl">

## $\tau$-minimum $\tau$-equivalent

Let graph $G'$ be $\tau$-equivalent$\tau$-minimal $\tau$-equivalent of $G$. If we can't find a graph $G'$ with a lesser number of edges while still being $\tau$-minimal $\tau$-equivalent, then $G'$ is $\tau$-minimum $\tau$-equivalent.

Note: you can replace minimum by maximum, minimal by maximal, and lesser by bigger.

<hr class="sr">

## Example 1

Given the graph $G$, make it so that

* $G'$: $\tau$-minimal $\tau$-equivalent
* $G''$: $\tau$-minimum $\tau$-equivalent

![Example 1 - graphs](images/partial/partial1.png)

<blockquote class="spoiler">

![Example 1 - answer](images/partial/partial1-ans.png)

That isn't the only answer, but you should check that each of your answers

* is a subgraph of $G$
* the transitive closing is equals to $G$ (since G is complete)
</blockquote>

<hr class="sl">

## Example 2

Same for

![Example 2 - graphs](images/partial/partial2.png)

<blockquote class="spoiler">

![Example 2 - answer](images/partial/partial2-ans.png)
</blockquote>
