# Graphviz

<div class="row row-cols-md-2"><div>

[Graphviz](https://graphviz.org/) is a popular tool to  generate graphs.

```shell!
$ sudo apt-get install graphviz
$ dot -c  # once, initialize graphviz
```

* [Graphviz Documentation](https://graphviz.org/)
* [Graphviz Examples](https://graphs.grevian.org/example)
* [Graphviz Online](https://dreampuf.github.io/GraphvizOnline/)

</div><div>

A short complete example:

```js!
digraph {
    size="10,8";
    rankdir="LR";
    "Bourse" -> "Opéra" [ label="5" ];
    a [style=filled,color=red];
    a -> b [arrowhead = none];
    d -> k;
}
```
</div></div>