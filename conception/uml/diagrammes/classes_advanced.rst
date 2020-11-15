.. _dc_advanced:

====================================
Diagramme de classes (DC) - avancé
====================================

| :math:`\color{grey}{Version \ 1.1.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 15/11/2020}`

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
		ensemble o-- "*" "élément"
		tout o-- "*" "partie"

1.2 compositions
---------------------

Il s’agît d’une agrégation plus forte où une classe (composant) n’existe pas en dehors de sa relation avec
une autre (composite). (ex : les roues n’existent pas sans voiture)

.. uml::

		Composite *-- Composant : composition

La destruction du composite entraine celle du composant (classe interne).

.. warning::

	La cardinalité du côté du losage est toujours de 1, donc on ne la met généralement pas.

1.3 Association n-aire
----------------------------

Une association n-aire est une un groupe de n classes toutes reliées
entre elles par une association.

.. image:: /assets/conception/uml/classes/adv2.png

On lit ça comme :

	* un patriarche donné dirige * membre et * jeunes maitres.
	* un membre donné est dirigé par * patriarches et * jeunes maitres
	* un jeunes maitres donné est dirigé par * patriarches et * membres

2. Classes abstraites
================================

Une classe abstraite est une classe qui possède toutes les propriétés d’une classe normale
sauf qu’elle n’est pas instantiable
(car au moins une de ses méthodes peut-être abstraite (=non implémentée)).

Elle permet de regrouper une méthode/opération commune mais implémenté différemment
dans ses sous-classes mais qui doit forcément être présente.

On écrit le mot clé « abstract » devant le nom de la classe et/ou on met son nom en italique.

.. uml::

	abstract class ClasseAbstraite

	ClasseAbstraite <|-- Enfant

	class Enfant {
		Object[] elementData
		size()
	}

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

4. Contrainte dynamique
===========================

Une contrainte dynamique est très rarement utilisée. Elle sert
pour indiquer une contrainte que l'on ne peux pas représenter
physiquement (donc par un attribut, une association, ...).

Il s'agit donc d'une annotation qu'on ajoute à destination des lecteurs.

.. uml::

		@startuml

		class Client
		Client -- Produit : payer
		note on link: pas de commande avant de payer

		Client -- Produit : commander
		@enduml

.. _contraintes_association:

5. Contrainte d'association
=============================

Une contrainte d'association peut être

	* une **inclusion** (:code:`{IN}`, :code:`{SUBSET}`, :code:`{I}`) : si une des association incluse existe, alors l'autre aussi.
	* une **exclusion** (:code:`{X}`) : si une des association exclusion existe, alors les autres ne peuvent pas exister
	* une **égalité** ou **simultanéité** (:code:`{=}`, :code:`{AND}`, :code:`{S}`) : si une association existe, toutes les autres doivent exister
	* une **totalité** ou **couverture** ou **inclusif** (:code:`{T}`, :code:`{OR}`) : au moins une des association doit exister
	* une **partition** ou **exclusif** (:code:`{XT}`, :code:`{P}`, :code:`{+}`) : exactement une association existe

La contraintes d'association est un trait en pointillés touchant toutes les associations concernés.

Dans le cas de l'inclusion, c'est une flèche de l'association A vers l'association B pour indiquer
que A ne peut exister que si B existe.

6. Contrainte d'attribut
=============================

Une contrainte d'attribut est par exemple un interval des valeurs
que peut prendre un attribut, ou encore pour déclarer un attribut final (c'est-à-dire
que c'est une constante qui ne changera jamais de valeur).

.. uml::

		@startuml
		Carré: int nombreMagique = 9 {final}
		@enduml

7. Packages
=============================

Un package est un conteneur souvent utilisé pour découper
de grands diagrammes en petit diagrammes.

Si on quitte le model conceptuel, alors créer des packages revient
à créer des dossiers, dans lesquels on classe nos diagrammes.

Les dossiers ont un nom et son liés entre-eux, donc les classes
d'un package sont aussi accessible dans d'autres. Dit autrement, vous
n'avez pas besoin de recopier la totalité d'une classe dans un autre package, car
elle est déjà entièrement définie à un endroit.

.. uml::

		@startuml

		package "Classic Collections" #DDDDDD {
			Object <|-- ArrayList
		}

		package net.sourceforge.plantuml {
			Object <|-- Demo1
			Demo1 *- Demo2
		}

		@enduml

.. note::

	Notez que "net.sourceforge.plantuml" est la syntaxe la plus courante des packages en java.
	Les / du chemin de dossiers sont remplacés par des "." et il n'y a aucune majuscule ni caractères
	non alphabétiques.

-----

**Crédits**
	* Florent Madelaine (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Dartois (enseignant à l'IUT de Sénart-Fontainebleau)
	* Marie SAFRANSKI (enseignant à l'ENSIIE)
	* Julien FOREST (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucun