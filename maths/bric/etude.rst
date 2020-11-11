.. _bric_etude:

================================
Études de fonctions
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 11/11/2020}`

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
* :code:`Asymptotes obliques` : :math:`\lim_{x \rightarrow \pm\infty}\frac{f(x)}{x} = a \in \mathbb{R}^* \infty`
* :code:`Asymptotes obliques` : :math:`\lim_{x \rightarrow \pm\infty}\frac{f(x)}{x} - ax = b \in \mathbb{R}\infty`
* :code:`convexe` : croissance de plus en plus rapide, dérivée croissante et dérivée seconde positive
* :code:`concave` : croissance de plus en plus lente, dérivée décroissante et dérivée seconde négative

*
	:code:`point d'inflexion` : si une fonction passe de convexe à concave ou inversement, alors c'est le point x du changement.
	On calcule les dérivés secondes et troisièmes. On résouds :math:`f''(x) = 0` et on calcule pour certains x trouvés
	:math:`f'''(x)`. Si :math:`f'''(x)` est égale à 0, alors x n'est pas un point d'inflexion. Sinon, si le résultat
	est négatif alors on passe de convexe à concave et si le résultat est positif, alors on passe de concave à connexe.

*
	:code:`tangente` : pente de la courbe, f(a)<f(x) alors :math:`pente\ =\frac{f(x)-f(a)}{x-a}`.
	Si a=x alors :math:`pente\ =\lim_{x \rightarrow a} \frac{f(x)-f(a)}{x-a} = f'(a)`.
	La tangente peut aussi être approchée par :math:`pente\ = f(a) + f'(a) (x-a)`, avec a le point pour lequel vous voulez
	la tangente.

Une suite possible d'étapes pour étudier une fonction serait

	1. Domaine de définition
	2. Dérivée

		| 2.1. Domaine de la dérivée
		| 2.2. Résoudre f'(x)=0
		| 2.3. Tableau de variations

	3. Calculs optionnels

		| 3.1. Calcul des asymptotes
		| 3.2. Calcul des tangentes
		| 3.3. Calcul de symétries
		| 3.4. Calcul de convexités/concavités
		| 3.5. Calcul de points d'inflexions

	4. Dessiner la courbe

Quelques domaines de définitions

	* cos(x), sin(x) : R
	* exp(x) : R
	* ln(x) : R+, x > 0

|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune