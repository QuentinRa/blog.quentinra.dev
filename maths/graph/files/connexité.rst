====================================================
2. Définitions avancées - Connexité
====================================================

Connexe
	Un graphe est connexe s'il est composé d'une seule composante connexe.

Composante connexe
	Une composante connexe est un sous-graphe dans lequel on a un chemin qui passe par tous les sommets.

	.. warning::

		Une composante connexe est maximale c'est à dire qu'on ne peux pas ajouter un autre sommet
		et toujours obtenir un chemin.

	Algorithme

	.. code-block::

		On part d'un sommet choisi.
		Soit Ci la composante connexe i et i = 0.

		Tant qu'il reste des sommets

			On ajoute notre sommet dans Ci.
			Tant qu'un sommet dans Ci à des voisins qui ne sont pas dans Ci, alors on les mets.

		i=i+1

Forté connexité (f-connexe)
	Un graphe est dit fortement connexe lorsqu'il est possible depuis chaque sommet d'atteindre
	n'importe quel autre.

	Algorithme

	.. code-block::

		On prends un sommet au hasard et on le marque + et -.

		On marque tous ses ses successeurs (partent) par +, tant que c'est possible.

		On note tous ses prédécesseurs (arrivent) par -, tant que c'est possible.

		Tous les sommets marqués par + et - forment une composante fortement connexe. Si tous les sommets
		sont dans la composante fortement connexe, alors le graphe est connexe.

	.. note::

		Une composante fortement connexe est un sous-graphe maximal fortement-connexe

Graphe réduit
	Il s'agit d'un graphe, dont les sommets sont les composantes fortement connexes
	d'un graphe

Isthme
	On appelle isthme une arrête telle que la retirer rends le graphe non connexe.
