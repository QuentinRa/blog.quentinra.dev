===========================
Factorisation LU
===========================

:code:`Prérequis` : mineurs de A non nuls
	Moi je test juste inversible mais il faut normal calculer le déterminant en utilisant
	le calcul par développement et vérifier que toutes les valeurs de la forme : valeur * sous-matrice
	sont non nulles.

:code:`Résultat` : :math:`A = LU` avec L matrice triangulaire inférieure
et U matrice triangulaire supérieure.

On va reporter sur une matrice identité U toutes les opérations faites sur A pour l'échelonner (et donner
une matrice L).

Notez que l'une des deux matrices (généralement U) n'a que des 1 sur sa diagonale et
l'autre que des valeurs non nulles.

**Outils**

	* https://www.dcode.fr/mineurs-matrice
	* https://mxncalc.com/lu-factorization-calculator