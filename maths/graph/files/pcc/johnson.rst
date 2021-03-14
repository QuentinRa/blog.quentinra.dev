=======================
Algorithme de Johnson
=======================

De ce que j'ai compris, si la graphe contient un cycle négatif, on arrête, sinon

	* on ajoute un sommet q
	* on le relie à tous les autres (poids = 0)
	* on calcule bellman-ford entre q et chaque sommet
	* on obtient un tableau de n distances, noté h[]

On sait que pour aller au point X depuis q, on a mis la plus courte distance dans h[X].
Sachant un sommet Y allant vers X, on va changer la valeur
de l'arête :code:`w(X,Y)` avec :code:`w(X,Y) = w(X,Y) + h[X] - h[Y]`.

En clair, sachant une arête entre A et B valent 5. Sachant une plus petite
distance entre q et A de h[A]=3 et une plus petite distance entre
q et B de h[B]=2 alors la nouvelle valeur de l'arête est :code:`w(A,B) = 5 + 3 - 2 = 6`.

	* enfin, on calcule le plus court chemin avec l'algorithme de Dijkstra