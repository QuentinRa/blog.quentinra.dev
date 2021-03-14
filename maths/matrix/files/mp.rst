===============================
Matrices remarquables
===============================

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

Matrice identité ou unité
*************************************

La matrice identité est une matrice :math:`Id_n` tel que :math:`A_n * Id_n = Id_n * A_n = A_n`.

Il s'agit d'une matrice diagonale, avec uniquement des 1 sur la diagonale.

Matrices triangulaires
******************************

Une matrice triangulaire est soit:

	* inférieure (TI) : la diagonale vaut 1, au dessus on a des 0, et en dessous des valeurs.
	* inférieure stricte (TIS) : TI mais diagonale vaut 0.
	* supérieure (TS) : la diagonale vaut 1, en dessous que des 0, et au dessus des valeurs.
	* supérieure stricte (TSS) : TS mais diagonale vaut 0