.. _graph:

================================
Théorie des graphes
================================

| :math:`\color{grey}{Version \ 3.4.9}`
| :math:`\color{grey}{Dernière \ édition \ le \ 07/12/2020}`

Un graphe (G) est un ensemble de sommets (E pour Edge)
reliés par des arêtes (V pour vertices).
On note alors un graphe G(E,V) avec E l'ensemble des sommets
et V l'ensemble des arêtes.

1. Définitions basiques
==========================

Contient des définitions sur l'adjacence, le degré, ...
mais aussi sur les graphes bi-parti, l'étoile, sous-graphe, ...

.. toctree::
	 :maxdepth: 1

		Définitions et Notions        <files/voc>
		Graphes particuliers          <files/graphes>
		Les "4" types de graphes      <files/types>

2. Définitions avancées
==========================

Voici quelques définitions avancées.

.. toctree::
	 :maxdepth: 1

		Matrices d'adjacence et Matrice d'incidence        <files/matrix>
		Fermeture transitive                               <files/fermeture>
		Connexité et forte connexité                       <files/connexité>
		Graphes planaires                                  <files/planaire>
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

7. Noyau et base de cycles :code:`avancé`
===========================================

.. toctree::
			:maxdepth: 1

				Noyau et stabilité             <files/noyau/noyau>
				Base de cycles/cocycles        <files/noyau/bases>

.. _ordonnancement_graph:

8. Ordonnancement :code:`avancé`
======================================

.. toctree::
			:maxdepth: 1

				Introduction                   <files/ordonnancement/intro>
				Définitions                    <files/ordonnancement/def>
				Méthode Potentiel-tâches       <files/ordonnancement/mpt>
				Méthode P.E.R.T.               <files/ordonnancement/pert>

9. Plus court chemin  :code:`avancé`
=========================================

Voici quatre algorithmes pour trouver le plus court
chemin dans un graphe.

.. toctree::
			:maxdepth: 1

				Algorithme de Dijkstra         <files/pcc/dijkstra>
				Algorithme de Bellman-Ford     <files/pcc/bellman_ford>
				Algorithme de Floyd-Warshall   <files/pcc/floyd_warshall>
				Algorithme de Johnson          <files/pcc/johnson>
				Diamètre et distance           <files/pcc/diam>

10. Exercices
=================

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
		Annales                         <annales/index>

et les exercices du cours avancé

.. toctree::
    :name: exercices2
    :maxdepth: 1

		Stabilité                       <exercices/stable>
		Fonction de Grundy              <exercices/grundy>
		Bases de cycles et cocycles     <exercices/bases>
		Plus court chemin               <exercices/plus_court>
		Ordonnancement                  <exercices/ordonnancement>

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
	* https://fr.wikipedia.org/wiki/Lexique_de_la_th%C3%A9orie_des_graphes
	* http://atomurl.net/math/
	* https://fr.wikiversity.org/wiki/Th%C3%A9orie_des_graphes/Propri%C3%A9t%C3%A9s
	* https://fr.wikipedia.org/wiki/Th%C3%A9orie_spectrale_des_graphes
	* https://fr.wikipedia.org/wiki/Algorithme_de_Johnson#Exemple.
	* https://en.wikipedia.org/wiki/Johnson%27s_algorithm
	* https://www.geeksforgeeks.org/johnsons-algorithm/