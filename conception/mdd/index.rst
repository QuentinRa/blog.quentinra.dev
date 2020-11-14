.. _mdd:

================================
Model-driven development (MDD)
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/11/2020}`

Il s'agit d'une mode de développement extrême
dans lequel un logiciel est entièrement conçu (étape conception)
et le développement est le reflet exact de ce qui a été conçu.
(même classes, attributs, constructeurs, ... par exemple en Java).

.. danger::

	Ce cours demande des bases dans les cours

		* :ref:`dcu`
		* :ref:`dc`
		* :ref:`dss`

	car le Model-driven development n'est qu'une stratégie optimale
	pour exploiter aux mieux les diagrammes UML.

1. Méthodologie
===================================

1. \
	**trouver les cas d'usages**

	Il s'agit de créer une DCU (diagramme de cas d'usage) avec tous les utilisations de
	l'application comme lancer/fermer le programme, ...

	Attention, par exemple si une action se déclenche car l'utilisateur fait une action,
	alors le cas d'usage n'est pas l'action à faire mais le résultat obtenu par l'action

2. \
	**Création du DC (basique)**

	Création d'un diagramme de classes avec les potentielles classes de l'application.
	A ce stade, ajouter les attributs n'est pas important, il faut mettre tt ce qui vous viens en tête.

	Astuce: Vous pouvez sur StarUML colorier de différentes couleurs les classes de la vue, du model, et du controller.

3. \
	**Diagrammes de séquence**

	Il faut faire un diagramme de séquence pour chaque cas d'usage.
	Il s'agit de partir d'une action par exemple "exécution du programme" et de faire tous les
	appels de méthodes avec leurs arguments. ((l'exécution du programme appelle la méthode main de la classe X.
	La méthode main créé x variables, leurs types, les méthodes appelées etc... )

4. \
	**Mise à jour du CDC**

	On ajoute les nouvelles classes, les nouveaux attributs etc... découverts en faisant
	les diagrammes de séquences.

	Les classes sont reliées avec des flèches qui ont un sens. Elle indiquent qu'une classe
	contient une référence d'une autre classe et/ou inversement.

5. \
	**Code**

	Le programmeur code exactement le schéma UML.

2. Exercices
==============

aucun

-----

**Crédits**
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune