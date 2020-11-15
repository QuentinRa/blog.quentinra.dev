.. _relation:

================================
Modélisation relationnelle
================================

| :math:`\color{grey}{Version \ 1.0.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 15/11/2020}`

La modélisation relationnelle à pour objectif depuis ce que veut un client,
d'obtenir une base de données la plus proche de ce qui réponds à son besoin.

Cela passe par trois grandes étapes, que vous pouvez sauter/raccourcir
(si vous êtes la même personne qui a écouté le client et celle qui fait la base, par exemple) :

	* depuis un texte de ce que veut le client, obtenir un diagramme de bases de données
	* depuis un diagramme de bases de données, obtenir une écriture relationnelle
	* depuis un écriture relationnelle, créer la base de données relationnelle

On parle respectivement de

	* modélisation conceptuelle
	* modélisation relationnelle
	* implémentation physique

1. Création du diagramme de base de données
=================================================

Tout d'abord, vous devez savoir ce qu'est un diagramme de base
de données, le cours est ici : :ref:`ddb`.

Petite rappel de vocabulaire si besoin :

	* **classe** = une représentation abstraite de quelque chose (ex: Personne)
	* **attribut** = les propriétés d'une classe (ex: nom pour une personne)
	* **objet** = une classe qu'on a créée (=implémenté) donc donné des valeurs aux attributs
	* **association** = trait entre deux classes
	* **identifiant/discriminant** (ou clé) = un attribut qui prends des valeurs uniques et non nulles
	* **généralisation (ou héritage)** = parent généralise un enfant ça veut dire qu'un enfant est un parent mais avec des trucs en plus

**Créer un diagramme de base de données depuis un texte**

	1. \
		On souligne tout ce qui est CONCRET (noms, valeurs, lieux, …)

	2. \
		On fait un tableau à deux entrées : données et informations.
		Les données sont celles qu’on a récupéré, information représente ce qu’est la donnée.

		Ex : Dupont est une donnée et l'information de la donnée est un nom d'un client par exemple

	3. \
		On regroupe les données s’il elles concernent un même rôle : si on a nom d'un client, prénom d'un client
		alors on créé un rôle client avec (nom, prénom).

		On n’a pas à trouver des rôles pour tout le monde, toutes les infos ne sont pas forcément
		associées à un rôle.

	4. \
		On crée nos classes à partir de nos rôles,
		on souligne le discriminant (on en crée un s’il n’y en a pas dans le texte/données)...

	5. \
		On crée les associations/classes d’associations

	6. \
		On essaye de placer les données restantes si posssible

	7. \
		On met la multiplicité

2. DBD vers modèle relationnel
==============================================

La modèle relationnel, est une représentation d'un diagramme de base de
données en utilisant le langage relationnel, c'est-à-dire une représentation
textuel de votre base de données.

Relation
	Une relation R est un ensemble tel que les éléments soient des attributs
	ayant un type : R(attribut=>domaine, ...).

	Le domaine correspond aux valeurs possible pouvant être prises par un attribut,
	donc dans presque tout les cas, il s'agit du type de l'attribut.

La syntaxe d'une relation est

	* NomRelation(attribut=>type, #clef=>type, clef_étrangère=>Relation.attribut, ...)
	* NomRelation(attribut=>type, #(clef=>type, clef2=>type), ...)

Il existe 7 grandes règles

.. toctree::
    :name: exercices
    :maxdepth: 1

		Règle 1 : une classe donne une relation				          <rules/rule1.rst>
		Règle 2 : association n..* vers m..*	                  <rules/rule2.rst>
		Règle 3 : association n..* vers 0..1 ou n..* vers 1			<rules/rule3.rst>
		Règle 4 : associations 1 vers 1	ou 0..1 vers 0..1       <rules/rule4.rst>
		Règle 5 : associations réflexives				                <rules/rule5.rst>
		Règle 6 : héritage				                              <rules/rule6.rst>
		Règle 7 : associations n-aires				                  <rules/rule7.rst>
		Règle 8 (extra) : cas particuliers                      <rules/rule8.rst>

.. warning::

	Le modèle relationnel finit souvent par être accompagné de notes, il s'agit de contraintes
	que le programmeur devra respecter, pour garantir une cohérence avec le diagramme de bases
	de données

		* :code:`clef(attribut)` : pour les clef artificielles déclarées
		* :code:`not null` : si un attribut ne peut pas prendre de valeurs nulles
		*
			:code:`attribut in relation` : s'il doit forcément exister une occurence de attribut dans relation (souvent lié
			aux multiplicités 1..*).

3. Modèle relationnel vers implémentation physique
=====================================================

L'implémentation physique est généralement en SQL (cours :ref:`sql`). Dans ce cas

	* une relation donne une table
	* les attributs de la relation sont ceux de la table
	* vous devez faire en sorte que les contraintes soient respectés

		* contrainte sur le nombre de tuples
		* contraintes d'unicité (clefs)
		* contraintes de clef étrangères
		* contraintes nul ou non null
		* ...

Exercices
==============

aucun

-----

**Crédits**
	* Pierre VALARCHER (enseignant à mon IUT)
	* Marie SAFRANSKI (enseignant à l'ENSIIE)
	* Julien FOREST (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* lien