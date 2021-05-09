=================================
Algo du Simplexe (Les 2 phases)
=================================

Cette partie concerne le cas dans lequel vous avez des variables artificielles/écart
négatives.

Il faudra ajouter des variables :math:`A_i` pour chaque variables artificielles, donc
dans chaque équation avec une variable d'écart négative. Ensuite vous allez devez
maximiser une fonction

.. math::

	\min z' = \sum_{i=1}^{n} A_i

avec vos variables :math:`A_i` dans la base ainsi que les autres variables artificielles
positives.

On va ensuite résoudre un problème du simplexe en retirant les colonnes :math:`A_i` dès que
l'une sort de la base, l'objectif étant de toutes les sortir.

Une fois ceci fait, vous devez réécrire la dernière ligne avant de continuer
sur la phase2 qui est simplement la méthode du simplexe normal.

Pour trouver la dernière ligne
vous devez exprimer vos équation :math:`f(z)` en remplaçant vos variables
par leur valeur sur une ligne du tableau puis en supprimant leur existence avec leur valeur
dans b. En clair

	* vous devez exprimer :math:`f(z)` en fonction des variables hors base
	* donc on remplace chaque variable par son expression dans la matrice
	* mais certaines variables ont un coeff 1 devant leur nom, alors qu'elles sont dans la base
	* donc cette fois on les remplacent par leur valeur dans b
	* enfin on mets toutes les valeurs qui ne sont pas des coefficients à gauche (fin d'un côté)
	* ces valeurs donc la somme devient :code:`R`
	* on remplace dans la dernière ligne les coefficient avec ceux de notre nouvelle équation de :math:`f(x)`

Et vous devez maintenant faire la phase 2 avec ce nouveau tableau, c'est un algorithme
du simplexe normal cette fois sans les variables :math:`A_i` que vous avez fait disparaître.