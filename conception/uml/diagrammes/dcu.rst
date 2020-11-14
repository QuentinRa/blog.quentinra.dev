.. _dcu:

========================================
Diagrammes de cas d'usages
========================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/11/2020}`

Les Diagrammes de cas d'usages ou DCU sont généralement utilisés
pour représenter toutes les interactions entre ce que l'on souhaite
créer (dit système) et ceux qui interagissent avec (dit acteurs).

.. uml::

		@startuml
		left to right direction
		actor Client as g
		package Restaurant {
			usecase "Manger" as UC1
			usecase "Payer" as UC2
			usecase "Commander" as UC3
		}
		g --> UC1
		g --> UC2
		g --> UC3
		@enduml

.. note::

	Techniquement, un DCU est un diagramme avec un système (restaurant) contenant des cas
	d'usages  (manger, payer, commander) qui sont utilisés par des acteurs (client).

1. Définitions
==========================

Système
	Ce avec quoi les acteurs interagissent (par exemple le Restaurant).

Acteurs
	Les entités qui interagissent avec le système. Un acteur ne représente pas un cas particulier
	d’interaction mais un rôle. (pas de Mr Jean mais le rôle Client)

Cas d'usages
	Comment un acteur interagit avec le système. Généralement un
	verbe suivit d'une action (ou alors un nom de fonction/méthode).

Association
	Un acteur est relié à un cas d’usage par un trait (association).

	On peut relier deux acteurs par une relation de généralisation (=héritage).
	L’acteur qui hérite peut utiliser tous les cas d’usages de l’acteur hérité.

	.. uml::

		@startuml
		:Main Admin: as Admin
		User <|-- Admin
		@enduml

2. Relation entre cas d'usages
================================

On peut relier deux cas d’usages par une relation

	*
		**de généralisation** : qui représente deux cas d’usages ayant des fonctionnalités similaires.
		(FiltrerAllergies hérite de Filtrer). il s’agît d’une disjonction (un cas peut être relié par
		plusieurs généralisations qui symbolisent que l’on peut faire chacun de ces cas (ça ou ça ou ça))
	*
		**d’inclusion** : si un cas d’usages appelle forcément un autre au cours de son utilisation
		(on met « include » sur la flèche, la flèche par du cas d’usage qui appelle vers celui appelé),*
		l’un des cas doit être à part entière.
	*
		**d’extension** : sous une condition, on appelle un cas d’usage.
		(on met « extends » sur la flèche, la flèche part du cas appelé vers celui qui appelle)

.. danger::

	Attention, pas de relations temporaires (par exemple si une commande implique de choisir
	un repas PUIS de payer, on ne lie pas commande à choisir repas puis à payer CAR c’est
	temporel ! On relie commander à choisir repas et payer (2 cas). )

On peut résumer les include/extends :

	* si un cas d'usage en appelle un autre, on met un "include"
	* si un cas d'usage peut ou non en appeler un autre, on met un "extends"

.. uml::

		@startuml
		left to right direction
		skinparam packageStyle rectangle
		actor client
		rectangle borne {
			client -- (retirer argent)
			(retirer argent) .> (saisir code) : include
			(aide) .> (retirer argent) : extends
		}
		@enduml

2. Lire/Créer un DCU
======================

Pour lire, créer et interpréter un DCU, il faut trouver quel est le système,
les acteurs et les cas d'usages.

Puis il faut identifier ce que modélisent les relations des acteurs aux cas d'usages,
ainsi que des cas d'usages aux autre cas d'usages.

Les étapes sont les mêmes pour la création ou pour la lecture.

3. Exercices
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