============================
6. Arbres - couverture
============================

Arbre couvrant
	Soit T un arbre couvrant de G, alors T est un graphe partiel connexe
	et sans cycle de G soit un graphe partiel qui est arbre.

	Ce graphe partiel n'existe que si G est connexe.

	Les arêtes retirées pour obtenir le graphe partiel forment
	une base de cycles.

Arbre couvrant de poids minimum (ACM)
	Soit un graphe **donné** non orienté connexe et ayant des arêtes pondérées donc
	avec une valeur/un poids.

	Un Arbre couvrant de poids minimum (ACM) est arbre couvrant donc la somme des poids
	des arêtes est minimale.

	Algorithme de Kruskal

		.. code:: none

			On colorie tous nos sommets.
				Tant qu'on peut toujours ajouter des arrêtes sans créer de cycle
					On prends les arrêtes avec les plus petit poids
						si on ne crée pas de cycle, on ajoute l'arête
						puis on recommence avec les nouvelles arêtes au plus petit poids


	Algorithme de Prism

  		.. code:: none

  			1: On prends un sommet.
  				2: On ajoute toutes les arrêtes de notre sommet
  					3: On garde l'arrête de poids minimal qui ne crée pas de cycle
  						4: On continue mais en ajoutant les nouvelles arrêtes de notre nouveau sommet
  						et on recommence 3: