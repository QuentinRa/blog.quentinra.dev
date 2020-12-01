================================
Bases de cycles et cocycles
================================

Niveau débutant
***********************

1. Arbre couvrant et base de cycle
-------------------------------------

Soit G le graphe suivant :

.. image:: /assets/math/graph/exercice/a1d.png

Donner un arbre couvrant T de G tel que la base de cycle associée corresponde à l’ensemble
des faces finies de G.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<arbres/d1>

| :code:`[TAG] ENSIIE MTG TD9 2020 S1`

2. Conception d’un réseau de transmission de données
-----------------------------------------------------------------

Une banque désire installer au moindre coût un réseau de transmissions de données entre son
agence centrale située dans le quartier de la Bourse à Paris et sept de ses succursales. Le coût de
construction d’une ligne entre deux agences est donné par le tableau suivant

.. image:: /assets/math/graph/exercice/a2d.png

Modélisez ce problème par un problème de graphe et résolvez le.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<arbres/d2>

| :code:`[TAG] ENSIIE MTG TD9 2020 S1`

3. Quelques propriétés des arbres
-----------------------------------------------------------------

1.
	Montrer que tout arbre avec 2 (au moins) sommets admet au moins deux sommets pendants (i.e. de
	degré 1).
2.
	Démontrer que tout graphe connexe d’au moins deux sommets admet au moins deux sommets
	qui ne sont pas des points d’articulation.
3.
	Donner un graphe qui n’a que deux sommets qui ne sont pas des points d’articulation (.

| :code:`[TAG] ENSIIE MTG TD9 2020 S1`

4. Connexité du graphe des arbres couvrant
-----------------------------------------------------------------

Soit G = (V,E) un graphe non orienté et T l’ensemble des arbres couvrant de G. Soit H =
:math:`(T, E_H)` le graphe où

		*
			les nœuds sont des arbres couvrants de G
		*
			une arête relie deux noeuds de H correspondant aux arbres couvrant T1 et T2 de G si et
			seulement si toutes les arêtes de T1 et T2 sauf une sont identiques.

1. Dessinez H quand G est le graphe suivant

.. image:: /assets/math/graph/exercice/a4d.png

| :code:`[TAG] ENSIIE MTG TD9 2020 S1`

2. Montrer que H est connexe.

5. Algorithme de Prim
-----------------------

L’algorithme de Prim trouvant un arbre couvrant de poids minimum est
dans le cours.

1. Appliquez l’algorithme sur le graphe suivant

.. image:: /assets/math/graph/exercice/a5d.png

2.
	Soit :math:`T_i` l’arbre T au début de l’itération i et e l’arête choisie pendant l’itération i. Soit :math:`T_i`
	l’ensemble des arbres couvrant de G contenant :math:`T_i`. Montrer qu’il existe un arbre de :math:`T_i`, de
	poids minimum et contenant e.

3.
	En déduire que l’algorithme de Prim renvoie un arbre couvrant de poids minimum.

| :code:`[TAG] ENSIIE MTG TD9 2020 S1`

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