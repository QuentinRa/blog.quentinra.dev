================================================================
7. Adresses et tableaux dynamiques - Exemple d'adressage
================================================================

.. code:: c

		int a; // création d'un entier à une adresse
		a = 5; // la case pointée par a contient la valeur 5
		// adresse de la case pointée par a
		printf("%p", &a); // affiche une valeur par exemple Ox15612349

		// par défaut, les paramètres d'une fonction sont passés par valeur
		// donc une nouvelle case est crée avec la valeur de a, et modifier a,
		// ne modifie donc pas notre a.

		// Pour modifier notre a, il faut passer l'adresse de la case
		int modification(int *a){
			*a = 7;// si on fait a=7, alors on revient au problème de départ, c'est le
			// a de la fonction qui est modifié, pas notre a.
			// *a correspond à la valeur stockée à l'adresse contenu dans a.
		}
		modification(&a);
		//ici a=7