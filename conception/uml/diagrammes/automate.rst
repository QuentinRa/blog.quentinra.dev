.. _automate:

========================================
Diagrammes d'état-transitions
========================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/11/2020}`

Le but est de représenter TOUS les comportements que peuvent prendre les objets d’une classe.

On représente tous les états possibles de l’application puis les transitions ie comment on
passe d’un état à un autre et enfin s’il existe des conditions pour changer d’état.

.. hint::

	Ce diagramme est aussi appelé automate ou diagramme d'activités.

1. Vocabulaires
=====================

États
	Il y a deux états spéciaux : l'état initial (là ou l'automate commence) et
	les états finaux (là ou l'algorithme termine).

	Les autres états correspondent à l'état (littéralement) dans lequuel l'automate se
	trouve après une action.

Transitions
	La transition est une flèche d'un état à une autre.


2. États
=====================

On commence par identifier les états possibles de notre objet.

.. uml::

		@startuml

		(*) --> "état"
		"état" --> (*)

		@enduml

L’état initial est un état transitoire qui
indique où on commence. On n’y reste pas, on va directement dans un nouvel état. (ex : Attente)

.. image:: /assets/conception/uml/activity/stateE.png

L’état final de notre objet, il peut ne pas en avoir si notre objet n’est jamais détruit.

.. image:: /assets/conception/uml/activity/stateD.png

On peut définir des actions à effectuer dès que l’on rentre/sort/...
d’un état pour éviter de surcharger les branches.

.. image:: /assets/conception/uml/activity/actions.png

3. Transitions
=====================

On passe d’un état à un autre avec une transition.
On peut écrire dessus l’évènement qui nous fait changer d’état.

.. image:: /assets/conception/uml/activity/trans1.png

On peut également ajouter une garde à notre transition contenant
une condition pour transiter. Forme : [condition]

.. image:: /assets/conception/uml/activity/trans2.png

On peut également ajouter une action à notre transition contenant du code à exécuter. Forme : /action

.. image:: /assets/conception/uml/activity/trans3.png

4. Branchements
=====================

Il est possible de créer des branchements si/sinon.

Toutes les conditions sont évaluées, et celle qui réponds le mieux
à l'état actuelle est celle dans laquelle l'automate va aller.

.. uml::

		@startuml
		(*) --> "Start"

		if "Test" then
			-->[true] "Action si vrai"
		else
			->[false] "Action si faux"
		endif

		@enduml

Une barre de synchro représente le fait que
l’on doit finir toutes les flèches qui lui viennent dessus avant de continuer.

.. uml::

		@startuml

		(*) --> ===B1===
		--> "Activité simultanée 1"
		===B1=== --> "Activité simultanée 2"

		@enduml

5. Exercices
=====================

aucun

-----

**Crédits**
	* Florent Madelaine (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Dartois (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune