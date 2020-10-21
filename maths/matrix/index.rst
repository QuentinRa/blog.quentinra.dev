.. _matrix:

================================
Matrice
================================

1. Introduction
=====================

...

2. Matrices particulières
===========================

2.1 Matrices remarquables
*************************************

* Matrice nulle, toutes les valeurs sont à 0
* Matrice carré, matrice de la forme :math:`M_{n}`
* Matrice transposée :math:`t_A` = :math:`A^t` = Matrice inverse lignes et colonnes

2.2 Matrice identité
*************************************

2.3 Vecteurs (matrice ligne/colonne)
*************************************

2.4 Matrice normales
**************************

Une matrice est normale si :math:`A A^* = A^* A`.

	.. note::

		Une matrice A multipliée par la transposée de la co-matrice est égale
		à la transposée de la co-matrice multiplié par une matrice A.

2.5 Matrices triangulaires
******************************

Une matrice triangulaire est soit:

	* inférieure (TI) : la diagonale vaut 1, au dessus on a des 0, et en dessous des valeurs.
	* inférieure stricte (TIS) : TI mais diagonale vaut 0.
	* supérieure (TS) : la diagonale vaut 1, en dessous que des 0, et au dessus des valeurs.
	* supérieure stricte (TSS) : TS mais diagonale vaut 0

2.6 Matrice symétrique (:math:`\mathbb{R}`) ou hermitienne (:math:`\mathbb{C}`)
************************************************************************************

Une matrice A est symétrique si :math:`A = A^*` (donc A est égal à la transposée de la co-matrice de A).

2.7 Matrice orthogonale (:math:`\mathbb{R}`) ou unitaire (:math:`\mathbb{C}`)
************************************************************************************

Une matrice est orthogonale ou unitaire si :math:`A A^* = A^* A = Id`.

4. Matrices inverses
===========================

4.1 Vocabulaire et notations
***************************************************

On note :math:`Gl_n(R)` l'ensemble des matrices inversibles.

Déterminant
	Le déterminant est un chiffre permettant et aider à obtenir des informations sur une matrice.

	Il sert par exemple à déterminer
		* si une matrice est inversible si :math:`det(A) \neq 0`
		* valeurs propres d'une matrice

Vecteurs propres et valeurs propres
	S'il existe un lambda non null tel que :math:`A x = \lambda x` alors x est un vecteur propre de A
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

4.2 Réduction de matrice/d'endomorphisme
***************************************************



















|
|
|

-----

* Denis Monnerat (enseignant à l'IUT de Sénart-Fontainebleau)
* Jéremy Possamaï (enseignant à l'IUT de Sénart-Fontainebleau)
* Vicent Torri (enseignant à l'ENSIIE)

**Sources**
	* Matrices (définitions)
		* https://fr.wikipedia.org/wiki/Matrice_normale