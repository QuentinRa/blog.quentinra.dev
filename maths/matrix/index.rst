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

2.2 Matrice identité ou unité
*************************************

La matrice identité est une matrice :math:`Id_n` tel que :math:`A_n * Id_n = Id_n * A_n = A_n`.

Il s'agit d'une matrice diagonale, avec uniquement des 1 sur la diagonale.

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

4. Matrice Inverse et Réduction d'endomorphisme
===================================================

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

			Ceci se lit comme le noyeau spectral est la valeur absolue du plus grand lambda atteint
			sachant que lambda se trouve dans :math:`\sigma(A)` soit l'ensemble des vecteurs propres.

Polynôme caractéristique
	Le polynôme caractéristique de A : :math:`X_a(T) = det(A -T Id)`

4.1 Matrices inverses
***************************************************

On note :math:`Gl_n(R)` l'ensemble des matrices inversibles.

...

4.2 Réduction de matrice/d'endomorphism
***************************************************

L'objectif est calculer :math:`A^n`. On va réduire la matrice à une matrice diagonale.

	:math:`B^n = P * A^n * P^{-1}`

.. _norme:

5. Normes
=========================================

Une norme N sur un ensemble E est une mesure de l'erreur sur E.

	* :math:`N(x) \ge 0`
	* :math:`N(x+y) \le N(x)+N(y)`
	* :math:`N(x) = 0 \Leftrightarrow x = 0`
	* :math:`N(\lambda{x}) = |\lambda| N(x)`

.. note::

	On met \|\|\|A||| pour la norme d'une matrice. On note \|\|Ax|| pour la norme d'un vecteur.

5.1 Normes en 1, 2 et :math:`+\infty`
***************************************************

5.1.1 Norme en 1
---------------------------------------------------

:math:`||x||_1 = \sum_{i=1}^{n}{ |\ x_i |}`

.. note::

	...

5.1.2 Norme en 2
---------------------------------------------------

:math:`||x||_2 = (\sum_{i=1}^{n}{ |\ x_i |^2} )^{1/2}`

.. note::

	...

Si A est normale alors :math:`|||A||| = \rho (A)`

.. note::

	...

5.1.3 Norme en :math:`+\infty`
---------------------------------------------------

:math:`||x||_{+\infty	} = \max_{i \in \mathbb{[}1:n\mathbb{]}} | \ x_i |^2`

.. note::

	...

5.2 Opérations sur les normes
***************************************************

:math:`|||A|||| = \sup_{x \neq 0} \frac{||Ax||}{||x||}`

.. note::

	...

:math:`||Ax|| \le |||A||| * ||x||`

.. note::

	...

:math:`\rho(A) \le ||A||`

.. note::

	On peut toujours trouver une norme d'une matrice pour approcher le rayon spectral.

|
|
|

-----

**Crédits**
		* Denis Monnerat (enseignant à l'IUT de Sénart-Fontainebleau)
		* Jéremy Possamaï (enseignant à l'IUT de Sénart-Fontainebleau)
		* Vicent Torri (enseignant à l'ENSIIE)

**Sources**
	* Matrices (définitions)
		* https://fr.wikipedia.org/wiki/Matrice_normale
	* Bornes
		* https://fr.wikipedia.org/wiki/Borne_sup%C3%A9rieure_et_borne_inf%C3%A9rieure
		* https://fr.wikipedia.org/wiki/Extremum
	* latex
		* https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques
		* https://www.commentcamarche.net/contents/620-latex-table-de-caracteres*
		* https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols