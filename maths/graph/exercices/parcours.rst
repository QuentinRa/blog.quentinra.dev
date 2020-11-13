================================
Parcours de graphes
================================

Niveau débutant
***********************

1/1 Parcours en profondeur et en largeur
------------------------------------------

.. graphviz::

	digraph {
			size="10";
  		rankdir="LR";
      h -> i [arrowhead = none];
      i -> j [arrowhead = none];
      i -> g [arrowhead = none];
      j -> e [arrowhead = none];
      e -> b [arrowhead = none];
      e -> a [arrowhead = none];
      k -> b [arrowhead = none];
      b -> a [arrowhead = none];
      a -> f [arrowhead = none];
      f -> g [arrowhead = none];
      g -> d [arrowhead = none];
      d -> k [arrowhead = none];
      d -> b [arrowhead = none];
      d -> c [arrowhead = none];
   }

1. \

	| 1.1 Appliquer l’algorithme de parcours en profondeur au graphe ci-dessus en partant du nœud de votre choix.
	| 1.2  Pourquoi pouvez-vous affirmer que ce graphe est connexe ?
	| 1.3 Quelle est la complexité de l’algorithme ?

2. \

	| 2.1 Appliquer l’algorithme de parcours en largeur au graphe ci-dessus en partant du nœud de votre choix.
	| 2.2 Pourquoi pouvez-vous affirmer que ce graphe est connexe ?
	| 2.3 Quelle est la complexité de l’algorithme ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<parcours/d1>

| :code:`[TAG] ENSIIE MTG TD1 2020 S1`

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