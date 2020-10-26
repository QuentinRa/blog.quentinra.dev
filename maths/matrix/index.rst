.. _matrix:

================================
Matrice
================================

1. Introduction
=====================

On note :math:`M_{n,p}` une matrice de n lignes et p colonnes. Il s'agit d'un tableau à deux dimensions dans lequel
on identifie une case par des coefficients i (ligne) et j (colonne) qui commencent à 1.

.. math::

	M=\ \begin{pmatrix}
	\ a_{1,1} & \cdots & a_{1, p-1} \\
	\vdots  & \cdots & \vdots  \\
	\ a_{n-1,1} & \cdots & a_{n-1, p-1}
	 \end{pmatrix}

.. note::

	Des matrices :math:`M_{n,p}` sont parfois notées :math:`M_{np}` lorsqu'il est évident
	qui est n et qui est p.

1.1 Matrice d'un système linéaire
**************************************

Les systèmes linéaires sont souvent représentés sous la forme de matrices
pour pouvoir utiliser la méthode de résolution de GAUSS.

Les règles sont :

		* on ne met que les indices des variables, une variable par colonne
		* si la variable n'est pas présente, on met 0
		* s'il n'y a pas de coefficient, alors on met 1
		* la dernière colonne est celle des seconds membres
		*
			le nombre de ligne = le nombre de variables, s'il y a plus de lignes que d'inconnues alors [...].
			S'il y a moins de lignes que d'inconnues alors certaines inconnues sont des paramètres.

