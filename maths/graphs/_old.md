# Advanced Terminology

* [Graph matching](terms/matching.md)
* [Independent set](terms/independence.md)

What you learned here is very similar to the notion of an independent set. In fact, you can use Grundy to find a coloration. I do not know why we learned those separately. Look for [Grundy number or Grundy chromatic number](https://en.wikipedia.org/wiki/Grundy_number).

A graph coloring problem could be something like "A, B, C, D, E" must pass some tests, but they can't be in the same room for the same test. We are giving you a table of which tests they are passing, and your goal is to find the minimum of rooms needed. You can also have a similar problem like "A, B, C, D, E" can't be in the same room (you got a table of which one can't be with which one) and you have to find at least how many rooms are needed (make a graph of which can't be with which and solve it).

<hr class="sl">

## The shortest path problem

You have 4 algorithms explained here (out of 6)

* [Dijkstra's algorithm](sp/dijkstra.md)
* [Bellman–Ford algorithm](sp/bellman-ford.md)
* [Distance and Diameter](sp/distance.md)