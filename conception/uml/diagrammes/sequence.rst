.. _dss:

============================================
Diagrammes séquence
============================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/11/2020}`

Le diagramme séquence représente un exemple (donc totalement instancié) d’une utilisation de l’application.

On va notamment représenter tous les appels de fonction, avec leurs arguments et leur retours.

Il est constitué de deux parties :

	* Synopsis
	* Diagramme
		* Séquence système : on ne connait pas le code, on part du synopsis
		* Séquence détaillé : on connait le code

1. Synopsis
=========================

Il s’agît d’un court texte, complètement instancié (les acteurs ont des noms, les arguments des valeurs...),
concentré sur 1-5 cas d’usages, décrit du point de vue de l’utilisateur qui interagit avec le système.
Le texte est compréhensible par un non informaticien.

Pour interpréter un synopsis, on se demande :

	* quels est le système et quels sont les acteurs
	* quels sont les cas d’usages
	* quel est son DCU

2. Diagrammes séquence Système
================================

Il s’agît d’un diagramme séquence crée en boite noire :
on ne donne pas les machineries et on part du synopsis.

Les diagrammes séquence sont généralement boites (contenant nom: classe),
avec une ligne en pointillés qui descend et qui correspondent à la vie de l'objet (dit ligne de vie).

On fait des flèches (avec un nom dessus) partant de la ligne de vie d'un objet à celle d'un autre objet,
pour montrer qu'il y a une interaction entre les deux.

La première flèche (qui part) est l'appel, celle qui revient est la réponse.

.. uml::

	@startuml
	"Bob : Personne" -[#red]> "Alice : Personne" : hello
	"Alice : Personne" -[#0000FF]-> "Bob : Personne" : ok
	@enduml

Généralement, il y a un délais entre l'appel et le retour. On met un petit
rectangle pour représenter cette durée.

.. image:: /assets/conception/uml/seq/seq2.png

2.1 Messages synchrones et asynchrones
-------------------------------------------

Lorsqu’une opération renvoi quelque chose (void, String,…) on parle de message synchrone = appel = bloquant.

Si l’opération lance un nouveau thread par exemple, elle ne renvoi rien.
On parle de message asynchrone.

2.2 Cohérence
-------------------------------------------

Il n'y a pas de retour avant un appel (logique).

A ne peut pas appeler une fonction dans B qui n'existe pas.

Deux objets qui ne sont pas reliés sur un diagramme de classes ou un diagramme de cas d'usages
ne peuvent donc pas être liés sur un DSS, sinon c'est qu'il était lié sur les autres.

3. Diagrammes séquence Détaillé
==================================

On a à peu près tout pareil qu'un diagramme séquence système, sauf

	* On ajoute les création d’objets et on donne des arguments aux méthodes.
	* On écris la documentation à côté :

		* qui appelle la méthode
		* quel sont des arguments
		* quel est son type de retour

Pour créer un objet, le message envoyé est « create » et la référence de l’objet crée est renvoyé.

S’il est détruit, alors son cycle de vie finie avec une croix.
Si on le détruit, alors le message envoyé est « destroy ». (une croix)

4. Cadres d'interactions
=============================

Les cadres d’interactions permettent d’ajouter des algorithmes aux diagrammes séquences.

4.1 le cadre alt (=alternatives) et opt (= optionnel)
------------------------------------------------------------

Le cadre d’interaction alt et une structure if() else if else avec elseif et else facultatifs.
On met une [garde] qui correspond à la condition, on exécute les appels du bloc si elle est validée.

.. uml::

		@startuml
		Alice -> Bob: Authentication Request

		alt Authentication OK

				Bob -> Alice: Authentication Accepted

		else

				Bob -> Alice: Authentication Refused

		end
		@enduml

Le cadre opt est un cadre alt mais seulement un if(condition) then code.

4.2 le cadre loop
------------------------------------------------------------

Une simple boucle while, tant que la condition est valide.

.. uml::

		@startuml
		loop [condition]
				A -> B: appel

				B -> A: retour
		end
		@enduml

4.3 les cadres sd (sequence diagram) et ref (reference)
------------------------------------------------------------

Sq est un cadre dans lequel on met un diagramme de séquence, comme si on le met dans une variable.
On peut diviser notre diagramme de séquence en sous diagramme et ref permet de les appeler.

4.4 les cadre par (parallèle), seq (séquence), critical
------------------------------------------------------------

par exécute simultanément tous ses blocs, et seq les fait un par un.

.. uml::

		@startuml
		Alice -> Bob: Authentication Request

		par

				Bob -> Alice: Authentication Accepted

		else

				Bob -> Alice: Start session

		end
		@enduml

critical indique une action qui doit forcément marcher si on veut continuer

4.5 le cadre break (interruption)
------------------------------------------------------------

Il s’agît d’un fragment qui s’il est exécuté (garde),
alors met fin à tout appel de méthode et à l’exécution du bloc.

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