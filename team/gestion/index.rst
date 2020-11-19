.. _gestion_projet:

================================
Gestion de Projet
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 19/11/2020}`

Ce cours vise à vous aider à gérer vos projets, principalement
en équipe. Vous trouverez principalement

	* des infos sur le déroulement d'un projet
	* le vocabulaire des maitres de la gestion de projet
	* les outils pour vous aider
	* comment gérer votre équipe
	* comment planifier des réunions et communiquer avec votre équipe
	* alternativement, vous pouvez allez plus loin avec les cours : :ref:`scrum` et :ref:`cdc`.

1. Vocabulaire
===============================

**Besoin** : C'est ce que votre client veut.

**Livrables** : C'est ce que vous livrez au client.

**Jalons** : Les dates clef d'un projet, par exemple la signature d'un contrat.

Périmètre du projet
	Ensemble de tout ce qui concerne le projet, donc les tâches et leur durée, les livrables, le
	budget (enveloppe budgétaire) etc...

HJ "Homme-Jour"
	HJ est l'abréviation de Homme-Jour. Il s'agit de l'unité généralement utilisée pour désigner
	le coût d'une tâche.

**Maitre d'ouvrage** : caractérise la personne en relation avec le client.

**Maitre d'oeuvre** : caractérise la personne en relation avec le côté technologique.

2. Déroulement d'un projet
===============================

Un projet à deux vies et deux équipes généralement différentes pour chacune.

	* équipe **build** ou **projet** : équipe normalement temporelle qui vient travailler sur le projet et crée la première version
	* équipe **run** ou d'**exploitation** = **mco** (maintient en conditions opérationnelles) fait tourner le logiciel (maintenance)

Cela se déroule généralement comme ça :

.. image:: /assets/team/gestion/vie.png

Tout d'abord pour commencer

.. toctree::
		:maxdepth: 1

		Analyser le besoin, établir le périmètre du projet         <steps/setup>
		Répartir les activités dans le temps                       <steps/gantt>
		Étude des risques                                          <steps/risk>

Une fois que vous avez fait ces 3 étapes, vous êtes prêts pour rédiger
le cahier des charges ou les spécifications (:ref:`cdc`).

Par la suite, vos tâches quotidiennes seront

	* mettre à jour le diagramme de GANTT
	* travailler sur le projet ^^
	* gérer les réunions, la communication dans l'équipe
	* (optionnel) présenter votre rendu intermédiaire au client pour un retour

Enfin, une fois le projet sur la fin, vous aurez sûrement à gérer

	* les tests (si vous en avez prévu/pas fait au fûr et à mesure)
	* la documentation (s'il en faut une, utilisateur et/ou pour la prochaine équipe ) [#2]_

.. [#2] Il existe une personne appelé le DCO qui fait  le lien entre les deux équipes.

**Il est recommandé de toujours avoir une version de fonctionnelle et testable/utilisable de votre projet**.

3. Gérer son équipe (chef de projet)
=======================================

Les points importants à gérer dans une équipe sont (Chef de projet, ou autres) :

	*	Collaboration (->outils), partage d’informations, échanges
	*	Intérêt de chacun
	*	Recherche de l’erreur (pas du coupable)
	*	Motivation, adhésion des membres de l’équipe
	*	Gestion des conflits

Durant le projet, des changements plus ou moins importants peuvent avoir lieu, que ce soit sur le programme
ou dans les membres de l’équipe.

Cela nécessite un effort d’adaptation, une possible surcharge pour les membres. On représente ces notions par
la courbe du changement.

.. image:: /assets/team/gestion/courbeC.png

Dénis : refus de changer
Résistance : négociation, marchandage
Exploration : créativité, recherche de soi, changement déclenché
Engagement : Motivation de l’entourage, performances en croissance

On distingue 3 types de personnes face au changement :

	*	les opposants (contre) : 10%
	*	les proactifs (pour) : 10%
	*	les passifs (attendent des preuves) : 80%

4. Réunions et reporting
=======================================

Les réunions comprennent les échanges avec le reste
de l'équipe (suivit=quotidienne) et celles avec le client (pilotage=1 fois par mois).
A chaque réunion, un compte rendu de réunion est rédigé.

Le reporting consiste a régulièrement partager les informations avec les intervenants
du projet.

.. toctree::

	Réunions  <report/reunions>
	Reporting <report/reporting>

-----

**Crédits**
	* William GUISSEFFI (enseignants à l'IUT de Sénart-Fontainebleau)
	* Florent MADELAINE (enseignants à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune