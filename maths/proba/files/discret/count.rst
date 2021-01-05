============================================
Dénombrer un ensemble de possibilités
============================================

Soit E un ensemble et \|E\| = k. Soit n le nombre d'éléments choisis dans E.

**Tirage dans l'ordre**

| :code:`Formule` : :math:`k! / (k-n)!`
| :code:`Formule (k=n)` : :math:`k!`

.. code:: c

		//a chaque fois qu'une valeur est tirée, elle est retirée
		//donc le nombre de de valeurs possibles (k) diminue de 1
		Donc : k * (k-1) * ... * (k-n+1) tirages possibles
		//on reconnait la factorielle donc
		k! / (k-n)! = Arrangement(n, k)

		//si n=k; alors il y a k! permutations

**Tirage dans l'ordre avec remise**

:code:`Formule` : :math:`k^n`

.. code:: c

		//chaque valeur peut être tirée n fois car n tirages
		Donc: k ^ n tirages possibles
		// k éléments ont n endroits où être choisis
		// attention a pas inverser ^^

**Tirage sans ordre**

:code:`Formule` : :math:`k!/(k-n)! * n!`

.. code:: c

		//il s'agit du nombre de tirages possibles sur le nombre de permutations
		//n=3, [0,1,2] il existe 3! façon d'écrire cette ensemble = nombre de permutations
		k! /(k-n)! n!

**Tirage sans ordre avec remise**

:code:`Formule` : :math:`Combinaisons(k-1, n+k-1) = (n+k-1)!/(k-1)!n!`

.. code:: c

		Combinaisons(k-1, n+k-1) = (n+k-1)!/(k-1)!n! = Combinaisons(n, n+k-1)
		//Explication: soit n = tirages = 2, on veut au minimum 0 fois un élément, |E|=cardinal=k=3
		//donc on peut écrire le nombre de tirage de chaque élément comme suit :
		n1 /* tirages de l'élément 1 */ + n2 + ... + nk = n, avec ni >= 0
		ici : n1 + n2 + n3 = 2, avec ni >= 0
		//on cherche donc le nombre de combinaisons de soit k-1, n+k-1
		ici: Combinaisons(3-1, 2+3-1) = 6

		//il se pouvait que par exemple on veuille au moins 1 fois  n2, il n'y aurait
		//donc plus n tirages mais n - le tirage de n2 soit ici n=1