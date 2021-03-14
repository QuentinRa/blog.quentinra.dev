=============
Définitions
=============

Vecteurs propres et valeurs propres
	S'il existe un lambda non null tel que :math:`A x = \lambda x` alors x est un vecteur propre de A
	pour la valeur propre lambda

	On appelle élément propre le couple (lambda, x)

	.. note::

		0 (zéro) peut être une valeur propre, puisque seul le vecteur propre doit être non null.

espace propre
	On appelle l'espace propre l'ensemble des vecteurs propres.

Spectre
	On appelle spectre d'une matrice l'ensemble des valeurs propres d'une matrice, noté :math:`\sigma(A).`

	On note :math:`\rho` (rho) le noyau spectral : :math:`\rho (A) = \max_{\lambda \in \sigma(A)} | \lambda|`

	.. note::

		Ceci se lit comme le noyau spectral est la valeur absolue du plus grand lambda atteint
		sachant que lambda se trouve dans :math:`\sigma(A)` soit l'ensemble des vecteurs propres.

Polynôme caractéristique
	Les vecteurs propres sont des solutions de :math:`det(\lambda{I_n}-A_n) = 0`.

	On appelle polynôme caractéristique :math:`x_A(\lambda) = det(\lambda{I_n}-A_n)` soit un polynôme
	en lambda de degré n.

	.. note::

		Je crois que l'on doit ce théorème à Cayley-Hamilton.

Trace
	La trace, notée tr(A) correspond à la somme des valeurs de la diagonale de la matrice A.