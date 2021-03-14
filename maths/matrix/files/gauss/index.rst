=========================
4. Pivot de gauss
=========================

**Pour ceux qui veulent résoudre un système**

Le pivot de GAUSS permet de résoudre une équation matricielle. On pose un système,
on écrit une matrice telle que chaque colonne est une variable et chaque ligne une equation.
Après une barre | on met le second membre. On va effectuer des opérations
pour obtenir une matrice triangulaire supérieure qui nous donne les valeurs de nos variables.

.. math::

		\begin{cases}ax + by + ... = s1\\ax + by + ... = s2\\  ...  \end{cases}
		\Leftrightarrow
		\begin{pmatrix}a & b & ... & | s1 \\a & b & ... & | s2 \\  \cdots \end{pmatrix}
		\Leftrightarrow
		\begin{pmatrix}p_1 & v_1 & ... & | s1 \\0 & p_2 & ... & | s2  \\  \cdots \end{pmatrix}
		\Leftrightarrow
		\begin{cases}p_1 x = s1 + v_1 * s2 + ... \\ p_2 y = s2 + ...  \end{cases}

**La résolution**

L'objectif de Gauss est d'obtenir une matrice avec un nombre strictement croissant
de zéros. On appelle pivot, la première valeur non nulle d'une ligne.

On appelle la matrice résultant :code:`matrice échelonnée réduire` si les coefficients
de la diagonale valent tous 1, sinon on l'appelle seulement :code:`matrice échelonnée`.

Opérations possibles

	* permuter deux lignes : :math:`L_i \iff L_j`
	* faire une addition de lignes, multiplié par un facteur : :math:`L_i = aL_i + bL_j`
	* soustraire une ligne : :math:`L_i = L_i + -1 * L_j`

.. warning::

	Les opérations peuvent aussi êtres faites sur des colonnes, mais vous ne pouvez pas changer
	en cours d'échelonnage.

	Notez également que permuter des lignes n'est pas recommandé (en analyse numérique, les calculs peuvent
	être faux si vous avez permuté des lignes).
