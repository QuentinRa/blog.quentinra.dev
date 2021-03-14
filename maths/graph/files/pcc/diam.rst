======================
Diamètre et distance
======================

Diamètre
	Noté diam(G), il s'agit de la plus grande des plus petites distances du graph G.

	Chemin plus court pour aller d’un point à l’autre, on regarde pour chaque point,
	la distance pour tous les points. On prend ensuite la distance maximale.

	En clair, il s'agit du nombre de déplacement maximal devant être fait pour atteindre
	n'importe quel point depuis n'importe quel point.

Distance
	Notée d(x, y), il s'agit de la longueur minimale d’une chaine reliant x à y.

**Exemple**

Voici un exemple avec le graphe suivant

.. image:: /assets/math/graph/d.png

on obtient le tableau suivant

.. image:: /assets/math/graph/dr.png

Le diamètre = d(2,7) = d(7,2) = diam(G) = 4.