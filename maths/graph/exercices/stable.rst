================================
Stabilité
================================

Niveau débutant
***********************

1/3 Stabilité
------------------------

Soit G le graphe suivant :

.. image:: /assets/math/graph/exercice/s_d1.png

Les poids associés aux sommets sont p(a) = 3, p(b) = 2, p(c) = 2, p(d) = 4, p(e) = 1, p(f) = 1
et p(h) = 1.

1. Donnez un stable maximal de G
2. Donnez un stable maximum de G
3. Donnez un stable de poids maximum de G

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<stable/d1>

2/3 Clique et stable
------------------------

.. image:: /assets/math/graph/exercice/s_d2.png

1. \
	Déterminez, dans G, une clique maximale, une clique maximum et une partition de G en 3
	cliques

2. \
	Montrer que trouver une clique dans un graphe est équivalent à trouver un stable dans un
	autre graphe que l’on déterminera. Donnez un exemple avec G.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<stable/d2>

3/3 Stable maximum sous forme d’équations
---------------------------------------------

Soit P le problème suivant :

.. math::

		\begin{cases}
		Max \ t + u + v + w + x + y + z\\
		s.c.\\
		\ \ \ \ \ \ \ \ \ \ x + y + z \le 1\\
		\ \ \ \ \ \ \ \ \ \ z + t + u \le 1\\
		\ \ \ \ \ \ \ \ \ \ x + v \le 1\\
		\ \ \ \ \ \ \ \ \ \ t + w \le 1\\
		\ \ \ \ \ \ \ \ \ \ t, u, v, w, x, y, z \in \{0,1\}
		\end{cases}

1. \
	Montrer que ce problème est équivalent à la recherche d’un stable de cardinal maximum dans
	un graphe G que l’on déterminera.

2. \
	Trouver une solution optimale de P.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<stable/d3>

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