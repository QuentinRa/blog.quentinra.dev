================================
Exercices non triés
================================

1. Un petit problème de croisement
-------------------------------------

.. image:: /assets/math/graph/exercice/nr1.png

Est-il possible de tracer une ligne continue telle que tout segment est coupé exactement une fois par cette ligne ?
Modéliser le problème par un problème de graphe et le résoudre.

2. Parcours de musée
-------------------------------------

On Souhaite tracer le parcours d’un musée de sorte que chaque personne ne passe pas plus d’une fois devant la même oeuvre.
Voici deux plans de musées. Les E entourés sont des escaliers. Dans le musée 1, des tableaux sont accrochés sur les murs
dessinés en gras. Dans le musée 2, les oeuvres sont disposés dans les salles (pas forcément aux murs)
sauf dans la salle vide.

.. image:: /assets/math/graph/exercice/nr2.png

1. Modéliser ce problème dans le musée 1 sous forme d’un problème de graphe et le résoudre.
2. Modéliser ce problème dans le musée 2 sous forme d’un problème de graphe et le résoudre.
3. Pourquoi la modélisation n’est-elle pas la même, qu’est ce qui a changé ?

3. Équipement d'un atelier
-------------------------------------

Dans un grand atelier sont installées neuf machines, a, b, . . ., h et i. Les pièces mécaniques
qui y sont fabriquées doivent passer successivement sur plusieurs machines (perceuses, soudeuses,
polisseuses, ...). On désire construire, pour un coût minimum, des tapis roulants permettant de
conduire les pièces d’une machine à une autre machine. Le tableau ci-dessous indique pour chaque
machine M quelles sont les machines qui peuvent suivent dans la chaîne de production. On doit
donc relier M à chacune de ces machines par une succession de tapis roulant. Modélisez ce problème
par un problème graphe et résolvez le.

.. image:: /assets/math/graph/exercice/nr3.png

4. Stable et degré
--------------------

Soit G un graphe tel que :math:`1 \le d(x_1) \le ... \le d(x_n)`
et il existe p dans :math:`[2,n]` tel que :math:`\sum_{i=0}^{p-2} d(x_{n-i} \le n-p`.

Montrer que tout stable maximal possède au moins p éléments.

5. Empiler
--------------

Soient :math:`C_1, C_2, C_3` les trois cylindres (à base triangulaire) suivants. Ils sont colorés sur
les trois faces verticales (pas sur les bases). La couleur de la face arrière est indiquée en haut.

.. image:: /assets/math/graph/exercice/nr5.png

On cherche une façon d’empiler parallèlement les cylindres de sorte que chaque face de la pile
ainsi construite possède au plus une fois chaque couleur. Modéliser ce problème par un problème
de graphe et le résoudre.

6. Plan de mariage
--------------------

Comment effectuer à un mariage un plan de table de sorte que deux personnes qui ne s’apprécient
pas ne soient pas à la même table ? Modéliser ce problème par un problème de graphe.

7. Petite poignée de main
-----------------------------

Le couple Madame M et monsieur N invitent 4 couples chez eux. En arrivant, certains se
saluent, d’autres non, en particulier les membres d’un couple ne se saluent pas. Monsieur N a
demandé à tout le monde combien de personnes ils avaient salué et chaque personne a donné une
réponse différente.

1. Montrer alors que

	* pour chaque couple, les deux personnes du couple ont serré ensemble 8 mains ;
	* Madame M et Monsieur N ont salué les mêmes personnes.

2. Cela est-t-il toujours vrai si madame M n’est pas en couple avec monsieur N ?

8. Accès par autoroutes
-----------------------------

Dans un département comptant 2p + 1 villes, chaque ville est reliée à p autres villes par une
autoroute. Montrer qu’il est possible de se rendre depuis le chef-lieu du département dans toutes
les autres villes en empruntant que des autoroutes.

9. Propriété des degrés
-----------------------------------

On veut montrer que, dans
un réseau social, la plupart des gens ont l’impression d’avoir moins d’amis que leurs amis. On
représente le réseau par un graphe non orienté avec n nœuds (les gens) et m arêtes (les liens
d’amitiés).

1. \
	Montrer que la moyenne du nombre d’amis d’une personne est :math:`\frac{2m}{n}`

2. \
	On considère la liste contenant, pour chaque personne, pour chaque ami de cette personne, le
	nombre d’amis de cet ami. Montrer que la moyenne de cette liste, i.e. la moyenne du nombre
	d’amis d’un ami, est :math:`\frac{\sum_{v \in V}^{} deg(v)^2}{2m}`

10. Jeux de Nim
-----------------------------------

Soit les jeux suivants. Déterminez pour lesquels le joueur 1 a une stratégie gagnante et pour
lesquels le joueur 2 a une stratégie gagnante. Le premier joueur est toujours le joueur 1.

1. \
	Deux joueurs ont devant eux n baguettes. À chaque tour, un joueur retire 1, 2 ou 3 baguettes.
	Le joueur obligé de retirer la dernière baguette perd le jeu.

2. \
	Deux joueurs ont devant eux une tablette de chocolat avec nm lignes et colonnes. A chaque
	tour, un joueur doit manger soit autant de lignes qu’il veut soit autant de colonne qu’il veut
	(au moins une). Le perdant est celui qui doit manger le dernier carré de chocolat.

3. \
	Deux joueurs ont devant eux un plateau avec des jetons disposés sur une grille (certains cases
	peuvent être vide). A chaque tour, un joueur doit choisir un jeton, le retirer lui et tous ses
	voisins (horizontaux, diagonaux et verticaux). Le joueur qui retire le dernier jeton gagne la
	partie.

-----

**Crédits**
	* Massimissa MERABET (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)
	* Wikle (étudiant à l'ENSIIE)