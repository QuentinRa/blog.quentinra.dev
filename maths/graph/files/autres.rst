====================================================
2. Définitions avancées - Autres
====================================================

Isomorphe
	Deux graphes sont isomorphes si on peut obtenir la même représentation en déplaçant
	des arrêtes

Couplage d'un  graphe
	Sous-ensemble d'arêtes de G tel que 2 arrêtes sont non adjacentes.

	| Maximal : on ne peut pas ajouter une arête sinon c'est plus un couplage
	| Maximum : il n'existe pas de couplage plus grand
	| Parfait : tous les sommets sont reliés à une arrête dans le couplage

	Algorithme

		.. code::

			1: On prends un arrête.
				2: On supprime toutes les autres arrêtes liées à l'un des sommet de notre arrête
				3: On refait 1
			4: Le couplage maximal est l'ensemble des arrêtes prises en 1.