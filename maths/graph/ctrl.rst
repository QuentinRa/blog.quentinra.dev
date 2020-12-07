=====================================
Contrôle de Graphes - 07/12/2020
=====================================

Ramsamy\-\-Ageorges_Quentin_071865278JC

Exercice 1. Généralités sur les graphes - 10 points
----------------------------------------------------

1. Écrire la matrice d’adjacence du graphe G.

La matrice d'adjacence si on ne considère que les arcs sortants est

.. math::

		\begin{pmatrix}
		& a&b&c&d&e&f\\
		a & 0&0&1&0&0&0\\
		b & 1&0&0&0&0&0\\
		c &0&1&0&0&1&0\\
		d &0&1&1&0&0&1\\
		e &1&0&0&1&0&1\\
		f &1&1&0&0&0&0
		\end{pmatrix}

2.  Donner un sous-graphe, un graphe partiel, et un sous-graphe partiel de G.

Un sous graphe : on retire des sommets

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->c;
		b->a;
		c->b;
		d->b;
		d->c;
	}

Un graphe partiel : on retire des arêtes

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->c;
		b->a;
		c->e;
		d->f;
		d->c;
		e->a;
		e->d;
		f->b;
		f->a;
	}

Un sous-graphe partiel : sous-graphe mais on retire des arêtes

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->c;
		c->b;
		d->b;
	}

3. En utilisant l’algorithme de Roy-Warshall, trouver la fermeture transitive du graphe G.

.. code:: none

	| On prends A
	 | On check successeur C
	  | prédécesseur B : on créé (b,c)
	  | prédécesseur E : on créé (e,c)
	  | prédécesseur F : on créé (f,c)
	| On prends B
	 | on check successeur A
	  | On check prédécesseur C : on créé (c,a)
	  | On check prédécesseur F : f,a existe donc on passe
	  | On check prédécesseur D : on créé (d,a)
	 | on check successeur C
	  | (On ne pas check prédécesseur C)
	  | On check prédécesseur F : f,c existe donc on passe
	  | On check prédécesseur D : d,c existe donc on passe
	| On prends C
	 | on check successeur B
	  | On check prédécesseur A : ajoute (a,b)
	  | (On ne pas check prédécesseur B)
	  | On check prédécesseur D : existe déjà (d,b)
	  | On check prédécesseur E : ajoute (e,b)
	  | On check prédécesseur F : existe déjà (f,b)
	 | on check successeur E
	  | On check prédécesseur A : ajoute (a,e)
	  | On check prédécesseur B : ajoute (b,e)
	  | On check prédécesseur D : ajoute (d,e)
	  | (On ne pas check prédécesseur E)
	  | On check prédécesseur F : ajoute (f,e)
	| On prends D
	 | on check successeur A
	  | On check prédécesseur E : existe déjà (e,a)
	 | on check successeur B
	  | On check prédécesseur E  : existe déjà (e,b)
	 | on check successeur C
	  | On check prédécesseur E  : existe déjà (e,c)
	 | on check successeur E
	  | On ne check pas prédécesseur E
	 | on check successeur F
	  | On check prédécesseur E  : existe déjà (e,f)
	| On prends E
	 | on check successeur A
	  | on check successeur A
	  | On check prédécesseur B  : existe déjà (b,a)
	  | On check prédécesseur C  : ajoute (c,a)
	  | On check prédécesseur D  : existe déjà (d,a)
	  | On check prédécesseur F  : existe déjà (f,a)
	 | on check successeur B
	  | On check prédécesseur A  : existe déjà (a,b)
	  | on check successeur B
	  | On check prédécesseur C  : existe déjà (c,b)
	  | On check prédécesseur D  : existe déjà (d,b)
	  | On check prédécesseur F  : existe déjà (f,b)
	 | on check successeur C
	  | On check prédécesseur A  : existe déjà (a,c)
	  | On check prédécesseur B  : existe déjà (b,c)
	  | on check successeur C
	  | On check prédécesseur D  : existe déjà (d,c)
	  | On check prédécesseur F  : existe déjà (f,c)
	 | on check successeur D
	  | On check prédécesseur A  : ajout (a,d)
	  | On check prédécesseur B  : ajout (b,d)
	  | On check prédécesseur C  : ajout (c,d)
	  | on check successeur D
	  | On check prédécesseur F  : ajout (f,d)
	 | on check successeur F
	  | On check prédécesseur A  : ajout (a,f)
	  | On check prédécesseur B  : ajout (b,f)
	  | On check prédécesseur C  : ajout (c,f)
	  | On check prédécesseur D  : existe déjà (d,f)
	  | on check successeur F
	| On prends E
		| aucun changement le graphe est complet

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->b;
		a->c;
		a->d;
		a->e;
		a->f;
		b->a;
		b->c;
		b->d;
		b->e;
		b->f;
		c->a;
		c->b;
		c->d;
		c->e;
		c->f;
		d->a;
		d->b;
		d->c;
		d->e;
		d->f;
		e->a;
		e->b;
		e->c;
		e->d;
		e->f;
		f->a;
		f->b;
		f->c;
		f->d;
		f->e;
	}

4.  Le graphe G est-il fortement connexe ? Justifier.

Un graphe complet est fortement connexe car tous les sommets
sont reliés a tous les autres, or le graphe est complet donc il est fortement
connexe.

5. Donner le graphe réduit du graphe G.

