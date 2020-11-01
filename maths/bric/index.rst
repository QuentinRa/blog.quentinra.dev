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

Les limites permettent de savoir si pour une fonction f(x), on prend un x
qui "tends" à se rapprocher d'une certaine valeur, alors les valeurs de f(x) tendent-elles aussi
à ce rapprocher d'une valeur ? Si oui, alors on a déterminer une limite.

.. math::

	\lim_{x \rightarrow 2} f(x) = limite\ quand\ x\ tends\ vers\ 2\ de\ f(x)
	\\\lim_{x \rightarrow 2^-} f(x) = limite\ quand\ x\ tends\ vers\ une\ valeur\ légèrement\ inférieure\ à\ 2\ de\ f(x)
	\\\lim_{x \rightarrow 2^+} f(x) = limite\ quand\ x\ tends\ vers\ une\ valeur\ légèrement\ supérieure\ à\ 2\ de\ f(x)
	\\\lim_{x \rightarrow +\infty} f(x) = limite\ quand\ x\ tends\ vers\ plus\ l'infini\ de\ f(x)
	\\\lim_{x \rightarrow -\infty} f(x) = limite\ quand\ x\ tends\ vers\ moins\ l'infini\ de\ f(x)

La limite revient bêtement à remplacer x par la valeur vers laquelle x tends : 0, ... par +l'infini, - l'infini...
et de calculer la limite en utilisant les limites connues.

.. warning::

	Il est possible de calculer la limite de x en 0 ce qui donne 0/0, parce que
	on remplace par 0 mais il faut garder en mémoire que ce n'est pas 0 mais une valeur
	extrêmement petite qui se rapproche de zéro mais n'est pas forcément zéro.

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

Limites connues : division
----------------------------

================ =============== =============== =============== =============== ===============
:math:`haut/bas` :math:`-\infty` :math:`l \lt 0` :math:`0`       :math:`l \gt 0` :math:`+\infty`
================ =============== =============== =============== =============== ===============
:math:`-\infty`  :math:`FI`      :math:`+\infty` :math:`-\infty` :math:`-\infty` :math:`FI`
:math:`l' < 0`   :math:`0^+`     :math:`l'/l`    :math:`-\infty` :math:`l'/l`    :math:`0^-`
:math:`0`        :math:`0`       :math:`0`       :math:`FI`      :math:`0`       :math:`0`
:math:`l' > 0`   :math:`0^-`     :math:`l'/l`    :math:`+\infty` :math:`l'/l`    :math:`0^+`
:math:`+\infty`  :math:`FI`      :math:`-\infty` :math:`+\infty` :math:`+\infty` :math:`FI`
================ =============== =============== =============== =============== ===============

FI signifie Forme Indéterminée, voir la partie correspondante.

Limites utiles
--------------------------

* si :math:`\alpha < \beta,\ \lim_{x \rightarrow +\infty} \frac{x^\alpha}{x^\beta} = 0`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow +\infty} \frac{(lnx)^\alpha}{x^\beta} = 0`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow +\infty} \frac{(exp x)^\alpha}{x^\beta} = +\infty`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow -\infty} x^\alpha * (exp x)^\beta = 0`
* si :math:`\alpha > \beta,\ \lim_{x \rightarrow 0^+} \frac{x^\alpha}{x^\beta} = 0`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow 0^+} x^\alpha * (lnx)^\beta = 0`

Formes indéterminées (FI)
--------------------------

Les outils pour simplifier une forme indeterminée et obtenir une forme connues sont :

	* les encadrements : si :math:`f(x) \le g(x)` alors :math:`\lim_{x \rightarrow a}f(x) \le \lim_{x \rightarrow a} g(x)`
	* les identités remarquables
	* par croissance comparée
	* via le calcul de développement limités (règle de l'hôpital = :math:`{DL}_1`)
	* factorisation (par la fonction la plus croissante)

.. warning::

	Attention, en 0, x > x^2 donc pour factoriser, la fonction de plus haut
	n'est pas forcément la fonction la plus croissante.

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
	* https://www.dcode.fr/limite
	* https://www.dcode.fr/derivee
	* https://www.dcode.fr/domaine-definition-fonction
	* https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_des_croissances_compar%C3%A9es