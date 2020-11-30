=====================================================================
4. Graphes eulérien et graphes hamiltoniens - Graphes eulérien
=====================================================================

Graphes eulérien
	Un graphe est eulérien s’il est connexe et tous ses sommets sont de degré pair.
	Un graphe est eulérien s'il possède un cycle eulérien.

Cycle eulérien
	On passe une seule et unique fois par chaque arrête

Chaine eulérienne ou Cycle semi-eulérienne
	C'est un chaine qui passe par toutes les arrêtes une et une seule fois

	Un graphe est semi-eulérien s’il est connexe et que tous sauf 2 des sommets sont de degré pair.

	.. note::

		Il est dit "semi" eulérien car ajouter une arête le rends eulérien

Algorithme

	.. code-block::

		Prends un sommet au hasard.
		Tant qu'une arrête n'est pas un isthme et qu'il nous reste des arêtes à parcourir
			Ajoute à G l'arête parcourue
		G contient un cycle/une chaine eulérienne (en fonction de si sommet départ=sommet d'arrivée)

* Rappel: un isthme est une arête qui rends un graphe connexe non connexe si elle est retirée.