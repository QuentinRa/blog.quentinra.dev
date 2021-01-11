===========================
Factorisation de Cholesky
===========================

:code:`Prérequis` : Matrice symétrique définie positive A
	Une matrice est symétrique définie positive si toutes ses valeurs propres sont positives.

:code:`Résultat` : :math:`A = L^tL` avec :math:`L^t` matrice triangulaire supérieure
et L matrice triangulaire inférieure.

**Comment?**

Il faut appliquer les formules suivantes sur la partie triangulaire inférieure
de A (donc on prends la diagonale et en dessous et on fait les opérations
suivantes selon les cas ou on a ii ou ij).

.. math::

	l_{ki} = \frac{a_{ki} - \sum_{j=1}^{i-1} l_{ij} * l_{kj}}{l_{ii}}

	l_{kk}= \sqrt{a_{kk}- \sum_{j=1}^{k-1} l_{kj}^2}

En gros on commence par l11 qui vaut :math:`\sqrt{a_{11}}`. Ensuite
:math:`l_{i1} = \frac{a_{i1}}{l_{11}}` donc on a maintenant notre première colonne.
Pour calculer la seconde colonne, on fait pareil que pour l11 pour la première valeur
sauf qu'on aura un truc de la forme :math:`\sqrt{a_{ij} - l^2_{i,j-1} - ... l^2_{i,1}}`
et :math:`l_{ij} = \frac{a_{ij} - l_{i-1,j} * ... * l_{1,j}}{l_{jj}}`.

**Outils**

	* https://www.easycalculation.com/matrix/cholesky-decomposition-matrix.php
	* https://fr.mathworks.com/help/matlab/math/determine-whether-matrix-is-positive-definite.html
	* https://www.symbolab.com/solver/matrix-eigenvectors-calculator/eigenvectors%20%5Cbegin%7Bpmatrix%7D2%26-1%260%5C%5C%20-1%262%26-1%5C%5C%200%26-1%262%5Cend%7Bpmatrix%7D
	* https://www.atozmath.com/MatrixEv.aspx?q=choleskydecomp&q1=2%2c-1%2c0%3b-1%2c2%2c-1%3b0%2c-1%2c2%60choleskydecomp%60&dm=D&dp=8&do=1#PrevPart