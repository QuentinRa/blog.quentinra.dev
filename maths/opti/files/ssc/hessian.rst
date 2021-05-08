===========================
Calcul classique du Hessien
===========================

Il s'agit du calcul le plus classique. Nous avons une fonction
:math:`f(x)`.

Gradient
**********

Nous appelons :code:`gradient`, le nabla de :math:`f(X)` noté
:math:`\nabla f(X)` et qui correspond au vecteur des dérivées partielles (notée :math:`\partial`)
de :math:`f`.

Pour mieux comprendre, il faut savoir que nous savons dériver une fonction
univariée (=une seule variable x par exemple) mais pas les fonctions multivariées
(:math:`f(x,y)` par exemple). Nous allons donc faire une vecteur, et pour chaque ligne
nous prenons une variable et considérons toutes les autres comme des constantes et dérivons.

Ainsi, :math:`\frac{\partial f}{\partial x}` veut dire qu'on dérive :math:`f` par rapport
à :math:`x` (on considère :math:`y` comme une constante).
De même, :math:`\frac{\partial f}{\partial y}` veut dire qu'on dérive
:math:`f` par rapport à :math:`y` (on considère :math:`x` comme une constante)
ce qui donne comme gradient
:math:`\nabla f(x,y) = \begin{pmatrix}\frac{\partial f}{\partial x}\\\frac{\partial f}{\partial y}\end{pmatrix}`.

Hessien
**********

Le Hessien noté :math:`Hf(X)` est une matrice des dérivées partielles du gradient. Elle va nous permettre
de savoir s'il y a un extrêma.

.. note::

	Exemple avec :math:`f(x, y) = 2x^2 + y^2 − 2xy + 4x`, nous avons la dérivée

		* en x : :math:`4x + 0 + - 2 * 1 * y + 4` soit :math:`4x -2y + 4`
		* en y : :math:`2 * 0 + 2y + - 2 * x * 1 + 0` soit :math:`2y-2x`

	ce qui donne
	:math:`\nabla f(x,y) = \begin{pmatrix}\color{red}{4}x \color{green}{-2}y + 4\\\color{green}{2}y-\color{red}{2}x\end{pmatrix}`
	donc la hessienne

		* en x : :math:`4 - 0  + 0` soit :math:`4`
		* en x : :math:`0-2 * 1` soit :math:`-2`
		* en y : :math:`0 -2 * 1 + 0` soit :math:`-2`
		* en y : :math:`2*1-0` soit :math:`2`

	ce qui donne :math:`\begin{pmatrix}4&-2\\-2&2\end{pmatrix}`

Comment utiliser le hessien
*******************************

Une fois le hessien calculé, il faut résoudre le gradient en 0, donc obtenir tous les points
qui font que le gradient vaut :math:`(0,0, ...., 0)`. Soit :math:`X1, X2, ...` vos points dit **points critiques**
noté :math:`x*` qui annulent le gradient, alors vous devez calculer :math:`Hf(X_n)` pour vos n solutions.

Pour chaque matrice hessienne en X obtenue, vous devez calculer le signe de la matrice, puis selon le cours vu
précédemment, voici un résumé de l'interpretation du signe

	* hessien définie positive : minimum local (strict)
	* hessien définie négative : maximum local (strict)
	* hessien semi-définie positive : minimum global
	* hessien semi-définie négative : maximum global
	* hessien indéfinie : point selle

D'ailleurs si vous avez un seul minimum/maximum alors il est le minimum/maximum global.

Signe du hessien/existence
****************************

On définit les notions

	* :code:`Semi-définie positive` (resp. négative) : toutes les valeurs sont positives (resp. négatives)
	* :code:`Définie positive` (resp. négative) : toutes les valeurs sont strictement supérieures à 0 (resp. inférieures)
	* :code:`Indéfinie` : les autres cas

En pratique, cela se trouve avec une caractérisation du signe d'une matrice A, voici deux méthodes

.. toctree::
   :maxdepth: 1

		Signe d'une matrice (1)      <signe1>
		Signe d'une matrice (2)      <signe2>

Et enfin la technique inconnue non certifiée sur les matrices 2x2, de la forme suivante
:math:`\begin{pmatrix}d1&d2\\d3&d4\end{pmatrix}`, et :math:`d = déterminant = d1 * d4 - d2 * d3` ce qui donne

	* si :math:`d1` positif et :math:`d` positif (strict) alors :code:`minimum local`
	* si :math:`d1` positif et :math:`d` négatif alors :code:`point selle`
	* si :math:`d1` négatif et :math:`d` positif (strict) alors :code:`maximum local`
	* si :math:`d1` négatif et :math:`d` négatif alors :code:`point selle`

.. note::

	Dans l'exemple montré plus haut, 4 est positif (1) et :math:`d = 4 * 2 - (-2 * -2) = 8 - 4 = 4` est positif donc
	en accord avec la technique inconnue, le point est un :code:`minimum local`.

	Hors nous n'avons qu'un seul point donc c'est un :code:`minimum global`. Sinon faite la technique du signe
	qui sera juste un peu plus longue mais générique.