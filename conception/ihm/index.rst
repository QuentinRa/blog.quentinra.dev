.. _ihm:

================================
Interfaces Homme-Machine
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 03/11/2020}`

Une Interface homme-machine (IHM) est l'interface souvent graphique par laquelle
l'utilisateur passe pour controller une machine.

Afin de créer de bonnes interfaces, c'est-à-dire des interfaces
intuitives, faciles d'utilisation, ... des personnes ont étudié
et caractérisé ce qu'il fallait ou non faire pour créer de bonnes
interfaces.

.. hint::

	Objectif des IHM : créer des interfaces qui soient simples, intuitives, faciles d'utilisation
	et adaptés aux utilisateurs.

1. Les étapes
================

.. note::

	Pré-note : les mot wireframe et wireflow, ainsi que les maquettes sont traités dans
	outils (:ref:`ihm_outils`). Les diagrammes UML sont par contre traités dans :ref:`uml`.

Voici une liste d’étapes possibles pour la réalisation d’une interface homme-machine.

	* études des utilisateurs, on crée des catégories d’utilisateurs
	* on fait des tests sur quelques utilisateurs (card sorting)
	* on fait des diagrammes UML
	* on fait une maquette papier et des wireframes (+wireflow)
	* on fait des tests sur la maquette papier
	* on regarde sur une wireframe ou l’utilisateur clique si on lui demande de chercher quelque chose
	* on crée une maquette dynamique (html, css, js, boostrap)
	* on fait encore des tests sur des utilisateurs

Voici une autre liste d'étapes possibles

	* étude d'utilisateurs et création de catégories
	* création d'une maquette dynamique
	* on répète autant de fois que voulu

		* test de faisabilité de la maquette
		* test par des categories d'utilisateurs
		* adaptation de la maquette

2. Identifier les utilisateurs
====================================

Il existe trop de personnes différentes pour pouvoir faire une site qui plaise
à tout le monde.

Il faut répartir les utilisateurs en catégorie, et essayer de satisfaire au mieux les
catégories qui sont les plus importantes.

Vous pouvez créer des catégories en vous basant

	* sur la langue/le pays
	* sur l'age
	* malvoyants, les daltoniens
	* culture
	* le matériel possédé par l’utilisateur (puissance du matériel, taille de l’écran, souris ? clavier ?...)
	* l’orientation de l’écran, les zones accessibles sur un téléphone, tablette sont différentes selon l’orientation
	* si c’est le jour ou la nuit
	* sa connaissance des ordinateurs
	* s’il sait lire !

.. note::

	Le saviez vous ?  Les lecteurs lisent généralement en « F », c’est-à-dire que plus ils descendent et moins ils lisent.

.. _ihm_outils:

3. Les outils
================

Vous avez un certain nombre d'outils pour créer vos IHM :

	* les wireframe : ce sont des images de vos écrans
	* wireflow : il s'agit d'un diagramme qui relie vos écrans et les conditions pour changer d'écran
	*
		cardsorting : vous demandez à une personne de trier les fonctionnalités/menus de votre application par catégories
		afin de déterminer quoi mettre ensemble

Comment créer des wireframes ?

	* powerpoint (facile et rapide)
	* https://app.diagrams.net/ (site, facile et rapide)
	* sketch (macos)
	* photoshop (payant)

Comment créer des wireflow

	* https://moqups.com/ (compte requis)

Créer des maquettes dynamiques

	* Bootstrap, W3CSS ou encore MDBootstrap
	* https://moqups.com/ (compte requis)

CardSorting

	* https://www.optimalworkshop.com/

4. Les 10 principes de Jakob Nielsen
======================================

Jakob Nielsen a étudié et a recensé 10 principes
auxquels vous devez faire attention lorsque vous créez une IHM.

Les 10 principes sont

	1. Tenir informé l’utilisateur
	2. Cacher la complexité à l’utilisateur et suivre les conventions
	3. L'utilisateur contrôle ce qu’il fait et est libre
	4. Respect des normes, conventions, directives et habitudes
	5. Anticiper les erreurs
	6. Reconnaitre plutôt que mémoriser
	7. Flexible
	8. Esthétique
	9. Gérer les erreurs/robustesse
	10. Documentation

Voici plus d'explication sur ce que vous pouvez faire.

1. Tenir informé l’utilisateur
*********************************

L'utilisateur doit toujours savoir ce qui est en train de se passer :
il a fait une action (ex: clic), il doit savoir si son action à marché.

Vous pouvez par exemple

	* utiliser le fil d’Ariane
	* mettre en avant l'endroit ou l'utilisateur se trouve (page sur une site)
	* un bouton change au survol
	* messages de confirmation
	* pourcentage de chargement
	* temps à attendre
	* ...

2. Cacher la complexité à l’utilisateur et suivre les conventions
********************************************************************

L’utilisateur se base sur ses expériences passés pour interagir avec l’interface, on doit faire en sorte de respecter ses habitudes.

Par exemple, le bouton "fermer" est généralement en haut à droite.

On peut donner des informations complexes dans une section « aide » ou « à propos ».

.. note::

	On parle aussi de Skeuomorphisme (ou Skeuomorph design) ce qui signifie qu'on s'attends à ce qu'un objet virtuel (ex: un livre)
	se comporte comme un objet réel (ex: on peut tourner les pages).

3. L'utilisateur contrôle ce qu’il fait et est libre
****************************************************************

On peut toujours revenir en arrière, par exemple avec « undo » et « redo », mettre fin à une action (bouton annuler).

L’utilisateur doit clairement voir qu’il a une sortie de secours.

4. Respect des normes, conventions, directives et habitudes
****************************************************************

Il est important de respecter les normes et directives, par
exemple

	* interne : au seins d'une même famille de logiciels, on s'attend à ce que les mêmes fonctionnalités fonctionnent pareil
	* externe : ne pas changer les habitudes au niveau des icônes (panier sur un site marketing)

De grandes familles de logiciels et des systèmes d'exploitations proposent
des directives pour les logiciels qui tourneront sur leurs systèmes.

5. Anticiper les erreurs
********************************

On empêche un problème d’arriver avant qu’il n’arrive

	* les problèmes techniques (l’utilisateur saisi une date au format y-m-d alors qu’on voulait d/m/y)
	* les accidents (utilisateur crée un compte avec un email mais ce n’était pas le bon)

On doit gérer ces cas, par exemple avec une confirmation avant de valider ou limiter les choix possibles de saisie.

On doit laisser à l’utilisateur le moins de chances possibles de faire (ou qu’il y ait) une erreur.

	* utilisation de choix plutôt que de saisie
	* mettre des indications sur d'éventuels formats, par exemple au survol

6. Reconnaitre plutôt que mémoriser
*************************************

L’utilisateur ne doit pas avoir à retenir plein d’informations, mais va avoir des repères visuels pour se rappeler.
(ex : QCM plus facile pour un utilisateur qu’une question ouverte)

On doit lui donner un maximum d’indices pour qu’il retrouve une information rapidement dans sa mémoire.

7. Flexible
****************

L’application doit être facile à prendre en main par des novices et permettre des raccourcis pour les anciens.

Les utilisateurs ont plusieurs options pour arriver à leurs fins.

Ex: les débutants utiliseront <copier> tandis que les experts auront tendance à utiliser CTRL+C.

8. Esthétique
****************

On ne doit montrer que les informations utiles (ne pas écrire un gros paragraphe pour 3 mots utiles,
des images qui ne servent à rien…) qui complètent les informations nécessaires.

9. Gérer les erreurs/robustesse
********************************

On prévient l’utilisateur lorsqu’une erreur arrive (mettre en rouge…), propose possiblement une solution (un lien qui règle problème).

10. Documentation
************************

Elle peut être nécessaire pour des applications complexes même si, il est préférable de s’en passer (voir 6).

Elle doit être facile à lire, l’utilisateur peut facilement trouver ce qu’il veut faire,
liste des étapes à faire, utiliser des images…

5. Astuces
==============

Voici une liste d'astuces qui vous aideront peut-être

	*
		il vaut mieux faire tout les chargements au lancement plutôt que de faire
		attendre l'utilisateur à chaque fois qu'il ouvre un menu
	*
		Les écrans sont généralement plus larges que haut donc il faut exploiter la largeur plutôt que la hauteur.
	*
		Permettre à l'utilisateur de faire en un minimum de clic les actions importantes (liste déroulante = 3 clic = beaucoup...).

6. Exercices
==============

aucun

-----

**Crédits**
	* Florent Madelaine (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikipedia.org/wiki/Skeuomorphisme