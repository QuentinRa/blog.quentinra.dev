.. _graph:

================================
Théorie des graphes
================================

| :math:`\color{grey}{Version \ 1.0.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 02/11/2020}`

Graphe
	Un graphe (G) est un ensemble de sommets (E pour Edge)
	reliés par des arêtes (V pour vertices).

	On note alors un graphe G(E,V) avec E l'ensemble des sommets
	et V l'ensemble des arêtes.

Graphe simple et Graphe complexes
	Un graphe simple est un graphe

		* sans boucle (donc aucune arête d'un sommet à lui-même)
		* a au plus une arrête relie deux sommets (Pour aller de A vers B, j’ai au plus un chemin (arrête) pour y aller)

	Tous les autres graphes sont dits complexes.

Graphe orientés (GO) et non orientés (GNO)
	Dans un graphe non orienté, les arêtes sont des traits
	car on considère que le sens n'importe pas. On note alors
	une arête de a vers b : [a,b].

	Dans un graphe orienté, les arêtes sont des flèches, appelés
	**arcs** et leur sens est important. On note (a,b) un arc de a vers b.

1. Définitions basiques
==========================

1.1 Vocabulaire lié aux sommets et aux arêtes
**********************************************

Adjacent ou Voisins
	On dit que deux sommets sont adjacents s'ils sont reliés par une arête.

	On parle aussi de Voisins d'un sommet X, noté N(X) ou :math:`\Gamma(X)` (Gamma).

	.. note::

		| :math:`N^{+}(X)` signifie les voisins entrants/arrivant sur X.
		| :math:`N^{-}(X)` signifie les voisins sortants.

Degré
	Il s'agit du nombre de voisins d'un sommet.

	* Dans un graphe non orienté, c'est :math:`d(X) = |\Gamma(X)|`.
	*
		Dans un Graphe orienté c'est : :math:`|\Gamma^{+}(X)| + |\Gamma^{-}(X)| = d^+(X) + d^-(X)` soit la
		somme du demi-degré extérieur + demi-degré intérieur.
		On parle de prédécesseur (entrants) et de successeur (sortants).

Incidence
	Une arête est incidente à un sommet si elle est reliée à ce sommet.

Ordre
	L'ordre d'un graphe corresponds au nombre de sommets (E) du graphe soit \|E| ou card(E) ou \#E.

1.2 Graphes particuliers
**********************************************

==================== ==================== ==================================================
Graphe non orienté   Graphe orienté       Description
==================== ==================== ==================================================
Chaine								Chemin              Chaque sommets est de degré 2 sauf les extrémités
Cycle						      Circuit             Tous les sommets sont de degré 2
Étoile						    Étoile              Un sommet de degré \|E\|-1 et les autres de degré 1
Roue						      Roue                Tous les sommets de degré 3 sauf 1 de degré \|E\|-1
==================== ==================== ==================================================

Cycle, Chaines élémentaires
	On dit qu'une chaine ou un cycle est élémentaire si on passe 1 seule fois
	par chaque sommet.

Graphes réguliers
		Les graphes dit k-régulier sont des graphes pour lesquels tous les sommets sont de degré k.

Graphe complet
		Un graphe complet est un graphe dans lequel chaque sommet est adjacent à tous les autres
		(:math:`|V| = \frac{n(n-1)}{2}`).

Graphe bi-parti
		les graphes bi-parti : les sommets sont classé en deux groupes/ensembles, ceux d'un degré = a et ceux
		d'un degré=b (:math:`b > a \ge 1`) tel que tous les sommets du premier ensemble ont  a arêtes
		vers ceux du 2e et ceux du 2e ont b arêtes vers ceux du premier.

Sous-graphe (dit sous-graphe induit)
	G' est un sous-graphe de G si et seulement si il a été obtenu

		* en ne supprimant que des sommets de G
		* en ne supprimant que les arrêtes liées/incidentes au sommets supprimés

Clique
	Une clique est un sous-graphe complet.

Complémentaire
	Le complémentaire d'un Graphe G est un graphe G' dans lequel les arêtes
	sont inversées.

2. Définitions avancées
==========================

2.1 Matrices d'adjacence et Matrice d'incidence
*************************************************

Matrices d'adjacence
	Il s'agit d'une matrice Sommet*Sommet (départ->arrivé dans un GO) dans laquelle on met un 1 s'il existe un arrête
	entre deux sommets, 0 sinon.

	.. note::

		Dans un GNO, la matrice est symétrique.

Matrice d'incidence
	Sur le même principe que la matrice d'adjacence, dans un Graphe orienté, il se peut qu'on veuille savoir si l'arrête
	est entrante ou sortante : on met -1 si sortant, 1 si entrant et 0 sinon.

2.2 Connexité et forte connexité
**********************************

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

2.3 Fermeture Transitive et Graphe partiel
*******************************************

Fermeture transitive (noté :math:`\tau` (tau))
	Il s'agit d'ajouter toutes les arrêtes qui peuvent être obtenues par transitivité.
	Donc si on a A vers B et A vers C alors on ajoute une arrête A vers C.

	Algorithme de Roy-Warshall (on considère les arc comme étant des arêtes)

		.. code-block::

			On commence à un sommet A
			Pour tout sommet, on relie les prédécesseur aux successeurs

Graphe partiel
	Un graphe partiel est un graphe dans quel on a retiré des arrêtes.

:math:`\tau`-équivalent
	Deux graphes G et G' sont :math:`\tau`-équivalents s'ils ont la même fermeture transitive et
	que G' est un sous-graphe de G.

:math:`\tau`-minimal :math:`\tau`-équivalent
	Il s'agit d'un graphe :math:`\tau`-équivalent tel que retire une arête fait qu'il n'est plus
	:math:`\tau`-équivalent.

:math:`\tau`-minimum :math:`\tau`-équivalent
	Il s'agit d'un graphe :math:`\tau`-minimal :math:`\tau`-équivalent avec le minimum d'arcs

2.4 Noyau et base de cycles
*******************************************

2.4.1 Noyau
----------------

Stabilité
	Un ensemble stable S est un sous-ensemble tel que les sommets de l'ensemble ne sont jamais
	voisins.

	Stable maximal : on ajoute un sommet et il n'est plus stable

	Stable maximum : on ne peut pas créer d'ensemble S plus grand. On note :math:`\alpha (G) = card(stable\ maximum)`

	Soit h le degré maximal et n le nombre de sommets, :math:`|Stable\ maximal| \ge \lceil \frac{n}{h+1} \rceil`.

Partitionnement
	On peut partitionner un graphe en cliques. Une partition

		* est un ensemble de cliques
		* tous les sommets doivent être dans une clique
		* les sommets doivent être présent dans exactement une clique

	:math:`|S| \le |P|`. Si :math:`|S| = |P|` alors S est stable maximum et P une partition minimum.

Ensemble absorbant
	Une ensemble A absorbant est un ensemble tel que tout sommet qui
	n'est pas dans l'ensemble est un successeur d'un sommet dans A.

	:math:`\beta (G) = card(plus\ grand\ ensemble\ absorbant)`

Noyau
	Sous-ensemble stable et absorbant.

	Un graphe peut avoir 0,1 ou plusieurs noyaux.

Fonction de grundy
	Soit un graphe orienté, la fonction de grundy g(v) retourne le plus petit
	entier non attribué aux successeurs de v.

	Tous les sommets ayant comme valeur 0 sont censés composer le noyau (vérifiez!).

	Il est recommandé de partir d'un sommet qui n'a pas de prédécesseur,
	car il fait forcément parti du noyau.

2.4.2 base de cycles
-------------------------

Base de cycles
	On considère l'ensemble des arrêtes V ordonné. On note chaque cycle
	est comme un ensemble qui associe à chaque arrête une valeur : 0,1,-1.

		* 0 : si le cycle ne parcours par l'arrête
		* 1 : si le cycle parcours l'arrête dans le bon sens
		* -1 : si le cycle parcours l'arrête dans le sens inverse

	On note un cycle :math:`C_n = (0, ...,1,-1)`

	Une base de cycles B est un ensemble de cycles, tels
	que la base de cycles est libre et génératrice.

	On note :math:`\mu(G)` (mu) le nombre d'éléments d'une base de cycle,
	appelé nombre cyclomatique. math:`\mu(μ(G) = m − n + p` avec n sommets m arcs et p composantes
	connexes.

Base de cocycles
	On appelle cocycle de A, l'ensemble des arcs incidents à A,
	noté :math:`\omega{(A)}`. On associe à chaque arc une valeur

  	* 0 : si le cocycle ne parcours par l'arrête
  	* 1 : si le cocycle parcours l'arrête dans le bon sens
  	* -1 : si le cocycle parcours l'arrête dans le sens inverse

  .. hint::

   	En gros il faut que les sommets du cocycles soit incidents à tous les autres

  Une base de cycle est un ensemble de cocycles, tel que la base
  soit libre et génératrice.

	On note :math:`\gamma(G)` (gamma) le nombre d'éléments d'une base de cocycle,
	appelé nombre cocyclomatique. math:`\gamma(μ(G) = n - p` avec n sommets et p composantes
	connexes.

2.5 Graphes planaires
*******************************************

Planaire
	Un graphe est planaire si on peut le représenter tel qu'aucune arrête ne traverse
	une autre arrête.

	On appelle Graphe planaire topologique la représentation planaire d'un graphe planaire.

	Un graphe est planaire

		* si n-m+f = 2 avec n sommets, m arêtes et f faces (donc f=m-n+2).
		* si m < 3n -5 avec G connexe, n sommets et m arêtes

	Si un graphe est planaire, alors il existe forcément un sommet e tel que d(e) < 6.

	Kuratowski
		Les graphes K3,3 et K5 ne sont pas planaires. Tout graphe
		contenant un sous-graphe qui soit l'un de ces deux là n'est pas planaire.

	Robertson–Seymour
		Graphe est planaire ssi il ne contient pas comme mineur K3,3 et K5

Face
	Une face est une région d'un graphe planaire délimitée/entourée par des arrêtes.

	Les arrêtes externes (celles vers l'extérieur) du graphe délimites la face
	dite infinie.

Frontière et contour
	On appelle frontière ou contours, les arrêtes qui entourent une face.

	Le contour cependant est un cycle élémentaire et ne dépend pas de la représentation.

	Dans un graphe planaire topologique, les contours forment une base de cycles.

Graphe dual
	Un graphe dual noté G* est un graphe dans lequel les sommets sont
	les faces de G et les arrêtes leur frontières.

Mineur d'un graphe
	Le mineur d'un graphe G est obtenu en effectuant un nombre quelconque d'opérations parmi :

		* supprime un sommet isolé (d(sommet) = 1)
		* supprime une arrête
		* contracte une arrête : les deux sommets aux extrémités sont fusionnés.

2.6 Autres
*******************************************

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


3. Tris et parcours
======================

3.1 Tri Topologique
**********************

Tri Topologique
	Il s'agit d'un ordre dans lequel chaque sommet est avant ses successeurs.

	Donc on commence avec les sommets qui n'ont pas de prédécesseurs, puis on les retires
	ainsi que leur arrêtes, et on recommence.

3.2 Parcours en profondeur
******************************

Parcours en profondeur (DFS : depth-first search)

Dans l'idée on parcours entièrement une branche, puis on revient aux intersections
et on parcours entièrement une autre branche jusqu'à avoir tout parcouru.

	.. code-block::

		1: On prends un sommet au hasard, on l'empile.
		2: On prends un voisin, on l'empile tant que possible.
		3: On marque le sommet bloquant "fini", on recommence avec 2: si possible
			sinon on fait 3:

3.3 Parcours en largeur
****************************

Parcours en largeur (BFS : breadth-first search)

Dans l'idée, on prends un sommet au hasard, on marque ses voisins, puis on fait pareils pour
les voisins jusqu'à avoir tout marqué.

	.. code-block::

		1: On prend un sommet au hasard qu'on marque, et on note ses sauvegarde ses voisins
		2: On marque les voisins sauvegardés puis on garde leurs voisins non marqués et on recommence
			 tant qu'il reste des sommets avec des voisins non marqués.

4. Graphes eulérien et graphes hamiltoniens
=============================================

4.1 Graphes eulérien
***********************

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

4.2 Graphes hamiltoniens
****************************

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

5. Coloration
============================

5.1 Coloration de sommets
*******************************

L'objectif est de colorier un graphe avec un minimum de couleurs
tel que deux sommets incidents ont une couleur différente.

nombre chromatique
		On note :math:`\gamma(G)` (gamma) le nombre chromatique soit le nombre
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

		1: Jusqu'à ce que toute nos graphes soient des cliques
			2: On créée deux sous-graphe :
				- un obtenu par reliement
				- un obtenu par contraction

		Le degré de la plus petite clique est le nombre chromatique.
		Les sommets ensembles (contractés) sont de la même couleur.

	.. note::

		2^m possibilités, avec m le arrêtes manquantes au graphe de départ pour qu'il
		soit complet donc complexité exponentielle.

5.2 Coloration d'arêtes
*******************************

On peut aussi colorier les arrêtes, on parlera d'indice chromatique
plutôt que nombre.

Line Graph
	Le graphe des arrêtes associé à G noté L(G) est un graphe tel que

			* un sommet de L est une arrête de G
			* deux arêtes de L ne sont reliées que si elles ont un sommet commun dans G

	L'indice chromatique est égal au nombre chromatique de L(G).

6. Arbres
============================

Un graphe qui respecte l'un de ces propriétés (qui sont équivalentes)
est un arbre

	*	connexe et sans cycle
	*	Il existe un unique chaîne reliant deux sommet x,y
	*	connexe mais ne l’est plus si on retire une arrête
	*	sans cycle mais ne l’est plus si on ajoute une arrête
	* connexe et \|E\| =|V| -1
	*	sans cycle et \|E\| =|V| -1

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

7. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

		Notions et Définitions          <exercices/notions>
		Parcours                        <exercices/parcours>
		Fermeture transitive            <exercices/transitive>
		Stabilité                       <exercices/stable>
		Étude des degrés                <exercices/voisins>
		Fonction de Grundy              <exercices/grundy>
		Non triés                       <exercices/non_rank>

------

**Crédits**
	* Jérémy POSSAMAÏ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Massimissa MERABET (enseignant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikipedia.org/wiki/Lexique_de_la_th%C3%A9orie_des_graphes
	* http://atomurl.net/math/
	* https://fr.wikiversity.org/wiki/Th%C3%A9orie_des_graphes/Propri%C3%A9t%C3%A9s
	* https://fr.wikipedia.org/wiki/Tri_topologique
	* https://fr.wikipedia.org/wiki/Graphe_eul%C3%A9rien
	* https://fr.wikipedia.org/wiki/Algorithme_de_parcours_en_largeur
	* https://fr.wikipedia.org/wiki/Algorithme_de_parcours_en_profondeur
	* https://fr.wikipedia.org/wiki/Taux_d%27expansion_(th%C3%A9orie_des_graphes)
	* https://fr.wikipedia.org/wiki/Graphe_dual
	* https://fr.wikipedia.org/wiki/Line_graph
	* https://fr.wikipedia.org/wiki/Automorphisme_de_graphe
	* https://fr.wikipedia.org/wiki/Th%C3%A9orie_spectrale_des_graphes