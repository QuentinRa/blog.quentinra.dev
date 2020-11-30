====================================================
3. Tris et parcours - Parcours en profondeur
====================================================

Parcours en profondeur (DFS : depth-first search)

Dans l'idée on parcours entièrement une branche, puis on revient aux intersections
et on parcours entièrement une autre branche jusqu'à avoir tout parcouru.

	.. code-block::

		1: On prends un sommet au hasard, on l'empile.
		2: On prends un voisin, on l'empile tant que possible.
		3: On marque le sommet bloquant "fini", on recommence avec 2: si possible
			sinon on fait 3:
