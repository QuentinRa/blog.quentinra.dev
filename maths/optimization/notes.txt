===========
Lagrange
===========

Uniquement des contraintes d'égalité
*************************************

On note :math:`\mu` (mu) le coefficient devant les contraintes d'égalité. Le Lagrangien
est une combinaison linéaire des contraintes telle qu'on ait

.. math::

	L(X, \mu) = \nabla f(X) + \sum_{i=1}^{m} \mu_i * \nabla g_i(X)

Très simplement,

	* :math:`\nabla` (nabla) c'est le gradient
	* votre premier terme est donc le gradient de :math:`f`
	* vous devez exprimer toutes vos contraintes sous la forme :math:`expression = 0`
	* vos autres termes sont le produit d'un :math:`\mu` (mu, une inconnue) par le gradient de la contrainte i
	* vous obtenez :math:`m+1` vecteurs séparés par des :math:`+` avec :math:`m` le nombre de contraintes

Fusionnez les gradients pour obtenir un vecteur d'expressions qu'il faut résoudre en un vecteur de 0
pour trouver le point critique.

Vous pouvez ensuite construire le hessien très facilement. Sur le même principe que le vecteur d'expressions,
vous allez faire une somme de hessien, attention toutefois à ne pas oublier de multiplier par mu. Notez
que les valeurs du hessien sont les coefficient devant les variables dans chaque vecteur.

.. math::

		\nabla L(X, \mu) = \nabla f(X)+ \mu_1 \nabla h_1(X)  +\mu_2 \nabla h_2(X)

Ainsi par exemple le vecteur :math:`\begin{pmatrix}x\\2y\\0\end{pmatrix}` donne
le hessien :math:`\begin{pmatrix}x&0&0\\0x&2&0\\0&0&0\end{pmatrix}`.

Contraintes d'égalité + inégalités
*************************************

On va introduire un :math:`\lambda` sur le même principe que mu.

.. math::

	L(X, \mu, \lambda) = \nabla f(X) + \sum_{i=1}^{m} \mu_i * \nabla g_i(X) + \sum_{i=1}^{p} \lambda_i * \nabla g_i(X)

avec p le nombre de contraintes d'inégalité. On fait ensuite pareil donc

	* gradient
	* fusion ce qui donne un système
	* on résous pour trouver les valeurs de x,y,...
	* remplacer les valeurs dans :math:`L(X, \mu, \lambda)`
	*

		refaire un système pour trouver :math:`\mu` et :math:`\lambda` donc avec encore les dérivées partielles
		de nos variables restantes

	* faire le hessien