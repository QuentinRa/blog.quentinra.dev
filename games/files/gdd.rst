===========================
Game Design Document (GDD)
===========================

Vous allez sûrement revenir sur certains points durant le développement mais plus vous en faites maintenant
et moins vous aurez à en faire dans la phase de développement.

Prenez vraiment bien soin de définir votre univers jusqu'au bout (pas de :code:`...` CAR généralement en
ajoutant des exemples au ... on découvre que c'est pas simple du tout). La logique à retenir est donc
de commencer avec un petit univers donc quelque chose d'extrêmement simple (1 carte, 3 personnages, 5 monstres,
10 items par exemple puis d'ajouter des couches une par une).

Astuce n°1 : Si vous éditez le GDD, ne supprimer pas des trucs,
barrez les, annotez-les pour voir votre progression. Cela pourra peut-être donner des idées pour plus tard
et ça peut aussi donner une sentiment d'amélioration.

Astuce n°2 : Si vous manquez d'idées, regarder dans d'autres jeux, ce qui plait et pourquoi.

Voici un plan possible et les thèmes à aborder, fetched from internet and books

.. hint::

	Vous aurez un exemple de Game Design Document dans le cours principal, cette page est volontairement
	très remplie pour essayer de vous faire comprendre quels sont les enjeux auxquels vous devez penser
	avant de faire un jeu.

1. Présentation du jeu
=========================

	* Son nom, son genre (rpg, fps, ...)
	* Un court paragraphe décrivant le jeu.
	* l'audience (le public cible) ?

		* un age
		* un pays (langue)
		* joueurs expérimentés? novices ?
		* Les plates-formes sur lesquelles sera le jeu (PS4, Windows7, ....)

	* L'objectif du jeu ? Ce qu'il a de d'intéressant de façon générale ?
	* Ce qui intéressant dans histoire/motivation du héros/scénario (+dans leur progression)
	* Sentiments/émotions cherchées a être provoquées
	* Qu'est-ce qui rends le jeu amusant? (graphiques/histoire/émotions)

Normalement ici, vous savez quel type de jeu vous allez faire et si on vous demande, vous pouvez donner
une phrase pour le décrire. Vous avez imaginé vos futurs joueurs et avez réfléchit à des raisons pour
lesquelles ils pourraient aimer votre jeu. Par exemple vous avez trouvé des points forts à votre jeu
comme

	* l'univers du jeu
	* l'histoire
	* les graphismes
	* un concept original
	* ou un concept nostalgique
	* des plus-values qu'a votre jeu en plus des 100 milliards de jeux qui pourraient être similaires (checkez itch.io)

En terme de supports techniques, vous pouvez déjà vous imaginer

	* quels type de librairie graphique vous allez avoir besoin
	* quels graphismes vous allez avoir besoin (on verra après où en trouver...)
	* combien de personnes il faudrait (parfois tout seul c'est très dûr, techniquement mais aussi parce que les autres aident à trouver des idées magiques)
	* si vous allez devoir coder un système multi-langues (faut généralement y penser dès la conception)
	* si vous allez utiliser une librairie qui ne marche que sous Windows par exemple ou sous tous les OS

2. Les mécaniques (règles) du jeu
====================================

	* Quel est le but de héros (court, moyen, long terme) ?
	* Que peut faire le héros ? (marcher (vitesse?), sauter (hauteur?), ouvrir porte...)
	* Obstacles rencontrés (actif: ennemies/pièges & passif: labyrinthe/puzzle)
	* Quels sont les items ? leurs effets ? leurs caractéristiques ?
	* Comment est géré le loot ? (taux, effets)
	* Ressources à gérer dans le jeu (vie/endurance/mana/argent/...)
	* A quoi ressemble le monde ? (monde ouvert/linéaire/.../par rapport à l'écran).
	* Quelles sont les places (visuel + infos) ?

En particulier cette partie demande un peu de réflexion, déjà un joueur ou plusieurs ? Ensuite, qu'est-ce qui
définit un joueur ?

	* ses points de vie ? donc il me faut une stat HP. Mais comment elle fonctionne ?
	* endurance ? ... On peut par exemple penser qu'il va courir moins vite s'il n'a pas d'endurance...
	* le héro possède t'il un inventaire ? existe-il un système monétaire ?

On peut aussi se rappeler de trucs presque évident mais facilement oublier : le héro peut perdre
des HP donc il faudra se souvenir du nombre de HP maximal, il faudra définir comment est calculé
ce nombre de HP maximal, comment on régénère de la vie... C'est assez long donc faites très peu de stats
au début.

Au niveau des objets, s'ils ont des effets, comment on applique un effet ? Si l'objet est équipé ?
Si oui, comment (et quand) sont appliqués les effets (un tableau de modifiers ? à chaque attaque ? ...) Il faut
aussi penser "dans quel ordre!". Et s'il y a des limites de réductions/d'améliorations.

3. Spécifications fonctionnelles
==================================

	* Qu'est-ce qui est affiché à l'écran ? (comment, ou)
	* Quels sont les écrans, passage de l'un à l'autre ? (voir wireflow)
	* comment le joueur interagit avec le logiciel ? (son, jouer, quitter, pause)

Ici c'est assez simple, il faut juste faire une maquette de nos écrans. N'oubliez tout de même pas
d'afficher certaines informations et de vous rappeler les interfaces de jeux que vous avez aimé.

	* afficher le niveau, la vie, le mana, ... dans l'écran de jeu ?
	* afficher une mini-carte ?
	* afficher les compétences ?
	* afficher les autres utilisateurs si multijoueurs ?
	* afficher une icône pour le son ? les paramètres ? ...

Essayez de penser aux contraintes techniques, de faire une IHM réfléchie et vraiment de vous inspirer
des interfaces qui sont bien aimées. Ne réinventez pas la roue !

4. Spécifications techniques (les dynamiques)
======================================================

	* équipement matériels requis ? (clavier/souris)
	* quels action sur quel matériel donne quoi (touche z = avancer)
	* comment le joueur devient un pro ? (combos...)
	* mode de jeu encouragé/découragé ? (farming?...)
	* le joueur influence t'il le jeu ? (évènement in-game...)

En gros ici, vous devez réfléchir dès le début si on ne joue qu'avec un clavier/... et comment
on joue.

Généralement, lorsque le joueur commence à jouer, on lui donne pas toutes les compétences,
toutes les mécaniques, ... parce que ça fait trop. Il faut donc mettre en place un système lui permettant
de les apprendre au fur et à mesure.

Vous pouvez par exemple empêcher le joueur d'augmenter trop son niveau en empêchant des monstres de
ressusciter.

Pour l'influence, jouez à The Witcher 3 ou n'importe quel jeu avec des choix et demandez-vous si vous voulez
faire quelque chose du genre.

5. Charte Graphique
========================

	* Style du jeu et thèmes (endroit: fantasy; ambiance : sérieux/fun; rythme : relax/...)
	* Art utilisé? (pixelArt/réaliste) couleurs ?
	* Recherche des ressources

		* Liste des assets/éléments graphiques
		* Liste des musiques et des sons.
		* Décrit quel moment on met la musique (ennemies/objets/ambient)

En clair, votre jeu doit avoir un theme graphique unique pour que le joueur associe ces graphismes
à votre jeu, ou le reconnaisse (et vous reconnaisse). Vous devez essayer de chercher des ressources
(voir autre partie sur le comment) et expliciter leur utilisation.

6. Équipe & Planning
========================

	* Description de l'équipe, des responsabilités (game designer/programmer/writer/...)
	* Équipements nécessaires (logiciels, matériel, ...)
	* Gérer son planning
	* Dates des tests. Qui ? Quoi ? Retours attendus (quels retours seraient intéressants) ?
	* Comment promouvoir le jeu

Ici c'est un peu la partie organisation du cahier des charges, avec les jalons et les tests...