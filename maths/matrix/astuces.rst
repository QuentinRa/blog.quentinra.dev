.. _matrix_astuce:

================================
Astuces de calcul
================================

Opérations sur les matrices
===============================

*
	Si A est une matrice diagonale, alors le calcul revient à faire à multiplier chaque colonne
	par le coefficient la la diagonale.

* Si la matrice est diagonale identité inversée, alors les lignes sont échangées.

*
	Pour A*B, si pour passer d'une colonne de B à une autre, on multiplie par k, alors
	pour passer d'une colonne à une autre à la ligne i de A,B on multiplie par :math:`m_i=\sum_{j}^{} k * a_{ij}`

Calcul de déterminant
===============================

Si on a une matrice avec sommet haut gauche qui vaut 1, et les valeurs de sa ligne 0, alors
on peut se limiter à calculer le déterminant en excluant la ligne et la colonne du sommet haut gauche.

Donc dans l'exemple suivant, det(A) = det(A\').

.. math::

		A = \begin{pmatrix}
		1 & 0 &  \ldots  & 0\\
		\vdots  & A' &  \ldots &  \ldots  \\
		* &  \vdots  &  \ddots &     \\
		\vdots &  \vdots  &   &     \\
		\end{pmatrix}


|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)