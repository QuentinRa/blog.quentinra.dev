======================================
Matrice d'un système linéaire
======================================

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

	Par exemple le système, à regarder après avoir étudié la résolution via le pivot de GAUSS

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