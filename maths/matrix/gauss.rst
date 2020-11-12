==============================
4. Pivot de gauss - Exemple
==============================

.. math::

		\left \{
		\begin{array}{r c l}
		0 - x_2 + 2x_3 + 13x_4 = 5 \\
		x_1 - 2x_2 + 3x_3 + 17x_4 = 4 \\
		-x_1 + 3x_2 - 3x_3 - 20x_4 = -1 \\
		\end{array}
		\right .

.. math::

		\ \begin{pmatrix}
		\ 0 & -1 & 2 & 13 & 5 \\
		\ 1 & -2 & 3 & 17 & 4 \\
		\ -1 & 3 & -3 & -20 & -1
		\end{pmatrix}

Opération : :math:`L_1 \iff L_2`

.. math::

		\ \begin{pmatrix}
		\ 1 & -2 & 3 & 17 & 4 \\
		\ 0 & -1 & 2 & 13 & 5 \\
		\ -1 & 3 & -3 & -20 & -1
		\end{pmatrix}

Opération : :math:`L_3 = L_3 + L_1`

.. math::

		\ \begin{pmatrix}
		\ 1 & -2 & 3 & 17 & 4 \\
		\ 0 & -1 & 2 & 13 & 5 \\
		\ 0 & 1 & 0 & -3 & 3
		\end{pmatrix}

Opération : :math:`L_3 = L_3 + L_2`

.. math::

		\ \begin{pmatrix}
		\ 1 & -2 & 3 & 17 & 4 \\
		\ 0 & -1 & 2 & 13 & 5 \\
		\ 0 & 0 & 2 & 10 & 8
		\end{pmatrix}

La matrice est échelonnée

Opération : :math:`L_3 = L_3/2`

.. math::

		\ \begin{pmatrix}
		\ 1 & -2 & 3 & 17 & 4 \\
		\ 0 & -1 & 2 & 13 & 5 \\
		\ 0 & 0 & 1 & 5 & 4
		\end{pmatrix}

Opération : :math:`L_3 = L_1/-1`

.. math::

		\ \begin{pmatrix}
		\ 1 & -2 & 3 & 17 & 4 \\
		\ 0 & 1 & -2 & -13 & -5 \\
		\ 0 & 0 & 1 & 5 & 4
		\end{pmatrix}

Opération : :math:`L_1 = L_1 - 3 L_3`
Opération : :math:`L_2 = L_2 + 2 L_3`

.. math::

		\ \begin{pmatrix}
		\ 1 & -2 & 0 & 2 & -8 \\
		\ 0 & 1 & 0 & -3 & 3 \\
		\ 0 & 0 & 1 & 5 & 4
		\end{pmatrix}

Opération : :math:`L_1 = L_1 + 2 L_2`

.. math::

		\ \begin{pmatrix}
		\ 1 & 0 & 0 & -4 & -2 \\
		\ 0 & 1 & 0 & -3 & 3 \\
		\ 0 & 0 & 1 & 5 & 4
		\end{pmatrix}


| x1, x2 et x3 sont des inconnues (le 1 se trouve dans leur colonne)
| x4 est un paramètre

.. math::

		x1 = -2 + 4 * x4 \\
		x2 = 3 + 3 * x4 \\
		x3 = 4 - 5 * x4 \\