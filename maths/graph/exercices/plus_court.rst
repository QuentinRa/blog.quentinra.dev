================================
Plus court chemin
================================

Niveau débutant
***********************

1. Algorithme de Dijkstra
--------------------------

Soit G le graphe suivant

.. image:: /assets/math/graph/exercice/ordo1.png

1. Dessinez un arbre des plus courts chemins de S vers les autres nœuds.
2. Dans quel ordre l’algorithme de Dijkstra énumérerait les nœuds du graphe ?
3. Appliquez l’algorithme pour calculer les poids des plus courts chemins de S vers les autres nœuds.
4. Comment modifier l’algorithme pour reconstruire les plus court chemins ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<plus_court/d1>

| :code:`[TAG] ENSIIE MTG TD10 2020 S1`

2. Algorithme de Ford-Bellman
----------------------------------

1.
	Soit G un graphe avec les arcs pondérés et s un nœud de ce graphe. Soit :math:`d^k(u)` le poids
	d’un plus court chemin de s vers u utilisant au plus k arcs. Montrer qu’il existe u tel que
	:math:`d^{n-1}(u) > d^n(u)` si et seulement s’il existe circuit absorbant dans le graphe.

2. Appliquer l’algorithme de Ford-Bellman au graphe suivant :

.. image:: /assets/math/graph/exercice/ordo2.png

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<plus_court/d2>

| :code:`[TAG] ENSIIE MTG TD10 2020 S1`

3. Recharger les batteries
-------------------------------------

Un petit robot se déplace sur une grille. Lorsqu’il arrive sur une case, il peut aller tout droit,
à droite ou à gauche mais ne peut pas revenir en arrière. Il ne peut pas tomber du plateau. S’il
ne se déplace pas il consomme de l’énergie : 1 joule par seconde. S’il se déplace d’une case à une
autre, il consomme 2 joules d’énergie. Il peut également recevoir 3 joules par le biais de chargeur
sans fil à induction. On sait à l’avance où sont placés les chargeurs. Le robot part d’une extrémité
de la grille avec une batterie à moitié pleine mais suffisante pour se déplacer au moins une fois sur
chaque case du plateau. On veut déterminer si le robot peut complètement recharger sa batterie.

Modéliser ce problème par un problème de graphe.

| :code:`[TAG] ENSIIE MTG TD10 2020 S1`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Massimissa MERABET (enseignant à l'ENSIIE)
	* Dimitri WATEL (enseignant à l'ENSIIE)