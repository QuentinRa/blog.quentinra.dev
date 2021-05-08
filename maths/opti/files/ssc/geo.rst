================================
Programmation géométrique (PG)
================================

La programmation géométrique c'est une sorte de programmation sous contraintes
avec la contrainte que tous les :math:`x_i` sont strictement positifs.

Généralement, on reconnait directement un problème de programmation géométrique
parce qu'ils ont une forme comme suit

.. math::

	\min_{x \gt 0,\ \ y \gt 0} g(x, y) = 8x + \frac{y}{x}+ \frac{1}{y}

Donc vous avez les contraintes :math:`R^+_*`, vous avez des fractions
et (donc?) :math:`g` n'est pas convexe (généralement en tout cas il faut le démontrer).

La procédure
**************

* Identifier le nombre de membres (termes de la fonction) m
* Identifier le nombre de variables n
* on pose :math:`c_i` la constante associée au terme i
* on va ensuite faire une matrice (environ ce que appelle le dual DPG) :math:`M_{m,n}` donc m lignes et n colonnes

	* une ligne corresponds à un terme
	* l'intersection ligne/colonne corresponds à la puissance d'une variable dans ce terme

		* souvent 1
		* 0 si non présent
		* un terme négatif si le terme est en bas d'une fraction car :math:`1/x^n` c'est :math:`x^{-n}`

*

	pour chaque colonne, on a une équation de notre système, si on considère j comme la colonne actuelle
	de notre matrice alors l'équation j du système corresponds à

	.. math::

		\sum\limits_{i=1}^{m} \alpha_{ij}\delta_{i} = 0

	donc on fait la somme du alpha de chaque ligne de la colonne multiplié par le :math:`delta_i`
	donc une inconnue avec :math:`i` la ligne. Vous aurez donc m inconnues (deltas donc).

* on ajoute une équation qui est que la somme des :math:`delta_i` doit faire 1
* on peut ensuite résoudre notre système et obtenir nos m deltas

La solution du Programme géométrique notée :math:`\nu` (nu) corresponds à

.. math::

	\nu(\delta)=\prod\limits_{i=1}^{m} \big( \frac{c_{i}}{\delta_{i}}\big)^{\delta_{i}}

Enfin on peut vérifier que c'est bien un point critique

*

	poser un système tel que chaque terme est égal à :math:`\nu(\delta) * delta_i` avec
	i allant de 1 à m donc les delta de chaque ligne trouvés précédemment

* on résous le système, ce qui nous donne nos :math:`x*`, :math:`y*`, ...
* enfin on regarde dans le gradient si nos coordonnées annulent bien le gradient

.. hint::

	Mon astuce pour dériver c'est de réécrire une fraction sous la forme d'une puissance donc
	avec un moins devant le coefficient, dériver, puis remettre sous la forme d'une fraction.

Un exemple
**************

.. math::

	\min_{x \gt 0,\ \ y \gt 0} g(x, y) = 8x + \frac{y}{x}+ \frac{1}{y}

On applique la procédure

**écriture du DPG**

* on a 3 membres
* on a 2 variables x,y
* les constantes sont

	* :math:`c_1 = 8`
	* :math:`c_2 = 1`
	* :math:`c_3 = 1`

* on fait notre matrice

.. math::

	\begin{pmatrix}
	1 & 0 \\
	-1 & 1 \\
	0 & \color{red}{-1}
	\end{pmatrix}

à titre d'exemple, le :math:`-1` en rouge corresponds à la puissance de y dans le 3e membre
soit :math:`1/y`.

* on pose le système

	* nous avons 3 lignes (ou 3 membres) donc :math:`delta_1`, :math:`delta_2` et :math:`delta_3`
	* nous avons 2 colonnes (ou 2 variables) donc deux équations

ce qui nous donne

.. math::

		\left\lbrace\begin{array}{l}
		\delta_{i}>0  \,\,\forall i=1,2,3  \\
		\delta_{1} + \delta_{2} + \delta_{3} = 1 \\
		\delta_{1} - \delta_{2} =0 \\
		\delta_{2} - \delta_{3} =0 \\
		\end{array}\right.

**résolution du DPG**

On résous le système donc moi j'y vais en mode pas par pas

	* :math:`\delta_{1} = \delta_{2}`
	* :math:`\delta_{2} = \delta_{3}`
	* donc :math:`\delta_{1} + \delta_{2} + \delta_{3} = 1`
	* devient :math:`\delta_{2} + \delta_{2} + \delta_{2} = 1`
	* ce qui donne :math:`3 * \delta_{2} = 1`
	* donc :math:`\delta_{1} = \delta_{2} = \delta_{3} = 1/3`

**solution de PG**

.. math::

	\nu(\delta)= (\frac{8}{\frac{1}{3}}) ^ {\frac{1}{3}} *
		(\frac{1}{\frac{1}{3}}) ^ {\frac{1}{3}} * (\frac{1}{\frac{1}{3}}) ^ {\frac{1}{3}} *
	= 24 ^ {\frac{1}{3}} *  3 ^ {\frac{1}{3}} * 3 ^ {\frac{1}{3}}
	= 8 ^ {\frac{1}{3}} * 3 ^ {\frac{1}{3} + \frac{1}{3} + \frac{1}{3}}
	= 8 ^ {\frac{1}{3}} * 3
	= 2 * 3 = 6

**vérification point critique**

* On on résous le système

.. math::

		\left\lbrace\begin{array}{l}
		8x = 2 \\  \\
		\frac{y}{x} = 2 \\  \\
		\frac{1}{y} = 2
		\end{array}\right.

Le 2 corresponds à :math:`6 (solution PG) * 1/3 (\delta_{i})`. On résous et on obtient
:math:`x*=2/8=1/4` et :math:`y*=1/2`.

* On calcule le gradient

.. math::

	\nabla f(X) = \begin{pmatrix}	8 - y/x^2  \\	1/x - 1/y^2 \\\end{pmatrix}

* On test le point

	* :math:`8 - (1/2)/(1/4)^2 = 0`
	* :math:`1/(1/4) - 1/(1/2)^2 = 0`

Le point est un point critique.

**vérification non convexité**

On calcule le hessien

.. math::

	Hf(X) = \begin{pmatrix}
		2y/x^3 & -1/x^2 \\
		-1/x^2 & 2/y^3 \\
		\end{pmatrix}

On test des points jusqu'à avoir un hessien indéfinie donc déterminant négatif car dimension est paire (n=2).
On pourra alors en déduire que la fonction n'est pas convexe.

Personnellement je crois avoir fait une erreur car je ne trouve pas de point.