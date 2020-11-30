=====================================================================
4. Graphes eulérien et graphes hamiltoniens - Graphes eulérien
=====================================================================

Graphe hamiltonien
	Un graphe est hamiltonien s'il possède un cycle hamiltonien, soit un cycle
	qui passe une et une seule fois par chaque sommet.

Graphe semi-hamiltonien
	Un graphe est semi-hamiltonien s'il possède une chaine hamiltonienne, soit une chaine
	qui passe une et une seule fois par chaque sommet.

Algorithme
	Il n'existe pas d'algorithme capable de trouver un graphe hamiltonien
	en temps correct, cependant un graphe est forcément hamiltonien si

		* graphe d’ordre n>=3 et tous sommets degré >= n/2
		* graphe d’ordre n>=3 et x,y non adjacents d(x)+d(y)>=n