Il n'y a qu'une seule composante connexe donc c'est un graphe
avec un seul sommet.

6.  Quelles sont les tailles d’un stable maximum et d’une clique maximum dans la fermeture transitive du graphe G. Justifier

Le graphe étant complet, le stable maximum vaut 1. On prends un seul sommet, les 5 autres sont reliés
a ce sommet donc c'est bien un stable et tous les sommets sont dedans donc maximum donc le stable maximum
est de taille 1.

Le graphe étant complet, le sous-graphe complet donc une clique maximum est un sous-graphe sans retirer aucun sommet
car on ne fera pas plus grande clique que notre graphe de départ donc la taille est de 6.

7. Le graphe G contient-il un chemin hamiltonien ? si oui, lequel ?

Le graphe G contient le chemin hamiltonien (b,a,c,e,d,f) c'est-à-dire que l'on est passé une et une seule
fois par chaque sommet.

8.  Montrer qu’un graphe G=(V, E) contenant un chemin hamiltonien accepte une partition
minimum P de ses sommets en cliques telle que la partie entière de V/2 soit supérieure ou égale a P.

Si existe un chemin hamiltonien alors chaque sommet est lié a deux autres tel que par transitivité
on obtient une chemin hamiltonien alors on peut créer des partitions de 2 sommets et obtenir
une partition minimum supérieur à la partie entière de nombre d'arêtes/2.

9.
	Ajouter des arcs aux graphes G\′ et G\′\′ tels que G\′ et G\′\′ soient τ-minimal τ-équivalent
	au graphe K5 et G\′\′ possède strictement moins d’arc que G\′

.. image:: /assets/math/graph/ctrl1.png

Exercice 2 — Grundy
-------------------------

Soit la matrice d’adjacence suivante d’un graphe de 9 sommets numérotés de 0 à 8.

.. image:: /assets/math/graph/ctrl2.png

1. Calculer la fonction de Grundy. Est-elle unique et pourquoi ? On attend un argument général.

	* 8 n'a pas de successeurs donc dans le noyau 8(0)
	* 7 à 8(0) pour successeur donc 7(1)
	* 5 à 7(1) donc on met 0
	* 6 à 7(1) donc on met 0
	* 4 à 8(0), 6(0) pour successeur donc 4(1)
	* 3 à 5(0) donc on met 1
	* 2 à 5(0) et 7(1) donc on met 2
	* 1 à 2(2), 3(1), 4(1) donc on met 0

Le fonction de grundy est unique ici car les sommets sont triés par ordre topologique, par exemple
on va forcément regardé 5 et 7 avant 2 et depuis les valeurs trouvés alors
on n'a qu'un seul moyen de donner la valeur de 2 : la plus petite valeur non donnée à 5 et 7.

Les sommets ne peuvent donc prendre qu'une seule valeur qui est la plus petite non prise
par les successeurs dont elle est unique.

De façon générale, la fonction de grundy n'est pas unique car on peut tester en commençant par
d'autres sommets donc on peut tomber sur un autre noyau. Par exemple on sait que si on fait le graphe
complémentaire alors on trouvera un autre noyau qui est le complémentaire du noyau trouvé
dans le graphe normal. Il peut aussi n'y avoir aucun noyau.

2. Donner le noyau du graphe.

Le noyau est 1,5,6,8.

3.
	Ce graphe est le graphe d’état d’un jeu à deux joueurs. Le jeu commence en l’état 0. Il
	se termine en l’état 8. Le joueur qui, au moment de jouer, se trouve sur l’état 8 a perdu.
	Donner la stratégie gagnante pour le joueur qui commence.

On passe par le graphe complémentaire. Tous les sommets qui ne sont pas dans le noyau
sont donc voisins de 1,5,6,8 donc on ne doit pas se trouver sur l'un de ses sommets.
On ne doit également pas se trouver sur le sommet 8. Donc les seuls sommets
sur lesquels le joueur doit rester sont 1,5,6.

4. Donner un argument général qui pourrait s’appliquer sur un graphe plus grand.

Le joueur doit rester dans les sommets du noyau car étant un ensemble stable
et 8 étant dans le noyau, alors vous ne vous retrouverez pas sur 8 au prochain tour car par définition
deux sommets du noyau ne sont pas voisins sinon il ne formeraient pas un stable.

Exercice 3 — Maximiser une fonction polynomiale en variables 0-1 - 4 points
----------------------------------------------------------------------------------------------------

.. image:: /assets/math/graph/ctrl3.png

1.
	Construire un graphe d’exclusion dont les sommets sont les monômes de f(x) et tel qu’il
	existe une arête entre 2 monômes si et seulement s’ils ne peuvent valoir 1 en même temps

On construit un graphe en testant toutes les combinaisons des xi et en regardant les
valeurs de chacun des termes.

2.
	On veut trouver la valeur maximum que peut prendre f(x).
	Montrer que l’on peut résoudre ce problème par la recherche d’un stable de poids maximum dans le graphe d’exclusion.
	Construire le graphe, préciser où sont les poids et leurs valeurs, résoudre le problème à partir du graphe.

On passe par le graphe complémentaire, les coefficients devant les monômes étants les poids.
Si on trouve un stable de poids maximum donc aura les valeurs toutes les valeurs pouvant valoir 1 en même temps
ce qui nous donne la valeur maximum que peut prendre f(x).