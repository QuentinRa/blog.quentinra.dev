# Graphviz

[Go back](..#writing-rst-documents)

You can draw some graphs using `Graphviz`.

```rest
.. graphviz::

	digraph {
		size="10,8";
        rankdir="LR";
        "Bourse" -> "Opéra" [ label="5" ];
            a [style=filled,color=red];
        a -> b [arrowhead = none];
	}
```

You will have to install it (<https://graphviz.org/>), then on Windows be sure to

* add it to the path
* run only one time `dot.exe -c` or `dot -c` to configure it