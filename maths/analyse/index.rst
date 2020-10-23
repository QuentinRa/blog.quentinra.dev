.. _analyse:

================================
Analyse numérique
================================

.. warning::

	Ce cours suppose des bases en analyse et en algèbre matriciel

1. Introduction
=================================

1.1 Objectif
**********************

L'objectif est de résoudre numériquement un système linéaire (sl)
et réussir à calculer les valeurs propres d'une matrice.

1.2 Comment résoudre ax=b
***************************

- méthode directe : faire un nombre fini d'opérations
- méthode itérative : approcher x par récurrence

1.3 Problèmes
**********************

Les calculs étant fait sur ordinateurs, il y aura des erreurs. Il faut pouvoir
estimer et/ou majorer cette erreur.

	* erreurs arrondi, de mesure
	* erreur de troncature (calcul de série/suite pour un n fixe ; approche d'une intégrale par une somme, une fonction par son DL)
	* méthode, modélisation ou calcul

Les calculs peuvent êtres très longs si le système est très grand. Il faut
connaitre le cout/un ordre d'idée de chaque méthode.

2. Erreurs absolues ou relatives
=================================

Une erreur est une quantité qui mesure si un résultat calculé est numériquement
proche du résultat théorique.

.. note::

	Cette partie nécessite des connaissances sur les normes (:ref:`norme`).


2.1 Erreur absolue
**********************

Soit x, le résultat exact et :math:`x_{appro}` une valeur approchée, alors l'erreur absolue se calcule :math:`|x-x_{appro}|`.

Cependant l'erreur absolu n'est pas suffisante.

	| x=10^{-6}
	| y=2*10^{-6}
	| \|x-y|=10^{-6}=petite erreur sauf que y=2*x.

2.2 Erreur relative
**********************

Soit x, le résultat exact et :math:`x_{appro}` une valeur approchée, alors l'erreur relative
se calcule :math:`\frac{|x-x_{appro}|}{|x|}`
ou :math:`\frac{|||AB|||}{|||A|||}` avec A et B des matrices ayant la même sémantique que x et :math:`x_{appro}`.

	| x=10^{-6}
	| y=2*10^{-6}
	| :math:`\frac{|x-y|}{|x|}=1` = pas petit

3. Conditionnement
=================================

Le conditionnement permet de mesurer l'impact des erreurs d'arrondis sur x (Ax=b).

.. note::

	Je crois, que le conditionnement permet de mesurer la dépendance entre b (la solution du problème)
	et x (le paramètre).

3.1 Conditionnement en 1
********************************

.. math::

	cond(A) = |||A||| * |||A^{-1}|||

Propriétés
	* :math:`A \in Gl_n(R) \ alors \ cond(A) \ge 1`
	* :math:`A \in Gl_n(R) \ alors \ cond(\lambda{A}) = cond(A)`
	* :math:`A, B \in Gl_n(R) \ alors \ cond(AB) \le cond(A) * cond(B)`

3.2 Conditionnement en 2
********************************

.. math::

	cond_2(A) = sqrt{\frac{\sigma_n}{\sigma_1}} \\
	ou \ si \ A \ définie \ positive \\
	cond_2(A) = sqrt{\frac{\lambda_n}{\lambda_1}} \\

.. note::

	:math:`\sigma` est la plus petite valeur propre, :math:`\lambda` la plus grande valeur propre.













|
|

-----

**Crédits**
	* Vicent Torri (enseignant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* Analyse numérique
		* https://fr.wikipedia.org/wiki/Cat%C3%A9gorie:Analyse_num%C3%A9rique
		* http://math.univ-bpclermont.fr/~cindea/blog/post/intro-ana-num-interet/
		* https://www.i2m.univ-amu.fr/perso/thierry.gallouet/licence.d/anum.d/anum-tg2.pdf
	* latex
		* https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques
		* https://www.commentcamarche.net/contents/620-latex-table-de-caracteres*
		* https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols