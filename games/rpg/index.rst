.. _rpg:

====================
Coder un RPG (2D)
====================

| :math:`\color{grey}{Version \ 0.5.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 19/03/2021}`

Un RPG (Role-playing game) ou jeu de rôles est un type de jeu dans lequel
on retrouve un peu tout ce que vous trouver dans les autres jeux donc

	* des combats
	* de l'exploration
	* des quêtes

et généralement le tout formes un monde complet. Il s'agit donc d'un défi à coder,
surtout si vous n'utilisez pas de GameEngine.

1. Structure
==============

Principalement tout ce que j'ai appris vient des enseignements de
Dan SCHULLER (https://howtomakeanrpg.com/), dont le livre, écrit en lua,
explique le processus de création d'un RPG. Je le recommande, cette page
est mon retour d'expérience.

.. toctree::
	 :maxdepth: 1

			Architecture d'un RPG                    <files/layout>
			Conseils avant son premier RPG           <files/conseils>
			Note sur le système de combat des JRPG   <files/jrpg>

On écrit PNJ pour personnage non joueur.

STEP 1 : La Map
================

En fait la première chose qu'on voudrait faire c'est afficher un joueur plutôt que la
map, moi c'est ce que j'ai fait (partie suivante), mais vu que le joueur est ajouté
sur la MAP, il est normal de commencer par la MAP.

Vos étapes sont

	* afficher une tile, c'est à dire un pixel ou une case de la MAP
	* déplacer le tile en haut à gauche, on n'oublie pas de centrer le tile (x+width/2, y-height/2 par exemple)
	* afficher une map de tiles

		* c'est généralement un tableau
		*

			à une dimension c'est mieux (en mémoire c'est plus rapide), mais faite une fonction qui prends i,j et retourne un indice

				.. code:: java

						//exemple en java
						public int deuxDimensionsVersUneDimensions(int colonne, int ligne, int largeur){
						 //on va calculer position, qui contient la position dans un tableau à une dimension
						 int position;
						 position = ligne * largeur + colonne;
						 return position;
						}

						public Point uneDimensionsVersDeuxDimensions(int indice, int largeur){
						 int ligne, colonne;
						 ligne = indice/largeur;
						 colonne = indice%largeur;
						 return new Point(colonne, ligne);
						}

		* si vos tiles sont des images (une image/tile), essayez de faire un atlas
		* ne dessinez que ce qui est affiché (si votre map est plus grande que l'écran)

	* ajoutez une caméra

		* une fonction pour déplacer la caméra
		* une fonction pour la centrer à un point

STEP 2 : Le héro
=================

	* Afficher le héro
	* Le mettre au bon niveau (si vous utilisez tiled)
	* mettez le sur une tile, ajustez si besoin des pieds
	* coder son déplacement

		* de tile en tile ? libre ?
		* faites en sorte que le mouvement soit "doux" (smooth movement) en utilisant delta

	* centrez la caméra sur le joueur
	* ajouter des animations

		* animation par défaut
		* comportement des animations (on fait la frame 1 2 3 puis on revient en 1 ?)

	* collision avec la map

		* sur tiled, on peut ajouter un niveau invisible qui contient une tile ou aucune. S'il y a une tile sur ce niveau alors on interdit l'accès.
		* sinon il faut trouver un autre moyen de mémoriser des cases accessibles (tableau de 1 et 0 ?)

	* vérifier que le joueur peut se déplacer avant d'autoriser le déplacement
	* créer des zones d'interactions

		* map de déclencheurs et d'actions (si l'utilisateur appui sur A et est devant la porte, on le téléporte sur le map B)
		* il existe des déclencheurs

			* arrivée sur une case et départ d'une case
			* appui sur une touche, ...
			* ...

STEP 3 : Personnages non joueurs PNJ
========================================

Pour gérer facilement les PNJ, on fait généralement des squelettes de chaque
catégorie de PNJ.

	* coder l'affichage de un/deux PNJ
	* gérer leurs déplacements (ils ne marchent pas en continu, parfois font des pauses)
	* gérer la collision avec le joueur

		* on peut vérifier s'il y a collision entre le joueur et tous les PNJ
		* on déplace le joueur/PNJ s'il y a collision
		* attention à ne pas envoyer quelqu'un hors de la MAP

	* généraliser pour tous les PNJs

STEP 4 : Interface
=======================

	* coder vos composants si besoin (panels, boites de dialogues, toast, ...)
	* tips: pour faire une barre de progression (HP/MP), on superpose la barre vide à la barre remplie
	* créez vos menus
	* codez les éventuelles transitions (écran noir/une animation)

		* quitte/Entre dans une ville/donjon/...
		* Entre/Sort d'un combat
		* Va dans un menu

STEP 5 : Stats
================

Implémentez vos stats, n'oubliez pas de converser

	* min et max
	* un moyen de calculer les effets (épée: force +5)
	* décider de l'ordre d'application des effets (% avant les +/... ? buff avant debuff? fois avant plus?)

