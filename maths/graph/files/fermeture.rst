=======================================================================
2. Définitions avancées - Fermeture Transitive et Graphe partiel
=======================================================================

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