================================
Tableaux
================================

Niveau débutant
***********************

1/6 Remplissage
-----------------

Écrivez un programme qui déclare un tableau de 10 cases de type int, puis le remplit
avec des valeurs choisies aléatoirement entre -50 et 50, et enfin affiche le contenu du tableau.

.. code:: none

		./a.out
		+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
		|  12 |   0 | -49 |  35 |   8 |  -2 |  50 |  33 | -40 |  -1 |
		+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/d1>

| :code:`[TAG] IUTSF APL S1 TP9 2019`

2/6 Maximum
-----------------

Modifiez le programme de l'exercice précédent pour qu'il identifie le plus grand élément du tableau

.. code:: none

		./a.out
                                           |
                                           V
		+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
		|  27 | -33 | -12 | -37 |  48 |  -7 |   0 | -50 |  -3 | -13 |
		+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/d2>

| :code:`[TAG] IUTSF APL S1 TP9 2019`

3/6 Recherche
-----------------

Modifiez le programme du premier exercice pour qu'après l'affichage du tableau, l'utilisateur puisse entrer une
valeur. Le programme affichera alors le plus petit indice où on peut trouver cette valeur dans le tableau
(ou -1 si la valeur ne s'y trouve pas).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/d3>

| :code:`[TAG] IUTSF APL S1 TP9 2019`

4/6 Miroir
-----------------

Modifiez le programme du premier exercice pour qu'il inverse l'ordre des valeurs du tableau.
Vous afficherez le tableau avant et après inversion pour vérifier votre travail.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/d4>

| :code:`[TAG] IUTSF APL S1 TP9 2019`

5/6 Filtre
-----------------

Reprenez le programme du premier exercice. Après avoir affiché le tableau,
retirez-en toutes les valeurs négatives (sans changer l'ordre des autres valeurs) puis affichez-le à nouveau.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/d5>

| :code:`[TAG] IUTSF APL S1 TP9 2019`

6/6 Circulation
-----------------

Modifiez le programme du premier exercice pour qu'il avance les valeurs du tableau de 4 (4 est une constante
pouvant être modifiée) indices
(les valeurs à la fin se retrouveront au début). Vous afficherez le tableau avant
et après permutation pour vérifier votre travail.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/d6>

| :code:`[TAG] IUTSF APL S1 TP9 2019`

Niveau supérieur
***********************

1/5 Progressions
---------------------------

Écrivez un programme où les tableaux t1, t2 et t3 contiennent les valeurs suivantes :

.. image:: /assets/imperative/c/exercice/tab1s.png

Utilisez des boucles (pas des listes) pour placer ces valeurs dans les tableaux.
Affichez les tableaux les uns au-dessus des autres. Puis affichez-les à nouveau, en inversant lignes et colonnes.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/s1>

| :code:`[TAG] IUTSF APL S1 TP10 2019`

2/5 Horizontal
------------------

Reprenez l'exercice précédent, et cette fois affichez les tableaux côte-à-côte (comme sur la figure ci-dessus).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/s2>

| :code:`[TAG] IUTSF APL S1 TP10 2019`

3/5 Triangle
------------------

Écrivez un programme qui place dans un tableau à deux dimensions un triangle de Pascal de hauteur 30 puis l'affiche.

.. code:: none

		 1
		 1   1
		 1   2   1
		 1   3   3   1
		 1   4   6   4   1
		 1   5  10  10   5   1
		 1   6  15  20  15   6   1
		 ...

On rappelle la relation de récurrence :

.. image:: /assets/imperative/c/exercice/tab3s.png

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/s3>

| :code:`[TAG] IUTSF APL S1 TP10 2019`

4/5 Balayage
------------------

Reprenez l'exercice précédent, en utilisant cette fois un tableau à une seule dimension.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/s4>

| :code:`[TAG] IUTSF APL S1 TP10 2019`

5/5 Magique
------------------

Un carré magique est une grille de trois lignes et trois colonnes contenant tous les chiffres de 1 à 9.
Si on additionne les trois chiffres sur une ligne, une colonne ou une diagonale, on obtient toujours la même valeur.

.. code:: none

		8  3  4
		1  5  9
		6  7  2

Écrivez un programme qui demande à l'utilisateur la valeur à mettre dans chacune des neuf cases, puis indique si le carré est magique. On s'attachera à vérifier que :

	* chaque valeur est comprise entre 1 et 9,
	* aucune valeur n'est répétée,
	* les sommes des lignes sont identiques,
	* les sommes des colonnes sont identiques (à la somme trouvée plus haut),
	* les sommes des diagonales sont identiques (à la somme trouvée plus haut).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<tab/s5>

| :code:`[TAG] IUTSF APL S1 TP10 2019`

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)