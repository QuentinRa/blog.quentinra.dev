.. _ddb:

========================================
Diagrammes de base de données
========================================

| :math:`\color{grey}{Version \ 1.0.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 15/11/2020}`

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

Identifiant ou discriminant
	Généralement appelé clé par abus de langage (pareil que héritage et généralisation, la clef
	est la notation concrète de la notion d'identifiant), un identifiant ou groupe d'identifiant
	sont des attributs qui ont forcément une valeur unique et non nulle.

	**Notation**

		* On souligne généralement une clef
		* On peut également mettre # devant le nom de la clef

Identifiant candidat
	Il s'agit d'un attribut pouvant possiblement être utilisé comme une clef. Il est donc
	unique et non nul.

		**Notation**

		* On met une :math:`*` devant le nom de la clef

Identifiant artificiel
	Il s'agit d'une clef dont la valeur est générée, souvent un entier qui augmente
	de 1 à chaque ligne inséré et appelé "id".

		**Notation**

			* une notation pourrait être :math:`\circledast` devant le nom de la clef
			* en pratique, on n'en tient souvent pas compte donc on met rien devant

Contraintes d’intégrité
	Il s'agit simplement d'un mot englobant toutes les contraintes tel que le type des attributs,
	la multiplicité et le respect des propriétés (attribut dans un interval, clef primaire etc...).

Domaine
	Généralement utilisé pour parler des valeurs possible pouvant être prises par un attribut,
	donc dans presque tout les cas, il s'agit du type de l'attribut.

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
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)
	* Julien FOREST (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://stph.scenari-community.org/bdd/mod3/co/mod3c.html
	* https://librecours.net/