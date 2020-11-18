============================================================
Lister et décomposer les taches nécessaires au projet (WBS)
============================================================

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