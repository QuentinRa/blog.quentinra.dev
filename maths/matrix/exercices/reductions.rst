================================
Réductions d'endomorphisme
================================

Niveau débutant
***********************

1/1 Calculs d'espaces propres
--------------------------------

Pour chacun des matrices suivantes, calculer **le polynôme caractéristique**, puis déterminer les
**valeurs propres** et les **espaces propres** associés.

.. math::

		A_1 = \begin{pmatrix}
		1 & 2  \\
		2 & 4
		\ \ \ \ \ \ \end{pmatrix}
		A_2 = \begin{pmatrix}
		3 & -1 \\
		1 & 1
		 \end{pmatrix}
		\\ \\
		A_3 = \begin{pmatrix}
		9 & -6 & 2 \\
		0 & 1 & 0 \\
		-40 & 30 & -9
		\ \ \ \ \ \ \end{pmatrix}
		A_4 = \begin{pmatrix}
		1 & 4 & 6\\
		0 & 2 & 5 \\
		0 & 0 & 3
		 \end{pmatrix}

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<reductions/d1>

Niveau avancé
***********************

1/2 Applications aux suites définies par récurrences linéaires
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

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<reductions/a1>

2/2 Réduction d'endomorphisme et récurrences linéaires
--------------------------------------------------------

Calculer :math:`A^n` pour les suites suivantes en utilisant la réduction d'endomorphisme
puis exprimer :math:`U_n` en fonction de n uniquement.

.. math::

		S_1 \begin{cases} u_0 = 1\\u_1 = -2\\u_2 = 2\\u_{n+3} = 6u_{n+2}-11u_{n+1}+6u_{n}, pour \ n  \geq 0\end{cases}
		S_2 \begin{cases} u_0 = 0 \\ u_1 = 3\\ u_{n+2} = u_{n+1}+2u_{n} \ pour \ n  \geq 0\end{cases}
		\\
		S_3 \begin{cases} u_0 = 2\\ v_0 = 1\\ U_{n+1} = U_{n}-2V_{n} \ pour \ n  \geq 0\\V_{n+1} = V_{n}-2U_{n} \ pour \ n  \geq 0 \end{cases}

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<reductions/a2>

Niveau supérieur
***********************

aucun

|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)