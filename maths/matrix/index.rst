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

	Les matrices sont souvent utilisées pour résoudre des systèmes linéaires (voir :ref:`gauss`)

.. note::

	Des matrices :math:`M_{n,p}` sont parfois notées :math:`M_{np}` lorsqu'il est évident
	qui est n et qui est p.

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

5. Matrice Inverse et Réduction d'endomorphisme
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

|
|
|

-----

**Crédits**
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Jéremy POSSAMAÏ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Vicent TORRI (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* Matrices (définitions)
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
	* outils
		* http://atomurl.net/math/
		* https://www.dcode.fr/determinant-matrice