================================
Fermeture transitive
================================

Niveau débutant
***********************

1/3 Fermeture transitive et :math:`\tau`-équivalence
-----------------------------------------------------

1. \
	Dessinez la fermeture transitive des graphes suivants

.. image:: /assets/math/graph/exercice/t1.png

2. \
	Ajouter aux graphes :math:`G'` et :math:`G''` des arcs tels que :math:`G'` et :math:`G''`
	sont :math:`\tau`-minimal :math:`\tau`-équivalence
	à G et :math:`G''` possède strictement moins d'arc que :math:`G'`.

.. image:: /assets/math/graph/exercice/t1_2.png

3. \
	Montrez que G est fortement connexe si et seulement si le circuit :math:`(x_1, x_2, x_3; ..., x_n)` est
	:math:`\tau`-équivalent à G, où les :math:`x_i` sont les nœuds de G.

4. \
	Montrez que la question 3 est fausse si on remplace :math:`\tau`-équivalent par :math:`\tau`-minimal :math:`\tau`-équivalent

5. \
	Montrez qu'un circuit élémentaire est :math:`\tau`-minimum :math:`\tau`-équivalent à lui-même.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<transitive/d1>

| :code:`[TAG] ENSIIE MTG TD2 2020 S1`

2/3 :math:`\tau`-équivalence et graphes réduits
--------------------------------------------------

.. image:: /assets/math/graph/exercice/t2.png

1. \
	Calculez les fermetures transitives des graphes :math:`G_1` et :math:`G_2`.

2. \
	Calculez les graphes réduits :math:`G_{1r}` et :math:`G_{2r}` de :math:`G_1` et :math:`G_2`.

3. \
	Calculez les fermetures transitives des graphes :math:`G_{1r}` et :math:`G_{2r}`.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<transitive/d2>

| :code:`[TAG] ENSIIE MTG TD2 2020 S1`

3/3 Calculer la fermeture transitive d'un graphe
--------------------------------------------------

1. \
	Décrire en français un algorithme calculant la fermeture transitive d'un graphe en utilisant
	les algorithmes de parcours de graphe.
2. \

	1. \
		Soit A la matrice d'adjacence d'un graphe G. Que représente :math:`A^p` ?

	2. \
		Soit B la matrice A avec des 1 sur la diagonale. Que représente :math:`B^p`.

	3. \
		Décrire un algorithme en français utilisant les puissances de la matrice A ou
		de B pour calculer la fermeture transitive d'un graphe

3. \

	1. \
		Testez l'algorithme de Roy-Warshall sur le graphe suivant

		.. image:: /assets/math/graph/exercice/t3.png

	2. \
		Quelle est la complexité de cet algorithme ?

	3. \
		Re-décrire l'algorithme en utilisant la matrice d'adjacence de G.

	4.
		Testez l'algorithme sur le graphe décrit par la matrice suivante :

		.. math::

			\begin{pmatrix}0&1&1&0\\1&0&0&1\\0&0&0&1\\0&1&0&0\end{pmatrix}


.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<transitive/d3>

| :code:`[TAG] ENSIIE MTG TD2 2020 S1`

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