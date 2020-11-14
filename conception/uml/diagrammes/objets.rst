.. _do:

================================
Diagramme Objets
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/11/2020}`

Le diagramme d'objets, est un diagramme très simple,
qui vise à représenter un exemple des valeurs que
pourraient prendre les classes d'un diagramme de classes.

.. note::

	Vous pouvez trouver les cours sur les diagrammes de classes ici :

		* :ref:`dc`
		* :ref:`dc_advanced`

1. Classe vers objets
=================================

Passer d'une classe à un objet consiste simplement à donner des valeurs
à tous les attributs de la classe.

Le nom d'une classe objet est souligné, est prends une valeur quelque conque (pensez
que ce nom est celui de la variable qui va contenir cet objet).

.. uml::

		@startuml

		class User {
			 + nom : varchar
			 + prénom : varchar
			 + ville : varchar
			 + age : int
		}

		object "<u>userRW" as user

		user : nom = "White"
		user : prénom = "Richard"
		user : ville = "St Marie"
		user : age = 66

		@enduml

2. Associations vers liens
================================

Un lien est un trait entre deux objets, tout comme une association est
un trait entre deux classes.

Pour faire des diagrammes objets pertinents, créez un nombre conséquents
d'objets pour que l'on voit la multiplicité entre les objets qui est
bien la même que décrite sur le diagramme de classes.

.. hint::

	par exemple si vous
	aviez une classe bureau et utilisateurs avec cardinalité 2..2 et 1..1, avoir vous créez deux objets
	utilisateurs liés a un objet ordinateur

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