================================
Étude des degrés
================================

Niveau débutant
***********************

1/3 Quelques graphes simples
-----------------------------------

Décrivez le degré des nœuds

	* dans une clique de taille K ?
	* dans un cycle de taille C ?
	* dans un arbre ?
	* dans un chemin ?
	* dans une grille ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<voisins/d1>
	Proposition de correction n°1			<voisins/d1_2>

2/3 Propriété des degrés
-----------------------------------

On veut montrer que, dans
un réseau social, la plupart des gens ont l’impression d’avoir moins d’amis que leurs amis. On
représente le réseau par un graphe non orienté avec n nœuds (les gens) et m arêtes (les liens
d’amitiés).

1. \
	Montrer que la moyenne du nombre d’amis d’une personne est :math:`\frac{2m}{n}`

2. \
	On considère la liste contenant, pour chaque personne, pour chaque ami de cette personne, le
	nombre d’amis de cet ami. Montrer que la moyenne de cette liste, i.e. la moyenne du nombre
	d’amis d’un ami, est :math:`\frac{\sum_{v \in V}^{} deg(v)^2}{2m}`

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<voisins/d2>

3/3 Graphe dense et chemin
-----------------------------------

Soit G un graphe où chaque nœud a au moins un degré d. Montrer qu’il existe une chaîne avec
d + 1 nœuds dans G.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<voisins/d3>

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
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)