=================
Matrice inverse
=================

Une inverse est une matrice notée :math:`A^{-1}` telle que :math:`A*A^{-1}=Id`. Une matrice ne possède
pas forcément un inverse. Une matrice dont le déterminant est différent de 0 est inversible.

On note :math:`Gl_n(R)` l'ensemble des matrices inversibles.

Il existe deux méthodes :
	* en utilisant GAUSS
	* en utilisant la co-matrice

Calcul d'inverse avec Gauss
****************************

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

Calcul via la co-matrice
**************************

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