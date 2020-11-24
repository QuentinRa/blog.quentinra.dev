================================
Coloration de graphe
================================

Niveau débutant
***********************

1. Quelques bornes
--------------------------

On note :math:`\chi(G)` le nombre chromatique de G.

1. \
	Quel est le nombre chromatique d’un cycle élémentaire ? D’un graphe biparti ?

2. \
	Soit G0 un graphe partiel de G. Quelle relation peut-on établir entre les nombres chromatiques
	de ces graphes ? En déduire que si la taille d’une clique maximum de G est :math:`\omega(G)` alors
	:math:`\chi(G) \ge \omega(G)`

3. \
	Soit G un graphe d’ordre n, avec :math:`\alpha(G)` la taille du plus grand stable de G. Prouver que :

		* :math:`\chi(G) * \alpha(G) > n`
		* :math:`\chi(G) + \alpha(G) \le n+1`

4. \
	Montrer qu’il existe des graphes qui sont 4-coloriables et qui ne sont pas planaires.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<coloration/d1>

| :code:`[TAG] ENSIIE MTG TD8 2020 S1`

2. Orientation
-----------------

Soit G un graphe et k un entier strictement positif. Montrer que si G est k-colorable alors il
existe une orientation des arêtes de G qui soit sans circuit et telle que tout chemin est de longueur
inférieure ou égale à k.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<coloration/d2>

| :code:`[TAG] ENSIIE MTG TD8 2020 S1`

3. Graphe planaire
-----------------------

Décrire un algorithme simple qui, connaissant un graphe planaire G, renvoie un entier k égal
soit à :math:`\chi(G)`, soit à :math:`\chi(G)+1`.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<coloration/d3>

| :code:`[TAG] ENSIIE MTG TD8 2020 S1`

4. Algorithme glouton
-------------------------

1. \
	Appliquer l’algorithme glouton de coloration de Welsh Powell sur le graphe suivant et vérifier
	que le nombre de couleurs obtenu est inférieur ou égal à la borne k où k est le numéro du
	dernier sommet vérifiant :math:`k \le d_k + 1`.

2. \
	En utilisant les différentes bornes connues du nombre chromatique, peut-on dire si la coloration
	obtenue est optimale ?

.. image:: /assets/math/graph/exercice/coloration4.png

| :code:`[TAG] ENSIIE MTG TD8 2020 S1`

5. Reliement contraction
----------------------------------

Appliquez l’algorithme de reliement contraction sur le graphe suivant.

.. image:: /assets/math/graph/exercice/coloration5.png

| :code:`[TAG] ENSIIE MTG TD8 2020 S1`

6. Planning
---------------------

Cinq étudiant doivent passer certaines épreuves d’examen. On désire que tous les étudiants qui
doivent subir une même épreuve le fassent simultané- ment. Chaque étudiant ne peut se présenter
qu’à une épreuve au plus chaque jour.

Voici la liste des épreuves que doit passer chaque étudiant :

	* Étudiant A : Français, Anglais, Mécanique
	* Étudiant B : Anglais, Solfège
	* Étudiant C : Dessin, Histoire des arts, Mécanique
	* Étudiant D : Dessin, Histoire des arts
	* Étudiant E : Solfège

Modéliser ce problème par un problème de coloration des noeuds. Dans quel cas ce problème peut
être modélisé par une coloration d’arête ? En déduire que le nombre minimum de jours d’examen
est 3 ou 4.

| :code:`[TAG] ENSIIE MTG TD8 2020 S1`

7. Coloration de Sudoku
-------------------------

Modéliser un problème de sudoku classique par un problème de coloration d’un graphe que l’on
déterminera.

| :code:`[TAG] ENSIIE MTG TD8 2020 S1`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)