.. note::

	Par exemple le système

	.. math::

		\left \{
		\begin{array}{r c l}
		x_1 \ \ - \ \ x_2 + 2x_3 = 3 \\
		x_1 \ \ + \ 2x_2 \ \ \ \ \ \ \ \ \ \ = 0
		\end{array}
		\right .

	donne la matrice

	.. math::

		\begin{pmatrix}
		\ 1 & -1 & 2 & 3 \\
		\ 1 & 2 & 0 & 0
		\end{pmatrix}

	On échelonne ensuite avec le pivot de GAUSS.

		* On obtient dans la colonne du second membre une valeur.
		*
			dans l'une des autre colonnes, et ce pour chaque ligne, on aura un seul 1.
			Si ce 1 est dans la colonne 1, alors on a :math:`x_1` = valeur du second membre de la même ligne.

	Par exemple, si on fini avec cette matrice, :math:`x_1=3` et :math:`x_3=12`, :math:`x_2` sera un paramètre.

	.. math::

		\begin{pmatrix}
		\ 1 & 0 & 0 & 3 \\
		\ 0 & 0 & 1 & 12
		\end{pmatrix}

2. Matrices particulières
===========================

2.1 Matrices remarquables
*************************************

* Matrice :code:`nulle` : toutes les valeurs sont à 0
* Matrice :code:`carré` : matrice de la forme :math:`M_{n}`
* Matrice :code:`diagonale` : matrice nulle avec les valeurs dans la diagonale non nulles
* Matrice :code:`conjuguée` : :math:`conj(A)` revient à inverser le signe des coefficient complexes [#1]_.
* Matrice :code:`transposée` : :math:`t_A` = :math:`A^t` = Matrice inverse lignes et colonnes
* Matrice :code:`adjointe` notée : :math:`A^*` soit la transposée de la matricée conjuguée
* :code:`Vecteur` ou Matrice :code:`ligne` ou :code:`colonne` : Matrice de la forme :math:`M_{n,1}` ou :math:`M_{1,m}`
* Matrice A :code:`symétrique` (:math:`\mathbb{R}`) ou :code:`hermitienne` (:math:`\mathbb{C}`)  : :math:`A = A^*`.
* Matrice :code:`orthogonale` (:math:`\mathbb{R}`) ou :code:`unitaire` (:math:`\mathbb{C}`) si :math:`A A^* = A^* A = Id`.
* Matrice :code:`normale` si :math:`A A^* = A^* A`.

.. [#1] Dans :math:`\mathbb{R}`, la conjuguée de A est égale à la co-matrice de A (voir :ref:`matrix_inverse`).

2.2 Matrice identité ou unité
*************************************

La matrice identité est une matrice :math:`Id_n` tel que :math:`A_n * Id_n = Id_n * A_n = A_n`.

Il s'agit d'une matrice diagonale, avec uniquement des 1 sur la diagonale.

2.3 Matrices triangulaires
******************************

Une matrice triangulaire est soit:

	* inférieure (TI) : la diagonale vaut 1, au dessus on a des 0, et en dessous des valeurs.
	* inférieure stricte (TIS) : TI mais diagonale vaut 0.
	* supérieure (TS) : la diagonale vaut 1, en dessous que des 0, et au dessus des valeurs.
	* supérieure stricte (TSS) : TS mais diagonale vaut 0

3. Opérations sur les matrices
===============================

3.1 Addition avec une matrice
******************************

Il est possible de faire l'addition entre deux matrices, seulement si elles ont le même
nombre de lignes et colonnes.

.. math::

			\begin{pmatrix}
		1 & 2 & 3 \\
		4 & 5 & 6
		 \end{pmatrix}
		 +
		 \begin{pmatrix}
		0 & 1 & 2 \\
		1 & 2 & 3
		 \end{pmatrix} = \begin{pmatrix}
		1 & 3 & 5 \\
		5 & 7 & 9
		 \end{pmatrix}

.. warning::

	La soustraction n'est pas possible, mais il est possible de faire A + -1*B.

3.2 Multiplication
******************************

3.2.1 Multiplication par un réel
**********************************

Condition: aucune. Il suffit de multiplier tous les membres de la matrice par le coefficient.

.. math::

	-2 *
	\begin{pmatrix}
	1 & 2 & 3 \\
	4 & 5 & 6
	\end{pmatrix}
	\ = \
	\begin{pmatrix}
	-2 & -4 & -6 \\
	-8 & -10 & -12
	\end{pmatrix}

.. warning::

	Soit une matrice A et un réel r. A / r est impossible mais :math:`A * (1/r)` est possible.

3.2.1 Multiplication par une matrice
**************************************

Condition: Le coefficient des lignes de la matrice 1 doit être le même que le coefficient des colonnes de
la matrice 2 soit :math:`M1_{n1, \ {\color{red}p1}} = M2_{{\color{red}n2}, \ p2} \ avec \ p1=n2`.

Le résultat sera une matrice math:`M_{p1, n2}`.

.. math::

	\ \ \  \  \  \  \  \  \  \  \  \  \ \  \  \  \  \  \  \  \  \  \  \ \  \
	M1\ \begin{pmatrix}
	\color{blue}{1} & 4 \\
	\color{blue}{2} & 5  \\
	\color{blue}{3} & 6
	\end{pmatrix}

.. math::

		M2
		\begin{pmatrix}
		\color{red}{9} & \color{red}{8} & \color{red}{7} \\
		6 & 5 & 4
		\end{pmatrix}
		\
		M
		\begin{pmatrix}
		\color{red}{9}*\color{blue}{1}+\color{red}{8}*\color{blue}{2}+\color{red}{7}*\color{blue}{3}=46 & 9*4+8*5+7*6=118 \\
		6*1+5*2+4*3=28 & 6*4+5*5+4*6=73
		\end{pmatrix}

.. note::

	Pour faire le produit, on place généralement les matrices de la forme une haut (M2), une en dessous (M) et
	une à gauche de M (M1).

	Pour obtenir la valeur de la case :math:`M_{1, 1}` on fait la somme des multiplications de la colonne 1,
	ligne 1 de M1 * colonne 1, ligne 1 de M2 + colonne 2, ligne 1 de M1 * colonne1, ligne 2 de M2 etc...

	Si vous avez compris, on fixe la ligne de M1 à 1 et la colonne de M2 à 1 et on multiplie les valeurs en avançant
	dans les colonnes (M1) et dans les lignes (M2).

.. warning::

	Soit deux matrices A, B. A / B est impossible mais :math:`A * B^-1` est possible.

.. hint::

	Si A est une matrice diagonale, alors le calcul revient à faire à multiplier chaque colonne
	par le coefficient la la diagonale.

	Si la matrice est diagonale identité inversée, alors les lignes sont échangées.

.. _gauss:

4. Pivot de gauss
=========================

...

.. _matrix_inverse:

5. Matrice Inverse
===================================================

.. _determinant:

5.1 Calcul du déterminant
***************************

5.1.1 Définition
*********************************

Déterminant
	Le déterminant est un chiffre permettant et aider à obtenir des informations sur une matrice.

	Il sert par exemple à déterminer

		* si une matrice est inversible si :math:`det(A) \neq 0`
		* valeurs propres d'une matrice

Il est possible de le calculer avec un
	* calcul par développement (recommandé pour les matrices avec plusieurs zéros mais pas trop et de taille max 3~4)
	* pivot de gauss (attention, changer des lignes change le signe du déterminant donc non recommandé (-1^changement))

Propriétés
	* si :math:`A=\begin{pmatrix} a \end{pmatrix}`, det(A) = a
	* si :math:`A=\begin{pmatrix} a & b \\ c & d \end{pmatrix}`, det(A) = ad-bc
	* det(AB) = det(A) * det(B)
	* :math:`det(A^t)` = det(A)
	* si A est une matrice diagonale, alors det(A) = produit de valeurs de la diagonale

5.1.2 Calcul par développement
*********************************

* on prends notre matrice A
* on choisi une ligne/colonne (généralement celle avec les plus gros coefficients)
*
	on met les coefficients choisi avec + puis - puis + ... suivit du calcul du déterminant
	pour la matrice restant, après avoir retiré la ligne+colonne dans laquelle se trouvait la valeur.

.. hint::

	Soit la matrice :math:`M1\ \begin{pmatrix}{-1} & 4 & -7 \\{2} & -5 & 8 \\{-3} & 6 & -9\end{pmatrix}`,
	on va prendre la colonne :math:`\begin{pmatrix} -7 \\ 8 \\ -9\end{pmatrix}` car elle a les plus gros coefficients.

	.. math::

			det(M_1) = \color{red}{+} -7 * det(\begin{pmatrix} 2 & -5 \\ -3 & 6 \end{pmatrix})
			\color{red}{-} 8 * det(\begin{pmatrix} -1 & 4 \\ -3 & 6 \end{pmatrix})
			\color{red}{+} -9 * det(\begin{pmatrix} -1 & 4 \\ 2 & -5\end{pmatrix})

	.. math::

			det(M_1) = -7 * -3 -8 * 6 -9 * -3 = 0

	Il est important de noter les signes qui font +-+.

	La matrice :math:`\begin{pmatrix} 2 & -5 \\ -3 & 6 \end{pmatrix}` est obtenue en supprimant la ligne et
	la colonne de -7.

5.2 Matrice inverse
***************************

Une inverse est une matrice notée :math:`A^{-1}` telle que :math:`A*A^{-1}=Id`. Une matrice ne possède
pas forcément un inverse. Une matrice dont le déterminant est différent de 0 est inversible.

On note :math:`Gl_n(R)` l'ensemble des matrices inversibles.

Il existe deux méthodes :
	* en utilisant GAUSS
	* en utilisant la co-matrice

5.2.1 Calcul d'inverse avec Gauss
***********************************

L'idée est de mettre parallèlement votre matrice (à gauche) et la matrice identité (à droite).

	* L'objectif est d'obtenir la matrice identité (à gauche).
	* Toutes les opérations faites sur la matrice de gauche doivent être refaites sur la matrice de droite.
	* La matrice de droite est :math:`A^{-1}`.

.. note::

	Supposons :math:`A=\begin{pmatrix} 3 & -2 & 4 \\ 2 & -4 & 5 \\1 & 8 & 2\end{pmatrix}` est inversible, on pose
	au début

	.. math::

		\begin{pmatrix}3 & -2 & 4 \\ 2 & -4 & 5 \\1 & 8 & 2\end{pmatrix}
		\begin{pmatrix}1 & 0 & 0 \\0 & 1 & 0 \\ 0 & 0 & 1\end{pmatrix}

	et à la fin on obtient

	.. math::

		\begin{pmatrix}1 & 0 & 0 \\0 & 1 & 0 \\ 0 & 0 & 1\end{pmatrix} \ et \
		\begin{pmatrix}8/11 & -6/11 & -1/11 \\ -1/66 & -1/33 & 7/66 \\-10/33 & 13/33 & 4/33\end{pmatrix} = A^-1

5.2.2 Calcul via la co-matrice
***********************************

On peut calculer l'inverse d'une matrice avec :math:`A^{-1} = \frac{1}{det(A)} * Com(A)^t`.

La co-matrice de A notée Com(A) corresponds à une matrice

	* le point haut gauche est un plus
	* le points voisins ont des signes différents
	*
		le point :math:`a_{1,1}` est calculée en calculant le déterminant de la matrice A après
		avoir retiré la ligne 1 et la colonne 1.

.. note::

	La matrice :math:`A=\begin{pmatrix} 3 & -2 & 4 \\ 2 & -4 & 5 \\1 & 8 & 2\end{pmatrix}` est inversible est inversible
	de déterminant det(A)=-66.

	.. math::

		A^{-1} = \frac{1}{-66}
		\begin{pmatrix}
		+ \begin{pmatrix}-4 & 5 \\ 8 & 2\end{pmatrix} & - \begin{pmatrix}2 & 5 \\ 1 & 2\end{pmatrix} & + \begin{pmatrix}2 & -4 \\ 1 & 8\end{pmatrix} \\
		- \begin{pmatrix}-2 & 4 \\ 8 & 2\end{pmatrix} & + \begin{pmatrix}3 & 4 \\ 1 & 2\end{pmatrix} & - \begin{pmatrix}3 & -2 \\ 1 & 8\end{pmatrix} \\
		+ \begin{pmatrix}-2 & 4 \\ -4 & 5\end{pmatrix} & - \begin{pmatrix}3 & 4 \\ 2 & 5\end{pmatrix} & + \begin{pmatrix}3 & -2 \\ 2 & 4\end{pmatrix}
		\end{pmatrix}^t

	Il ne faut pas oublier de faire la transposée !

6. Réduction d'endomorphisme
===============================

L'objectif est calculer :math:`A^n` ou :math:`exp(A)`. On va réduire la matrice à une matrice diagonale.

On cherche à trouver une matrice P inversible et D diagonale telles que :math:`A^n = P * D^n * P^{-1}`.

.. note::

	:math:`A^n` consiste à mettre tous les coefficients d'une matrice diagonale à la puissance n.

	exp(A) consiste à faire exp(coefficient) pour chacun des coefficients d'une matrice diagonale.

.. note::

	:math:`A^n` et :math:`D^n` sont appelées matrices semblables.

L'objectif va être de calculer des valeurs propres, qui seront les coefficients de la matrice diagonale,
ainsi que de calculer P.

.. note::

	Il est possible que la réduction d'endomorphisme soit aussi appelé Théorème de Jordan (à confirmer?).

6.1 Définitions
****************

Vecteurs propres et valeurs propres
	S'il existe un lambda non null tel que :math:`A x = \lambda x` alors x est un vecteur propre de A
	pour la valeur propre lambda

	On appelle élément propre le couple (lambda, x)

	.. note::

		0 (zéro) peut être une valeur propre, puisque seul le vecteur propre doit être non null.

Spectre
	On appelle spectre d'une matrice l'ensemble des valeurs propres d'une matrice, noté :math:`\sigma(A).`

	On note :math:`\rho` (rho) le noyau spectral : :math:`\rho (A) = \max_{\lambda \in \sigma(A)} | \lambda|`

	.. note::

		Ceci se lit comme le noyeau spectral est la valeur absolue du plus grand lambda atteint
		sachant que lambda se trouve dans :math:`\sigma(A)` soit l'ensemble des vecteurs propres.

Polynôme caractéristique
	Les vecteurs propres sont des solutions de :math:`det(\lambda{I_n}-A_n) = 0`.

	On appelle polynôme caractéristique :math:`x_A(\lambda) = det(\lambda{I_n}-A_n)` soit un polynôme
	en lambda de degré n.

	.. note::

		Je crois que l'on doit ce théorème à Cayley-Hamilton.

Trace
	La trace, notée tr(A) correspond à la somme des valeurs de la diagonale de la matrice A.

6.2 Calcul
*************

Les étapes sont :

	* calculer  :math:`\lambda{I_n}-A_n`
	* résoudre :math:`det(\lambda{I_n}-A_n) = 0` et trouver les lambda (valeurs propres)
	* les valeurs propres forment la matrice diagonale D
	* On pose :math:`A = \lambda x`
	*
		On résout l'équation précédent pour chacune des valeurs propres (remplace \lambda).
		On obtient des vecteurs x :math:`(x_1, ..., x_1)`
	* en mettant tous les vecteurs à côté on obtient la matrice P
	* calculer :math:`P^{-1}`
	* (optionnel) on vérifie que :math:`P*D^1*P^{-1}=A`

.. note::

	L'ordre des :math:`\lambda` n'a pas d'importance, mais une fois choisi numérotez vos lambda.

	Le :math:`\lambda` en 1,1 (:math:`\lambda_1`) dans D donne le vecteur i,1 dans P etc.

7. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

    Calculs	de matrices		      <exercices/calculs>
    Calculs de déterminant      <exercices/determinant>
    Résolution (GAUSS)		      <exercices/gauss>
    Réduction d'endomorphisme   <exercices/reductions>
    Astuces de calcul   				<astuces>

|

-----

**Crédits**
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Jéremy POSSAMAÏ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Vicent TORRI (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* Matrices
		* https://fr.wikipedia.org/wiki/Matrice_normale
		* http://uel.unisciel.fr/physique/outils_nancy/outils_nancy_ch11/co/apprendre_ch11_17.html
		* https://en.wikipedia.org/wiki/Matrix_(mathematics)
		* https://fr.wikipedia.org/wiki/D%C3%A9terminant_(math%C3%A9matiques)
	* Bornes
		* https://fr.wikipedia.org/wiki/Borne_sup%C3%A9rieure_et_borne_inf%C3%A9rieure
		* https://fr.wikipedia.org/wiki/Extremum
	* latex
		* https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques
		* https://www.commentcamarche.net/contents/620-latex-table-de-caracteres*
		* https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols
	* endomorphisme
		* https://fr.wikipedia.org/wiki/Spectre_d%27une_matrice
		* https://fr.wikipedia.org/wiki/Matrices_semblables
		* https://fr.wikipedia.org/wiki/Polyn%C3%B4me_caract%C3%A9ristique
		* https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Cayley-Hamilton
		* https://fr.wikipedia.org/wiki/R%C3%A9duction_de_Jordan
	* outils
		* http://atomurl.net/math/
		* https://www.dcode.fr/determinant-matrice
		* https://calculis.net/matrice-inverse
		* https://www.dcode.fr/inverse-matrice