On code la fonction de leveling

	* niveau des ennemis s'adapte au joueur ?
	*
		Comment calculer le nombre d'expérience points (xp) qu'il faudra avoir pour passer au niveau suivant?
		S'il beaucoup de chose à monter de niveau (plusieurs perso, équipement etc... il y a t'il beaucoup de
		moyens de monter de niveaux ?) ?

		Si oui alors il faut choisir une fonction de leveling dans laquelle on passe facilement au niveau suivant
		sinon il faut choisir une fonction dans laquelle on prends longtemps à monter de niveau.

		D&D
			* :math:`500 * (niveau ^ 2) - (500 * niveau)`
			* niveau 10 = 62000 xp
			* leveling seulement hero

		PokemonG1
			* :math:`round((4 * (niveau ^ 3)) / 5)`
			* niveau 10 = 1500xp
			* leveling beaucoup

Il faut déterminer de combien augmenter les stats.

		* vous pouvez générer un nombre aléatoire dans un intervalle (Utilisez les dés)
		* vous pouvez n'augmenter que les stats liées à la classe ou alors augmenter de façon plus importante les stats liés à la classe
		* vous pouvez augmenter les stats de la classe d'un certain nombre puis augmenter les certains stats (aléatoires) d'un certain nombre (aléatoire, interval)
		* vous pouvez faire une grille (force 1~8, vitesse 3~5, ...) et noter le % d'utilisation (si attaque au point, alors force ; attaque en premier alors vitesse ; etc...). Vous attribuer alors des stats en fonction du profil du player. Le % correspond à un modification sur la probabilité que ce stat soit augmenté, ou alors % de chance d'avoir une amélioration de stats supplémentaires.
		* On peut avoir une stat de croissance qui est un modificateur sur la vitesse de leveling (gagne plus de stats si élevé).

N'oublier pas de faire des tests, tester combien de HP une potion doit donner, etc...

STEP 6 : Inventaire
====================

	* ajouter des items
	* ajouter leurs effects
	* coder l'interface de l'inventaire
	* gérer des trucs basiques comme

		* peut-on stacker des items ?
		* taille de l'inventaire ?
		* utiliser/jeter des items ?
		* voir des infos sur un item ?

	* pour équiper un item, vérifiez les restrictions
	* comment est géré le loot ?

		* drop de l'argent ? (comment montant est choisi?)
		* drop un item ?

STEP 7 : Combats
==================

Il faut décider comment l'ordre d'attaque est décidé (stat ? ordre logique ? ...)

Le combat est une suite d'évents. On prends les événements de tout le monde.
On trie ensuite les événements selon l'ordre d'attaque. Si une personne meurt,
alors il faut supprimer ses événements.

Il est conseillé de commencer par une version texte puis de passer à la version graphique.

Vous pouvez faire différentes couleurs pour les barres de vies.

Un design commun : fond, ennemies à gauche, héro à droite. Panneau d'informations en bas.

Animations de combat : esquivé, raté, critique, contre. Comment sont fixés les taux ?

Comment le loot est présenté ? (corps à looter ? fin du combat ? ...)

Possible de fuir ? Tout le temps disponible ?

STEP 8 : Quêtes
================

Début du jeu et Mécaniques

	* Début ? Suite des événements ?
	* Que peut-on faire (vitesse, sauter, courir) ? Où peut-on aller (taille) ?
	* Qu'est-ce qu'on trouve à chaque endroit ? (monstres, boutiques, ...)

Gestion des quêtes, pour chaque quête on a

	* un niveau requis
	* un nom
	* une description
	* une récompense
	* une date limite ?
	* un lieu ?

STEP 9 : Sauvegarde et chargement
===================================

Vous allez sauvegarder toutes les informations ce qui comprends

	* temps de jeu ?
	* argent ?
	* quêtes terminés ? progression ?
	* objets récupérés ?
	* inventaire des marchands ?
	* informations sur le joueur

Vous pouvez utiliser un système de flags, par exemple

	*	trouver l'objet x dans la cave ? non
	*	parler avec xxx ? non
	*	... ? non

Vous sauvegardez alors les valeurs et lisez les flags pour déterminer l'état du jeu.

Pour un jeu complexe, peut être utiliser un système d'id : toutes les quêtes, objets, ...
ont un id (unique ! deux mêmes objets ont un id différent).

	*	quêtes terminés ? [1,35,78,94]
	*	objets récupérés ? [19,20,22,277]
	*	inventaire ? [19,20,22]
	*	niveau ? 15
	*	map actuelle ? 1856
	*	position ? (x=0, y=15)
	*	stats ? {xp: 1560, ...}

-----

**Crédits**
	* Dan SCHULLER (https://howtomakeanrpg.com/)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://howtomakeanrpg.com/
	* http://howtomakeanrpg.com/a/index.html