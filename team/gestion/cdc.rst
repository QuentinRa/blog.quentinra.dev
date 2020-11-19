.. _cdc:

================================
Cahier des charges
================================

Le cahier des charges (CDC) est un document englobant tout ce qu'il faut savoir sur le projet à réaliser.

Cette partie contient une vue technique du cahier des charges, pour plus de conseils sur sa rédaction,
consultez la carte Professionnalisme.

Voici une version de ce que l'on retrouve dans un CDC.

	* présentation de l'entreprise
	* l'objectif du projet : description du projet, du client, qu'est-ce que l'on veut obtenir
	* le public : a qui est adressé le produit ? (langue, age, connaissances informatiques)
	* l'équipe : méthode de développement (agile-scrum ? test-driven ?...), organisation, rôles
	* la charte graphique : couleurs, polices, tailles
	* les spécifications techniques

			*	langage ? framework ? version ?
			*	git ? éditeur particulier ?
			*	outils de communication ?
			*	Base de données ? (schéma sql de la base, ...)
			*	les contraintes techniques (plateformes, navigateurs, appareils)
			*	services tiers utilisés (Google analytics, …)
			*	l’architecture (organisation des dossiers, des menus)
			*	conventions d’écriture, de nommage
			*	protocoles, méthodes de transfert des données (get, post)
			*	nom de domaine pour un site web et emails

	* les spécifications fonctionnelles (les écrans de l'application). Vous devez définir pour chaque écran comment on y accède

			*	le comportement des composants de l'écran, et ceux qui doivent être codés en priorité (voir priorisation, MoSCoW)
			*	décrire son apparence (wireframe?)
			*	spécifier d'éventuels détails pour le programmeur
			*	des diagrammes UML
			*	des potentielles contraintes/vérifications à faire

Une représentation possible des tâches à faire :

======== ============== ============= =============================== ====================
N°       tâche          Délais        Charge prévisionnelle (hj)      Priorité
======== ============== ============= =============================== ====================
\        Phase 1        20j/5s         85 (=60 + 25)                  M
A        Task 1         8j/2s          25                             M
B        Task 2         12j/3s         60                             C
======== ============== ============= =============================== ====================

Phase 1 est le tâche mère qui comprends deux sous-tâches task1 et task 2.

Conseils de rédaction
==================================

C'est assez long (et chiant) de rédiger un cahier des charges, donc plutôt que le blabla
plus haut, vous pouvez raccourcir et reformuler tout cela selon votre cas.

	*
		vous pouvez faire deux version du CDC : un en une page et l'autre avec des détails pour
		faciliter sa compréhension par les membres de l'équipe.
	*
		vous pouvez passer par une maquette fonctionnelle pour décrire les spécifications
		fonctionnelle, et ajouter en commentaire pour chaque écran ce qu'il est bon de savoir

-----

**Crédits**
	* William GUISSEFFI (enseignants à l'IUT de Sénart-Fontainebleau)
	* Florent MADELAINE (enseignants à l'IUT de Sénart-Fontainebleau)
	* Luc HERNANDEZ (enseignants à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune