.. _matrix:

================================
Matrice
================================

1. Définitions
=====================

.. Mn,m (R)
	Vecteur (n ou m) = 1 ou R^n

On note
	* :math:`Gl_n(R)` l'ensemble des matrices inversibles

Trace
	???

Déterminant
	https://fr.wikipedia.org/wiki/D%C3%A9terminant_(math%C3%A9matiques)
	Le déterminant est un chiffre permettant et aider à obtenir des informations sur une matrice.

	Il sert par exemple à déterminer
		* si une matrice est inversible si :math:`det(A) \neq 0`
		* valeurs propres d'une matrice

.. échanger des lignes c'est pas bon
	on a juste addition et mul ok

	méthode avec ||

Produit scalaire
	forme sesquilinéaire ou hermitienne

A* = adjoint de A
	https://fr.wikipedia.org/wiki/Matrice_adjointe

Vecteurs propres et valeurs propres
	S'il existe un lambda non null tel que A x = \lambda x alors x est un vecteur propre de A
	pour la valeur propre lambda

	On appelle élément propre le couple (lambda, x)

	.. note::

		On appelle spectre d'une matrice l'ensemble des valeurs propres d'une matrice, noté
		:math:`\sigma(A).`

		https://fr.wikipedia.org/wiki/Spectre_d%27une_matrice

		On note :math:`\rho` (rho) le noyau spectral : :math:`\rho (A) = \max_{\lambda \in \sigma(A)} | \lambda|`

		.. note::

			Ce lit que le noyeau spectral est la valeur absolue atteinte par lambda sachant que lambda se trouve
			dans :math:`\sigma(A)` soit l'ensemble des vecteurs propres.

Polynôme caractéristique
	Le polynôme caractéristique de A : :math:`X_a(T) = det(A -T Id)`

	https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Cayley-Hamilton

	(revenir au cours, la fin de la page est claire)

rang et noyau
	ker (A- lam Id)

	rg(A-l Id) < n