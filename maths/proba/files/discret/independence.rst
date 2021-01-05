===================================
Indépendance
===================================

Variables aléatoires indépendantes

Les variables :math:`X_1, ..., X_n` sont indépendantes (noté :math:`\perp` (perp)) si

.. math::

	\mathbb{P}(X_1, ..., X_n = xn) = \prod_{i=1}^n \mathbb{P}(X_i = xi)

En texte, la probabilité des événements :math:`X_1, ..., X_n` est égale au
produit des probabilités de chaque événement.

.. code-block:: c

		//on lance 1 dé, 1 pièce, 1 dé
		//la probabilité pour la somme des dés dépends de 2 événements disjoints (1er et 3e)
		p(somme dés = 7, pièce = F) = 1/6 * 1/2

		//p(A) = |A|/|Ω| = |toutes les combinaisons qui font 7| / |toutes les combinaisons possibles|
		p(somme dés=7) = (p(6+1) + p(2+5) + p(4+3) +
 				p(1+6) + p(5+2) + p(3+4))
 				/ (6*6) //6 possibilités au premier lancé, 6 au second
 		= 6/36 = 1/6