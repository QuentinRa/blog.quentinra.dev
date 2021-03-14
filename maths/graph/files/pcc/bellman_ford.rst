===========================
Algorithme de Bellman-Ford
===========================

Soit un graphe pondéré G avec des poids ayant une valeur positives ou négatives,
alors Bellman-Ford donne le plus court chemin partant d'un sommet
A pour atteindre un sommet B en complexité :math:`O(n*m)`.

L'algorithme donne le résultat après au plus \|V\|-1 passages cependant
si après un passage rien ne change, alors l'algorithme est terminé.

.. code:: none

	(On fait une liste des arrêtes si vous ne voulez pas oublier des arêtes)
	On choisi un sommet de départ, distance = 0, les autre +infini.

	Tant que pas fait |V|-1 passages ou aucun changements
			Pour chacune des arrêtes (A,B), on calcule la distance.
				Si on a déjà la distance pour aller à A, alors distance = d(A) + d(A,B)
				donc on utilise les distances calculées juste avant.
				On ne remplace une distance que si elle est plus petite.

			On remplace ensuite la distance de tous les sommets donc d(A) pour A par les
			valeurs calculées juste avant et on recommence

Exemple d'application 1

.. graphviz::

	digraph {
		size="10,8";
  	rankdir="LR";
		E -> A [ label="3" ];
		E -> B [ label="2" ];
		A -> B [ label="-2" ];
		A -> C [ label="4" ];
		B -> C [ label="5" ];
		B -> D [ label="4" ];
		C -> D [ label="2" ];
		C -> S [ label="2" ];
		D -> A [ label="-1" ];
		D -> S [ label="2" ];
  }

================ ================ ================ ================ ================ ================ ===============
Étape            A                B                C                D                E                S
================ ================ ================ ================ ================ ================ ===============
0                :math:`+\infty`  :math:`+\infty`  :math:`+\infty`  :math:`+\infty`  0                :math:`+\infty`
1                E(3)             E(2)             A(7)             B(5)             -                C(8)
1                -                A(1)             B(6)             C(4)             -                D(6)
2                -                -                -                -                -                -
================ ================ ================ ================ ================ ================ ===============

Exemple d'application 2

.. graphviz::

	digraph {
		size="10,8";
  	rankdir="LR";
		A -> B [ label="6" ];
		A -> C [ label="4" ];
		A -> D [ label="5" ];
		B -> E [ label="-1" ];
		C -> B [ label="-2" ];
		C -> E [ label="3" ];
		D -> C [ label="-2" ];
		D -> F [ label="-1" ];
		E -> F [ label="3" ];
  }

================ ================ ================ ================ ================ ================ ===============
Étape            A                B                C                D                E                F
================ ================ ================ ================ ================ ================ ===============
0                0                :math:`+\infty`  :math:`+\infty`  :math:`+\infty`  :math:`+\infty`  :math:`+\infty`
1                \-               A(6)             A(4)             A(5)             B(5)             D(4)
1-bis            \-               C(2)             \-               \-               D(3)             \-
2                \-               C(1)             D(3)             \-               B(1)             \-
3                \-               \-               \-               \-               B(0)             E(3)
================ ================ ================ ================ ================ ================ ===============

