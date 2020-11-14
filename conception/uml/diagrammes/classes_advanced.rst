.. _dc_advanced:

====================================
Diagramme de classes (DC) - avancé
====================================

| :math:`\color{grey}{Version \ 1.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/11/2020}`

.. note::

	Dans la continuité du cours de base (:ref:`dc`), ce cours vise
	à vous proposer des nouveaux éléments de syntaxe afin de représenter
	aux mieux vos scénarios.

1. Les associations spéciales
=================================

1.1 agrégations
---------------------

Association où une classe joue un rôle plus fort que l’autre (domine l’autre ex : relation patron (1) - ouvrier (*))

.. uml::

		agrégat o-- "*" "élément agrégé"

1.2 compositions
---------------------

Il s’agît d’une agrégation plus forte où une classe (composant) n’existe pas en dehors de sa relation avec
une autre (composite). (ex : les roues n’existent pas sans voiture)

.. uml::

		Composite *-- Composant : composition

La destruction du composite entraine celle du composant (classe interne).

1.3 Association n-aire
----------------------------

Une association n-aire est une un groupe de n classes toutes reliées
entre elles par une association.

.. image:: /assets/conception/uml/classes/adv2.png

2. Classes abstraites
================================

Une classe abstraite est une classe qui possède toutes les propriétés d’une classe normale
sauf qu’elle n’est pas instanciable
(car au moins une de ses méthodes peut-être abstraite (=non implémentée)).

Elle permet de regrouper une méthode/opération commune mais implémenté différemment
dans ses sous-classes mais qui doit forcément être présente.

On écrit le mot clé « abstract » devant le nom de la classe et/ou on met son nom en italique.

.. hint::

	Une opération peut être en italique pour indiquer qu’elle est abstraite ou être précédée de « abstract ».

3. Interfaces
================================

Une interface est un ensemble d’opérations publiques (sans implémentation). Elle est en relation avec deux types de classes :

	* classes réalisent : implémentent l’interface (Classe1)
	* classes dépendantes : utilisent interface (Classe2)

.. image:: /assets/conception/uml/classes/adv1.png

On peut également représenter une interface comme suit :

.. uml::

		@startuml
		class distributeur implements écran_tactile
		class Client
		Client ..> écran_tactile
		@enduml

Client utilise l’interface écran tactile (=classe2)
tandis que distributeur implémente les méthodes consulter
et retrait de l’interface (classe1).

Une dépendance à une interface est appelé couplage fort (ici client).

On peut implémenter plusieurs interfaces.

La personne que l’on choisit pour implémenter l’interface doit être celle concernée par l’action.

Les interfaces peuvent contenir des méthodes ayant un comportement par défaut,
sur le DC on les annote de « default ». C’est utile si on modifie une interface déjà implémentée.

-----

**Crédits**
	* Florent Madelaine (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Dartois (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucun