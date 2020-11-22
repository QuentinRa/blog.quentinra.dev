================================================================
9. Autres notions - Piles, Files et Listes
================================================================

Une **pile** est un empilement d’élément dont le dernier empilé
est le premier dépilé. **Toutes les méthodes et types sont a coder vous même**.

.. code:: c

		//type
		typedef struct s_pile {
			int taille;
			int valeur;
			struct s_pile* suivant;
			struct s_pile* top;
		} pile;

		// ajoute un élément à la pile
		push(pile* p, int valeur) ;
		//retourne la dernière valeur ajoutée et la retire de la pile
		int pop(pile p);
		//nous dit si une pile est vide.
		int empty(pile* p) ;
		// renvoi la valeur du top
		int top(pile p) ;
		//renvoi booléen si pile pleine
		int is_full(pile p);
		//vide la pile
		int clear(pile *p);

Pour une **File**, le principe reste le même sauf que les valeurs les plus anciennes
sont les premières à être retournées.

.. code:: c

		//met a la fin de la liste
		enqueue(file *f,int valeur) ;
		//renvoi et retire la première valeur
		dequeue(file *f) ;
		// renvoi la première valeur de la file
		int first(file* p);
		//nous dit si une file est vide.
		int empty(file* p);
		//vide la pile
		int clear(file* p);

Une **liste chainée** est une liste dans laquelle chaque élément contient une valeur et l'adresse de son suivant.
Dans une **liste doublement chainée**, chaque élément pointe aussi sur son précédent.
Pour indiquer l'absence d'un suivant/précédent, on mets la valeur NULL.

.. image:: /assets/imperative/c/liste2.png

.. code:: c

		// type
		typedef struct s_maillon {
		 type element ;
		 struct maillon_s* precedent;
		 struct maillon_s* suivant;
		} maillon;

		typedef maillon* liste;

		// Création d'une liste
		liste *liste_chainee=NULL ;
		maillon *premier;
		premier = creer_maillon(valeur, NULL) ;
		for (maillon * i = premier; condition ; i=i->suivant){
		 i->suivant = creer_maillon(valeur, i /* précédent*/);
		}
		liste_chainee = &premier; // comme pour les tableaux, on garde le premier élément

		// fonction de création d'un maillon
		creer_maillon(int valeur, maillon * precedent){
		 maillon *element = (maillon*) malloc(sizeof(maillon));
		 element->element = valeur;
		 element->precedent = precedent;
		 element->suivant = NULL;
		}