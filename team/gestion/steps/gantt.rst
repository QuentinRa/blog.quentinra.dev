===========================================================
Répartir les activités dans le temps (=planning)
===========================================================

On suppose que vous avez une liste des tâches, même si elle n'est
pas terminée ni classée. L'objectif de cette partie est de présenter
comme gérer cette liste.

	* vous pouvez lister vos tâches pour une vision d'ensemble avec le **WBS**
	* vous pouvez calculer les marges et retard possibles sur vos tâches avec **P.E.R.T**
	* Enfin, vous construisez votre planning avec le diagramme de **GANTT**

1. WBS
------------------------------

Le WBS (work breakdown structure = organigramme des taches) consiste en :

	* décomposition hiérarchique des taches à effectuer (racine = projet).
	* Pour chaque activité/tache, on indique généralement quelques informations comme :

		* contrôler sa durée
	 	* définir les ressources nécessaires
		* connaître son coût (HJ) et/ou argent
		* calculer le résultat

Il est généralement utilisé pour créer le diagramme de P.E.R.T. L'utilité de
l'arbre est de pouvoir facilement avoir une vision d'ensemble du projet.

.. uml::

		@startwbs
		* Projet. Cout = 300 HJ.
		** Production. Cout = 295 HJ.
		*** ...
		*** ...
		** Lancement. Cout = 5 HJ.
		*** ...
		** Complete innovate phase
		@endwbs

2. P.E.R.T.
------------------------------

Après votre WBS réalisé, on peut s'en servir pour faire un diagramme de PERT (=diagramme d'états-transitions = automate).

L'état initial est le projet, les transitions sont les taches et les états sont tache x terminée par exemple...

.. image:: /assets/team/gestion/pert.png

Remarque : Pour représenter le fait qu'un tâche est plus longue qu'une autre mais que l'on doit attendre
deux taches qui se font en parallèle alors elles sont reliés à l'état suivant avec une flèche en pointillés.

.. note::

	Ceci est une version ultra-simplifiée du diagramme de P.E.R.T., pour les calculs de marge
	et tout le reste, vous pouvez trouver un cours ici : :ref:`ordonnancement_graph` (lisez la partie et consultez uniquement
	la méthode P.E.R.T parmi les deux).

3. GANTT
----------------------------------

Enfin, GANTT traduit le diagramme de PERT pour créer un planning.

	* liste de toutes les taches (suite ordre de PERT)
	* Identifie les taches filles (par exemple, Task1… du WBS)
	* Créé les dépendances entre les taches (PERT & WBS)
	* Donne dates et durées
	* On ajoute les JALONS (on parle également de dates buttoir intermédiaires)
	* Ajout des personnes

Et enfin, au fur et à mesure, on met à jour l'avancement (fait/à faire)

Outils : `GanttProjet <https://www.ganttproject.biz/download>`_ (logiciel),
`officetimeline <https://online.officetimeline.com/>`_ (site web, création en ligne).