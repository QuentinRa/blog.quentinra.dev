.. _ddb:

========================================
Diagrammes de base de données
========================================

Le diagramme de base de données est un diagramme
de classes, avec quelques changements des sémantiques (=sens)
de certains symboles et quelques ajouts.

.. warning::

	:ref:`dc`

	Pour une utilisation minimaliste, vous devez

		* comprendre les notions de  classe, objets, attributs, association et de multiplicité
		* il est vraiment mieux de connaitre la notions d’héritage
		* éventuellement vous pouvez également regarder les notions d’abstraction et de composition

1. Vocabulaire et nouvelles notations
=========================================

Identifiant
	Généralement appelé clé par abus de langage (pareil que héritage et généralisation, la clef
	est la notation concrète de la notion d'identifiant), un identifiant ou groupe d'identifiant
	sont des attributs qui ont forcément une valeur unique et non nulle.

	**Notation**

		* On souligne généralement une clef
		* On peut également mettre # devant le nom de la clef

Contraintes d’intégrité
	Il s'agit simplement d'un mot englobant toutes les contraintes tel que le type des attributs,
	la multiplicité et le respect des propriétés (attribut dans un interval, clef primaire etc...).

2. Ce qui est différent
=========================================

On ne met généralement plus de visibilité devant un attribut (les #, +, - et ~). Un # devant un attribut
ne veut plus dire qu'il est protected mais que c'est une clef.

Les classes n'ont généralement pas d'opérations (=fonctions/méthodes).

Un attribut souligné n'est plus un attribut static mais une clef.

3. Exercices
=====================

aucun

-----

**Crédits**
	* Florent Madelaine (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune