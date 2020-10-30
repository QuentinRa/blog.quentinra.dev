.. _bric:

================================
Bric à Brac
================================

Coefficient binomial
***********************

:math:`\begin{pmatrix}n \\k\end{pmatrix}` = k parmi n = :math:`C^k_n` = :math:`\frac{n!}{k! (n-k)!}`

.. hint::

	| :math:`C^1_n = n`
	| :math:`C^2_n = \frac{n(n-1)}{2}`

Étude de fonctions d'une variable réelle
******************************************

Voici comment étudier une fonction dans :math:`\mathbb{R}`.

============================== ==========================
Propriété				               Outils
============================== ==========================
continue											 Ensemble de définition

limites, asymptotes						 symétrie, périodicité, ensemble de dérivation [#3]_

tangente                       dérivée, monotonie

extrema                        extrema (min/max) et convexité (monte vite ?)
============================== ==========================

.. [#3] souvent on dérive et on regarde après

* :code:`symétrie` : :math:`f(x_0 - h) = f(x_0 + h)`
* :code:`symétrie centrale` : :math:`y_0 - f(x_0 - h) = f(x_0 + h) - y_0`
* :code:`asymptote verticale` : :math:`\lim_{x \rightarrow a}f(x) = \pm \infty`
* :code:`asymptote horizontale` : :math:`\lim_{x \rightarrow +\infty}f(x) = a \infty`
* :code:`Asympottes obliques` : :math:`\lim_{x \rightarrow \pm\infty}\frac{f(x)}{x} = a \in \mathbb{R}^* \infty`
* :code:`Asympottes obliques` : :math:`\lim_{x \rightarrow \pm\infty}\frac{f(x)}{x} - ax = b \in \mathbb{R}\infty`
* :code:`convexe` : croissance de plus en plus rapide, dérivée croissante et dérivée seconde positive
* :code:`concave` : croissance de plus en plus lente, dérivée décroissante et dérivée seconde négative
* :code:`point d'inflexion` : si une fonction passe de convexe à concave ou inversement, alors c'est le point x du changement

Limites
**************

...

Limites connues
--------------------------

...

Limites connues : addition
----------------------------

=============== =============== =============== ===============
\+              :math:`-\infty` :math:`l`       :math:`+\infty`
=============== =============== =============== ===============
:math:`-\infty` :math:`-\infty` :math:`-\infty` :math:`FI`
:math:`l'`      :math:`-\infty` :math:`l+l'`    :math:`+\infty`
:math:`+\infty` :math:`FI`      :math:`+\infty` :math:`+\infty`
=============== =============== =============== ===============

FI signifie Forme Indéterminée, voir la partie correspondante.

Limites connues : produit
----------------------------

=============== =============== =============== =============== =============== ===============
:math:`*`       :math:`-\infty` :math:`l \lt 0` :math:`0`       :math:`l \gt 0` :math:`+\infty`
=============== =============== =============== =============== =============== ===============
:math:`-\infty` :math:`+\infty` :math:`+\infty` :math:`FI`      :math:`-\infty` :math:`-\infty`
:math:`l' < 0`  :math:`+\infty` :math:`ll'`     :math:`0`       :math:`ll'`     :math:`-\infty`
:math:`0`       :math:`FI`      :math:`0`       :math:`0`       :math:`0`       :math:`FI`
:math:`l' > 0`  :math:`-\infty` :math:`ll'`     :math:`0`       :math:`ll'`     :math:`+\infty`
:math:`+\infty` :math:`-\infty` :math:`-\infty` :math:`FI`      :math:`+\infty` :math:`+\infty`
=============== =============== =============== =============== =============== ===============

FI signifie Forme Indéterminée, voir la partie correspondante.

Formes indéterminées (FI)
--------------------------

Les outils pour simplifier une forme indeterminée et obtenir une forme connues sont :

	* les encadrements : si :math:`f(x) \le g(x)` alors :math:`\lim_{x \rightarrow a}f(x) \le \lim_{x \rightarrow a} g(x)`
	* les identités remarquables
	* par croissance comparée
	* via le calcul de développement limités (règle de l'hôpital = :math:`{DL}_1`)

Exercices
*************

.. toctree::
    :name: exercices
    :maxdepth: 1

		Limites										<exercices/limit>
		Dérivées									<exercices/derive>
		Études de fonctions				<exercices/etude>
		Non triés									<exercices/non_rank>

|

----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikipedia.org/wiki/Coefficient_binomial