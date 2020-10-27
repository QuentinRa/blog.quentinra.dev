================================
Exercices non triés
================================

1/3 Calcul matriciel et interpolation polynomiale
---------------------------------------------------

On considère le polynôme :math:`P(x) = ax^3+bx^2+cx+d` et la matrice
:math:`A = \begin{pmatrix}1&0&0&0 \\1&-1&1&-1\\1&1&1&1\\1&2&4&8\end{pmatrix}`

| 1.1 Calculer P(-1), P(0), P(1) et P(2)
| 1.2 Calculer :math:`A \begin{pmatrix}d\\c\\b\\a\end{pmatrix}` et comparer avec le résultat de 1.1.
| 1.3 Calculer det(A) afin de vérifier qu'il est non nul, puis calculer :math:`A^-1`
| 1.4 En déduire les coefficients P(x) sachant que P(0)=p(1)=2 et P(-1)=P(2)=6.

2/3 Applications aux suites définies par récurrences linéaires
-----------------------------------------------------------------

On considère la suite :math:`(U_n)_{n \in \mathbb{N}}` définie par
:math:`\begin{cases} u_0 = 0\\u_1 = 1\\ \forall{n  \geq 2}, u_n = 5u_{n-1} - 6u_{n-2} \end{cases}`.

|
	2.1 Soit :math:`A = \begin{pmatrix}0&1\\-6&5\end{pmatrix}`. Vérifier :math:`\forall n \in \mathbb{N}^*`,
	on a :math:`\begin{pmatrix}U_n\\U_{n+1}\end{pmatrix} = A \begin{pmatrix}U_{n-1}\\U_n\end{pmatrix}`
| 2.2 Calculer les valeurs propres de A et les espaces propres associés.
| 2.3 En déduire une matrice P et une matrice diagonale D telles que :math:`A = PDP^{-1}`
| 2.4 Grâce à la question précédente, calculer :math:`A^n` pour :math:`n \in \mathbb{N}`.
| 2.5 En déduire la valeur de :math:`U_n` en fonction de n uniquement

3/3 Réduction d'endomorphisme et récurrences linéaires
--------------------------------------------------------

Calculer :math:`A^n` pour les suites suivantes en utilisant la réduction d'endomorphisme
puis exprimer :math:`U_n` en fonction de n uniquement.

.. math::

		S_1 \begin{cases} u_0 = 1\\u_1 = -2\\u_2 = 2\\u_{n+3} = 6u_{n+2}-11u_{n+1}+6u_{n}, pour \ n  \geq 0\end{cases}
		S_2 \begin{cases} u_0 = 0 \\ u_1 = 3\\ u_{n+2} = u_{n+1}+2u_{n} \ pour \ n  \geq 0\end{cases}
		\\
		S_3 \begin{cases} u_0 = 2\\ v_0 = 1\\ U_{n+1} = U_{n}-2V_{n} \ pour \ n  \geq 0\\V_{n+1} = V_{n}-2U_{n} \ pour \ n  \geq 0 \end{cases}
|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)