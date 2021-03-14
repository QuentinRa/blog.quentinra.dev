========================
Algorithme de Dijkstra
========================

Soit un graphe pondéré G avec des poids ayant des valeur positives uniquement,
alors Dijkstra donne le plus court chemin partant d'un sommet
A pour atteindre un sommet B en complexité :math:`O(n^2)`.

.. code:: none

	On prends tous nos sommets, on leur donne une distance depuis l'initial
		initial à lui-même : 0
		initial aux autres : inconnu donc infini

	Tant qu'on n'a pas marqué tous les sommets
		On prends le sommet I ayant la plus petite distance.
		On met à jour la distance de ses voisins avec I(son_prix+prix_voisin) seulement
		si elle est plus petite.
		On marque le sommet I.

Exemple d'application

.. graphviz::

	digraph {
		size="10,8";
  	rankdir="LR";
		A -> B [ label="10" ];
		A -> E [ label="5" ];
		B -> E [ label="2" ];
		B -> C [ label="1" ];
		C -> D [ label="4" ];
		D -> A [ label="7" ];
		D -> C [ label="6" ];
		E -> D [ label="2" ];
		E -> B [ label="3" ];
		E -> C [ label="9" ];
  }

================ ================ ================ ================ ================ ================ =============
Étape            A                B                C                D                E                Marqué
================ ================ ================ ================ ================ ================ =============
0                0                :math:`+\infty`  :math:`+\infty`  :math:`+\infty`  :math:`+\infty`  A
1                \-               A(10)            :math:`+\infty`  :math:`+\infty`  A(5)             E
2                \-               E(8)             E(14)            E(7)             \-               D
3                \-               E(8)             D(13)            \-               \-               B
4                \-               \-               B(9)             \-               \-               C
================ ================ ================ ================ ================ ================ =============

Chemin le plus court de A-B : B-E-A (on part de la dernière valeur dans la colonne de B, on retourne dans E, pareil ..., jusqu'à A).