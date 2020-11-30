====================================================
3. Tris et parcours - Parcours en largeur
====================================================

Parcours en largeur (BFS : breadth-first search)

Dans l'idée, on prends un sommet au hasard, on marque ses voisins, puis on fait pareils pour
les voisins jusqu'à avoir tout marqué.

	.. code-block::

		1: On prend un sommet au hasard qu'on marque, et on note ses sauvegarde ses voisins
		2: On marque les voisins sauvegardés puis on garde leurs voisins non marqués et on recommence
			 tant qu'il reste des sommets avec des voisins non marqués.