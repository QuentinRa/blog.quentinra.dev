================================================================
9. Autres notions - Structures
================================================================

Une structure, un enregistrement ou encore un record est
un nouveau type qui est composé d'un ou plusieurs types dit primitifs.

.. code:: c

		//Déclaration d'une structure simple
		struct nom {
			type1 nom1;
			type2 nom2;
			...
		};

		//utilisation
		struct nom a;//type: struct nom

		//renommer
		typedef struct nom nouveau_nom;

		//utilisation
		nouveau_nom b;

		//créer et renommer
		typedef struct nom {
			type1 nom1;
			...
		} nouveau_nom;

		//utilisation
		nouveau_nom b;//type: struct nom OU nouveau_nom

Utilisation

.. code:: c

		//si la structure n'est pas une adresse
		nouveau_nom a;
		//on accède à la valeur avec .
		a.nom1 //ok
		//si la structure est une adresse
		nouveau_nom* c;
		//on récupère une valeur avec ->
		c->nom1 //ok
		//ou alors on récupère la valeur à l'adresse pointée
		(*c).nom1 //ok