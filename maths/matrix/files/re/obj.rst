============
Objectifs
============

On cherche à trouver une matrice P inversible et D diagonale telles que :math:`A^n = P * D^n * P^{-1}`.

:math:`A^n` consiste à mettre tous les coefficients d'une matrice diagonale à la puissance n.

:code:`exp(A)` consiste à faire exp(coefficient) pour chacun des coefficients d'une matrice diagonale.

:math:`A^n` et :math:`D^n` sont appelées matrices semblables.

L'objectif va être de calculer des valeurs propres, qui seront les coefficients de la matrice diagonale,
ainsi que de calculer P.

Il est possible que la réduction d'endomorphisme soit aussi appelé Théorème de Jordan (à confirmer?).