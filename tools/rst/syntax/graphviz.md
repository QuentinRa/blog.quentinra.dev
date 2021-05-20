# Graphviz

[Go back](..)

You can draw some graph using ``Graphviz``.

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

If you
do install it (<https://graphviz.org/>), then on Windows
be sure to

* add it to the path
* run only one ``dot.exe -c`` or `dot -c`