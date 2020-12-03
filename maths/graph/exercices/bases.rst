================================
Bases de cycles et cocycles
================================

Niveau débutant
***********************

1. Rechercher des bases
---------------------------

.. image:: /assets/math/graph/exercice/b1d.png

1. \
	(a) Donner les vecteurs associés aux cycles (bcfb) et (abfeda).
	(b) Montrer que le cycle (bcfb) est combinaison linéaire de deux autres cycles que l’on déterminera.
	(c) Combien d’éléments comporte une base de cycles de G?
	(d) Donner une base de cycles de G qui ne contient ni (b c f b) ni (abfeda).
	(e) Exprimer (abfeda) en fonction de la base calculée à la question précédente.
2. \
	(a) Donner les vecteurs associés aux cocycles (abf) et (ae).
	(b) Montrer que le cocycle (ae) est combinaison linéaire de deux autres cocycles que l’on déterminera.
	(c) Combien d’éléments comporte une base de cocycles de G?
	(d) Donner une base de cocycles de G qui ne contient aucun cocycle réduit à un noeud.
	(e) Exprimer (abf) en fonction de la base calculée à la question précédente.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<bases/d1>

| :code:`[TAG] ENSIIE MTG TD6 2020 S1`

2. Orthogonalité des cycles et des cocycles
------------------------------------------------------

1.\
	Dans le graphe G suivant, donner les vecteurs de cycle :math:`\mu(abcfeda)` et :math:`\mu(bdefb)` et les vecteurs
	de cocycle :math:`\nu(ac)` et :math:`\nu(bdef)`. Vérifiez que les deux premiers vecteurs sont chacun orthogonaux
	aux deux derniers.

.. image:: /assets/math/graph/exercice/b2d.png

2. \
	Soit v un nœud d’un graphe G = (V,E) et c un cycle ne contenant pas v. Montrer que
	:math:`\nu(v) \perp \nu(c)`.

3. \
	Soit v un nœud d’un graphe G = (V,E) et c un cycle contenant v. Montrer que :math:`\nu(v) \perp \nu(c)`.

4. \
	Soit un graphe G = (V,E) avec p composantes connexes et :math:`(v_1,v_2, ..., v_p)` des nœuds de G,
	un par composante. Montrer que :math:`(\mu(u), u \in V\ privé\ de\ (v_1,v_2, ..., v_p))` est une base de cocycles
	de G.

5. \
	En déduire que, dans un graphe G, tous les cocycles de G sont orthogonaux à tous les cycles
	de G.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<bases/d2>

| :code:`[TAG] ENSIIE MTG TD6 2020 S1`

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