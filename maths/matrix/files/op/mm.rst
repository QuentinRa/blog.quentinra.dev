=================================
Multiplication par une matrice
=================================

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