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

Cependant l'erreur absolue n'est pas suffisante.

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

.. _norme:

3. Normes
=================================

Une norme N sur un ensemble E est une mesure de l'erreur sur E.

	* croissante : :math:`N(x) \ge 0`
	* inégalité triangulaire : :math:`N(x+y) \le N(x)+N(y)`
	* seul moment où la norme est nulle : :math:`N(x) = 0 \Leftrightarrow x = 0`
	* :math:`N(\lambda{x}) = |\lambda| N(x)`

.. note::

	On note :math:`| \cdot  |` pour la norme d'un réel/complexe.

	On note :math:`|| \cdot ||` pour la norme d'un vecteur.

	On met :math:`||| \cdot  |||` pour la norme d'une matrice.

3.1 Normes en 1, 2 et :math:`+\infty`
***************************************************

3.1.1 Norme en 1
---------------------------------------------------

:math:`||x||_1 = \sum_{i=1}^{n}{ |\ x_i |}`

3.1.2 Norme en 2
---------------------------------------------------

:math:`||x||_2 = (\sum_{i=1}^{n}{ |\ x_i |^2} )^{1/2} = \sqrt{\sum_{i=1}^{n}{ |\ x_i |^2}}`

ou :math:`|||A|||_2 = \max_{  y \neq 0 } \frac{||Ay||_2}{||y||_2}`.

Si A est normale alors :math:`|||A|||_2 = \rho (A)` sinon :math:`|||A|||_2 = \sqrt{\rho (A^*A)}`

3.1.3 Norme en :math:`+\infty`
---------------------------------------------------

:math:`||x||_{+\infty	} = \max_{i \in \mathbb{[}1:n\mathbb{]}} | \ x_i |^2`

.. note::

	On note que max = maximum atteint alors que sup c'est comme une limite donc
	pas forcément atteint.

3.2 Opérations sur les normes
***************************************************

:math:`|||A|||| = \sup_{x \neq 0} \frac{||Ax||}{||x||}`

:math:`||Ax|| \le |||A||| * ||x||`

:math:`\rho(A) \le ||A||`

.. note::

	On peut toujours trouver une norme d'une matrice pour approcher le rayon spectral.

:math:`||v||^2_2 = v^t * v`

:math:`||Qx||^2_2 = (Qx)^* Qx = x^* Q^* Qx = x^* x = ||x||^2_2` car :math:`Q^**Q=Id`
donc :math:`\color{red}{||Qx||^2_2 =||x||^2_2}`

:math:`||AQ||_2 = ||QA||_2 = ||A||_2`

.. note::

	Démonstration

	.. math::

		||AQ||_2 := \max_{  x \neq 0 } \frac{||AQx||_2}{||x||_2}
		\\
		on \ pose \ y = Qx \\
		= \max_{  x \neq 0 } \frac{||Ay||_2}{||y||_2} := |||A|||

4. Conditionnement
=================================

Le conditionnement permet de mesurer l'impact des erreurs d'arrondis sur x (Ax=b).

.. note::

	Je crois, que le conditionnement permet de mesurer la dépendance entre b (la solution du problème)
	et x (le paramètre).

4.1 Conditionnement en 1
********************************

.. math::

	cond(A) = |||A||| * |||A^{-1}|||

Propriétés
	* :math:`A \in Gl_n(R) \ alors \ cond(A) \ge 1`
	* :math:`A \in Gl_n(R) \ alors \ cond(\lambda{A}) = cond(A)`
	* :math:`A, B \in Gl_n(R) \ alors \ cond(AB) \le cond(A) * cond(B)`

4.2 Conditionnement en 2
********************************

.. math::

	cond_2(A) = \sqrt{\frac{\sigma_n}{\sigma_1}} \\
	ou \ si \ A \ définie \ positive \\
	cond_2(A) = \sqrt{\frac{\lambda_n}{\lambda_1}} \\

.. note::

	:math:`\sigma` est la plus petite valeur propre, :math:`\lambda` la plus grande valeur propre.

4.3 Conditionnement en p
********************************

Si on considère une norme :math:`|||\ |||_p` alors :math:`cond_p(A) = |||A||_p |||A^{-1}||_p`








|

-----

**Crédits**
	* Vicent Torri (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
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
	* outils
		* http://atomurl.net/math/
		* https://www.dcode.fr/norme-vecteur