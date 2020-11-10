================================
Graphes planaires
================================

Niveau débutant
***********************

1/3 Planaire ?
----------------------------

Parmi les graphes suivants : lesquels sont planaires ou non ? Si c’est le cas, vérifiez la formule
d’Euler. Sinon pourquoi n’est-il pas planaire ?

.. image:: /assets/math/graph/exercice/p1d.png

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<planaire/d1>

2/3 Le graphe de Petersen
----------------------------

On veut montrer que le graphe suivant, nommé graphe de Petersen, n’est pas planaire.

.. image:: /assets/math/graph/exercice/p2d.png

1. \
	Montrez que ce graphe vérifie :math:`m < 3n-5`
2. \
	Montrez que ce graphe ne contient aucun cycle de taille inférieure ou égale à 4.
3. \
	Soit G un graphe planaire simple et connexe n’ayant pas de cycle de taille inférieure ou égale
	à c, montrer que :math:`m < \frac{(c+1)(c+2)}{c-1} + 1`
4. \
	En déduire que le graphe de Petersen n’est pas planaire.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<planaire/d2>

3/3 K3,3 est planaire sur un mug !
----------------------------------------

Montrer qu’il est possible de dessiner K3,3 planaire sur un tore.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<planaire/d3>

Dessin de circuit imprimé
----------------------------------------

Des composants (A,B,C, ..., G) ayant un à quatre points de connexions (a1, a2, b1, b2, b3, ...)
trop rapprochés pour permettre le passage d’une liaison entre eux, doivent être implantés sur une
plaquette de circuit imprimé. Deux connections ne doivent pas se croiser. Les connexions à établir
sont :

.. image:: /assets/math/graph/exercice/p4d.png

1. \
	Montrer qu’il est possible de placer ces connexions sur le circuit imprimé.
2. \
	Montrer que dans un graphe biparti planaire simple et connexe, :math:`m < 2n-3`
3. \
	Est-il possible d’ajouter une connexion supplémentaire entre les deux parties du graphe sans
	qu’il y ait une intersection entre deux connexions ?

Base de cycle et graphe planaire
----------------------------------------

Soit G un graphe planaire. On veut montrer que ses faces internes forment une base de cycles.
On va le montrer par récurrence sur f, le nombre de faces. Soient :math:`F = {F_1,F_2, ..., F_{f-1}}` les faces
internes de G.

1. \
		Supposons que G n’a aucune face interne, montrer qu’il n’a aucun cycle. En déduire que la
		propriété est vraie quand f = 1.

2. \
	Supposons maintenant la propriété vraie pour tout graphe avec f faces.

	(a) \
		Soit e une arête du cycle entourant F1. Montrer que G\{e} est planaire. En déduire une
		base de cycles.
	(b) \
		Montrer que si on ajoute F1 à cette base de cycles, alors on a une base de cycles de G.
	(c) \
		Que peut-on dire si tous les cycles de la base de cycles de G\{e} sont des faces internes
		de G? Présenter un cas où cela survient.
	(d) \
		Si ce n’est pas le cas, montrer qu’au plus un cycle C de cette base n’est pas une face
		interne de G.
	(e) \
		Montrer que :math:`C \bigoplus F1` est une face interne de G.
	(f) \
		En déduire que les faces internes de G forment une base de cycles.

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)