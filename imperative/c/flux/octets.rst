================================================================
8. Flux et Fichiers - Manipulation de flux d'octets
================================================================

Lecture
	.. code:: c

		int read(buffer, taille_un_element, taille_a_lire);
		int fread(buffer, taille_un_element, taille_a_lire, flux);

Écriture
	.. code:: c

		int write(a_ecrire, taille_d_un_element, taille_a_ecrire);
		int fwrite(a_ecrire, taille_d_un_element, taille_a_ecrire, flux) ;

On utilise :code:`sizeof(type)` pour obtenir la taille d'un type, cependant
le résultat peut être faussé si le type est une structure.

Toutes ces fonctions retournent le nombre d'éléments lus/écrits.