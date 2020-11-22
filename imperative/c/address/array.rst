================================================================
7. Adresses et tableaux dynamiques - Tableau dynamique
================================================================

Un tableau [] est en fait une adresse : tab[0] <=> \*(tab+0).

.. code:: c

		int tab[3] = {1,2,3};
		//l'adresse de tab est celle du premier élément
		printf("%p", &tab); //affiche 0x7563193
		printf("%p", &tab[0]); //affiche 0x7563193
		printf("%d", tab[0]); //affiche 1
		printf("%d", *tab); //affiche 1
		printf("%d", *(tab+0)); //affiche 1
		printf("%d", *(tab+1)); //affiche 2

Si on ne connait pas les éléments donc la taille du tableau, on peut réserver de l'espace en mémoire.
On parle d'allocation dynamique.

.. code:: c

		// Création du conteneur
		double *futur_tableau;

		// allocation, on demande taille éléments, chaque élément fait sizeof(double) de taille
		// dans la mémoire (double, car c'est un tableau de double=réels).
		futur_tableau = (double*) malloc(taille*sizeof(double));

		// alternativement via calloc (comme malloc, mais mets 0 dans chaque case)
		futur_tableau = (double*) calloc(taille*sizeof(double));

		// déplacer le tableau alloué vers un tableau plus grand
		futur_tableau = (double*) realloc(futur_tableau, nouvelle_taille*sizeof(double));

		// libération de la mémoire/du tableau si plus besoin
		free(futur_tableau);