================================================================
2. Spécificité du C - Afficher un résultat
================================================================

La fonction de :code:`stdio.h` appelée :code:`printf` permet d'afficher
quelque chose.

Elle est de la forme : :code:`printf("texte", valeur, valeur, ...);`.

	*
		texte désigne du texte normale, mais aussi des caractères qui seront remplacés
		par la valeur des variables. Vous avez la liste des la partie type et la partie librairie

	* valeur, ... sont un certain nombre de valeurs par lesquels les caractères spéciaux seront remplacés

Par exemple pour afficher, mon age est ... <CR> (<CR> = saut de ligne) avec ... une valeur de l'age
pouvant changer, on affiche

.. code:: c

	printf("mon age est %d \n", age); // avec age la valeur de l'age
