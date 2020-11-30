====================================================
5. Coloration - Coloration de sommets
====================================================

L'objectif est de colorier un graphe avec un minimum de couleurs
tel que deux sommets incidents ont une couleur différente.

nombre chromatique
		On note :math:`\gamma(G)` (gamma) ou :math:`\chi(G)` (chi) le nombre chromatique soit le nombre
		minimum de couleurs requises pour colorier le graphe.

:math:`\gamma(G)` est difficile à trouver, mais on peut l'approcher
	* si un graphe n'est pas planaire, :math:`\gamma(G)=|V|`
	* si un graphe est stable, :math:`\gamma(G)=1`
	* si un graphe est complet, :math:`\gamma(G)=|V|`
	* si un graphe est planaire, :math:`\gamma(G) \le 4`
	* minorant : :math:`\gamma(G) \ge |clique maximum|` (taille d'une clique maximum = ordre)
	* majorant : :math:`\gamma(G) \le d_max(G)+1`

Algorithme glouton de Welsh-Powell
	.. code::

		Je trie les sommets par degré décroissants.
		Tant que tous les sommets ne sont pas coloriés,
			Je prends une couleur et colorie tous les sommets à condition
			qu'il ne soit pas voisins d'un sommet que je viens de colorier
			de cette couleur.

.. note::

	Pour savoir si c'est la solution optimale, on compare la nombre chromatique
	au minorant.

Algorithme Reliement-contraction
	Les opérations sont

		* On contracte = fusion deux sommets ayant la même couleur
		* On relie = ajoute une arrête, si deux sommets sont de couleur différente

	L'idée est :

	.. code::

		1: Jusqu'à ce que toute nos sous-graphes soient des cliques
			2: On créée deux sous-graphe (sur une des arrêtes manquantes) :
				- un obtenu par reliement
				- un obtenu par contraction

		Le degré de la plus petite clique est le nombre chromatique.
		Les sommets ensembles (contractés) sont de la même couleur.

	.. note::

		2^m possibilités, avec m le arrêtes manquantes au graphe de départ pour qu'il
		soit complet donc complexité exponentielle.
