.. _determinant:

============================
Calcul du déterminant
============================

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

Calcul par développement
***************************

* on prends notre matrice A
* on choisi une ligne/colonne (généralement celle avec les plus gros coefficients)
*
	on met les coefficients choisi avec + puis - puis + ... suivit du calcul du déterminant
	pour la matrice restant, après avoir retiré la ligne+colonne dans laquelle se trouvait la valeur.

Soit la matrice :math:`M1\ \begin{pmatrix}{-1} & 4 & -7 \\{2} & -5 & 8 \\{-3} & 6 & -9\end{pmatrix}`,
on va prendre la colonne :math:`\begin{pmatrix} -7 \\ 8 \\ -9\end{pmatrix}` car elle a les plus gros coefficients.

.. math::

	det(M_1) = \color{red}{+} -7 * det(\begin{pmatrix} 2 & -5 \\ -3 & 6 \end{pmatrix})
	\color{red}{-} 8 * det(\begin{pmatrix} -1 & 4 \\ -3 & 6 \end{pmatrix})
	\color{red}{+} -9 * det(\begin{pmatrix} -1 & 4 \\ 2 & -5\end{pmatrix})

.. math::

		det(M_1) = -7 * -3 -8 * 6 -9 * -3 = 0

Il est important de noter les signes qui font +-+ (on alterne).

La matrice :math:`\begin{pmatrix} 2 & -5 \\ -3 & 6 \end{pmatrix}` est obtenue en supprimant la ligne et
la colonne de -7.

Calcul via pivot de gauss
***************************

Vous aurez les explications dans le partie matrice inverse.