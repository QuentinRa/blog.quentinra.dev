.. _graph:

================================
Théorie des graphes
================================

| :math:`\color{grey}{Version \ 2.3.8}`
| :math:`\color{grey}{Dernière \ édition \ le \ 01/12/2020}`

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

Contient des définitions sur l'adjacence, le degré, ...
mais aussi sur les graphes bi-parti, l'étoile, sous-graphe, ...

.. toctree::
	 :maxdepth: 1

		Définitions et Notions        <files/voc>
		Graphes particuliers          <files/graphes>

2. Définitions avancées
==========================

Voici quelques définitions avancées.

.. toctree::
	 :maxdepth: 1

		Matrices d'adjacence et Matrice d'incidence        <files/matrix>
		Fermeture transitive                               <files/fermeture>
		Connexité et forte connexité                       <files/connexité>
		Graphes planaires                                  <files/planaire>
		Diamètre                                           <files/diam>
		Autres                                             <files/autres>

3. Tris et parcours
======================

Parcours pour explorer un graphe.

.. toctree::
	 :maxdepth: 1

		Tri Topologique                  <files/tri/topologique>
		Parcours en profondeur           <files/tri/parcours_p>
		Parcours en largeur              <files/tri/parcours_l>

4. Graphes eulérien et graphes hamiltoniens
=============================================

Voici deux graphes particulier, le graphe eulérien dans lequel
on passe une fois par chaque sommet et son équivalent le hamiltonien
mais avec des arêtes.

.. toctree::
	 :maxdepth: 1

		Graphes eulérien                  <files/special/euler>
		Graphes hamiltoniens              <files/special/hamilton>

5. Coloration
=============================================

La coloration permet de créer des groupes de sommets
qui engendrent tous les autres.

.. toctree::
	 :maxdepth: 1

		Coloration de sommets              <files/color/edge>
		Coloration d'arêtes                <files/color/vertices>

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

.. toctree::
	 :maxdepth: 1

		Couverture et arbre minimal              <files/special/arbre>

7. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

		Notions et Définitions          <exercices/notions>
		Parcours                        <exercices/parcours>
		Fermeture transitive            <exercices/transitive>
		Étude des degrés                <exercices/voisins>
		Graphes planaires               <exercices/planaire>
		Coloration de graphe            <exercices/coloration>
		Arbres                          <exercices/arbres>
		Non triés                       <exercices/non_rank>

8. Avancé
==============

Vous pouvez trouver ici un cours sur des concepts avancés de la théorie des graphes

.. toctree::
		:maxdepth: 3

		Cours avancé sur les graphes    <advanced>

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