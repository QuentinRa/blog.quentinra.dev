# Lists

If needed, Cypher got support for lists, allowing you to do a lot of things as you could do in Python.

<div class="row row-cols-md-2 mx-0"><div>

* `range(min,max)`: returns a list of values [min, max]
* `head(list)`: return the first element
* `tail(list)`: remove the list without the head
* `size(list)`: size of a list
* `reverse(list)`: reverse a list
</div><div>

* `[x in range(0,5)|x]`: returns [0,1,2,3,4,5]
* `[x in range(0,5) WHERE x+2<5 |x^2]`: returns [0,1,4]
  * only 0,1,2 are passing the criteria `x+2<5`
  * then we are evaluating each value as `x^2`

</div></div>

<details class="details-e">
<summary>Indexes of your list ✨</summary>

* `list[0]`: first element
* `list[-1]`: last element
* `list[1..3]`: list of `list[1]`+`list[2]`
* `list[..3]`: list of `list[0]`+`list[1]`+`list[2]`
* `list[0..]`: list of `list[0]`+`list[1]`+...
</details>

Example

```cypher
// almost copied from the documentation
// return the list of the release dates for the movies linked to "Keanu Reeves"
MATCH (a:ShowbizPerson {name: 'Keanu Reeves'})
RETURN [(a)-->(b) WHERE b:Movie | b.released] AS years
````