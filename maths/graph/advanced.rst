.. _graph_advanced:

================================
Théorie des graphes - avancé
================================

| :math:`\color{grey}{Version \ 1.1.4}`
| :math:`\color{grey}{Dernière \ édition \ le \ 08/12/2020}`

Il s'agit de la partie avancée du cours sur les graphes (:ref:`graph`).

1. Noyau et base de cycles
======================================

.. toctree::
			:maxdepth: 1

				Noyau et stabilité             <files/noyau/noyau>
				Base de cycles/cocycles        <files/noyau/bases>

.. _ordonnancement_graph:

2. Ordonnancement
======================================

On dispose de

	* tâches à effectuer
	* certaines tâches dépendent de d'autre tâches
	* les tâches prennent un durée à s'effectuer donnée
	* on ne prends pas en compte le fait que certaines tâches ne peuvent pas se faire en même temps (problème de ressources etc...).
	* on ne prends pas en compte le fait si certaines tâches doivent être effectuée avant (ou commencée après) un certain moment

L'ordonnancement permet de trouver le moyen les plus efficace d'ordonner les tâches afin d'obtenir
un résultats en une durée optimale.

Les données traités sont généralement sous la forme d'un tableaux avec tâches, tâches dépendantes et durée.

Il existe deux méthodes qui dépendant dont l'efficacité varie selon votre projet qui sont
Potentiel-tâches et PERT.

.. toctree::
			:maxdepth: 1

				Définitions                    <files/ordonnancement/def>
				Méthode Potentiel-tâches       <files/ordonnancement/mpt>
				Méthode P.E.R.T.               <files/ordonnancement/pert>

3. Plus court chemin
=============================

Voici quatre algorithmes pour trouver le plus court
chemin dans un graphe.

.. toctree::
			:maxdepth: 1

				Algorithme de Dijkstra         <files/pcc/dijkstra>
				Algorithme de Bellman-Ford     <files/pcc/bellman_ford>
				Algorithme de Floyd-Warshall   <files/pcc/floyd_warshall>
				Algorithme de Johnson          <files/pcc/johnson>

4. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

		Stabilité                       <exercices/stable>
		Fonction de Grundy              <exercices/grundy>
		Bases de cycles et cocycles     <exercices/bases>
		Plus court chemin               <exercices/plus_court>
		Non triés                       <exercices/non_rank>

------

**Crédits**
	* Massimissa MERABET (enseignant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikipedia.org/wiki/Lexique_de_la_th%C3%A9orie_des_graphes
	* http://atomurl.net/math/
	* https://fr.wikiversity.org/wiki/Th%C3%A9orie_des_graphes/Propri%C3%A9t%C3%A9s
	* https://fr.wikipedia.org/wiki/Th%C3%A9orie_spectrale_des_graphes