=====================================
1. Contrôle MTG 2020 ENSIIE
=====================================

Exercice 1. Généralités sur les graphes - 10 points
----------------------------------------------------

.. image:: /assets/math/graph/annales/c/ctrl0.png

1. Écrire la matrice d’adjacence du graphe G.
2. Donner un sous-graphe, un graphe partiel, et un sous-graphe partiel de G.
3. En utilisant l’algorithme de Roy-Warshall, trouver la fermeture transitive du graphe G.
4. Le graphe G est-il fortement connexe ? Justifier.
5. Donner le graphe réduit du graphe G.
6. Quelles sont les tailles d’un stable maximum et d’une clique maximum dans la fermeture transitive du graphe G. Justifier
7. Le graphe G contient-il un chemin hamiltonien ? si oui, lequel ?

8.

	Montrer qu’un graphe G=(V, E) contenant un chemin hamiltonien accepte une partition
	minimum P de ses sommets en cliques telle que la partie entière de V/2 soit supérieure ou égale a P.

9.

	Ajouter des arcs aux graphes G\′ et G\′\′ tels que G\′ et G\′\′ soient τ-minimal τ-équivalent
	au graphe K5 et G\′\′ possède strictement moins d’arc que G\′

.. image:: /assets/math/graph/annales/c/ctrl1.png

Exercice 2 — Grundy
-------------------------

Soit la matrice d’adjacence suivante d’un graphe de 9 sommets numérotés de 0 à 8.

.. image:: /assets/math/graph/annales/c/ctrl2.png

1. Calculer la fonction de Grundy. Est-elle unique et pourquoi ? On attend un argument général.
2. Donner le noyau du graphe.

3.

	Ce graphe est le graphe d’état d’un jeu à deux joueurs. Le jeu commence en l’état 0. Il
	se termine en l’état 8. Le joueur qui, au moment de jouer, se trouve sur l’état 8 a perdu.
	Donner la stratégie gagnante pour le joueur qui commence.

4. Donner un argument général qui pourrait s’appliquer sur un graphe plus grand.

Exercice 3 — Maximiser une fonction polynomiale en variables 0-1 - 4 points
----------------------------------------------------------------------------------------------------

.. image:: /assets/math/graph/annales/c/ctrl3.png

1.
	Construire un graphe d’exclusion dont les sommets sont les monômes de f(x) et tel qu’il
	existe une arête entre 2 monômes si et seulement s’ils ne peuvent valoir 1 en même temps

2.
	On veut trouver la valeur maximum que peut prendre f(x).
	Montrer que l’on peut résoudre ce problème par la recherche d’un stable de poids maximum dans le graphe d’exclusion.
	Construire le graphe, préciser où sont les poids et leurs valeurs, résoudre le problème à partir du graphe.