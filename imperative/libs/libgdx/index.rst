.. _libgdx:

=========
Libgdx
=========

| :math:`\color{grey}{Version \ 0.4.12}`
| :math:`\color{grey}{Dernière \ édition \ le \ 15/03/2021}`

La libgdx est un framework java permettant la création de jeux vidéos, multiplateformes.

Honnêtement, je vous invite à bien y réfléchir à deux fois afin de faire
un jeu en JAVA (pourquoi pas C# ou C++ ou lua ?).
Par contre si vous voulez faire une application, peut-être que c'est
une bonne de la faire en JAVA ou peut-être pas... Cela dépends de vos attentes
et de vos contraintes.

1. Introduction
===================================

Étant donné que je ne vais pas faire des applications multiplateformes, je montrais principalement
comment installer la version PC uniquement.

.. toctree::
	 :maxdepth: 1

			Installation PC uniquement   <app/pc>
			Structure du framework       <app/struct>

Je pense que ces deux liens vous seront utiles

	* https://github.com/libgdx/libgdx/wiki
	* https://libgdx.badlogicgames.com/ci/nightlies/docs/api/

2. Application
=======================

Comme vu précédemment, vous allez avoir des lanceurs (backends/Application) qui vont lancer
le Jeu (Game/ApplicationAdapter/ApplicationListener).

La classe correspondant à votre jeu (ici TestGame) est une classe héritant de `ApplicationAdapter`_ ou `Game`_.
La différence est que la classe Game intègre les screens donc c'est facile de changer d'écrans.

.. toctree::
	 :maxdepth: 1

			Manipulation de Lanceurs        <app/start>
			Classe Game/ApplicationAdapter  <app/game>
			Classe Screen                   <app/screen>
			Stages et Actors                <app/actors>

3. Fichiers
=======================

La classe `FileHandle`_ contient toutes les méthodes liés aux fichiers cependant, on ne peut pas l'instancier.

La classe `Gdx`_ possède un champ static "files" qui contient une classe implémentant l'interface `Files`_ Celle-ci
possède des méthodes permettant de lire un fichier/dossier et le retourne sous la forme d'un `FileHandle`_.

.. code:: java

	FileHandle Gdx.file.methodeOuverture(String chemin);

Il existe 4 méthodes d'ouverture

	* :code:`internal` : fichier internes (dans android/assets ou assets ou src/main/ressources ou ...).
	* :code:`absolute` : chemin absolu
	* :code:`classpath` : dans les dossiers sources, là ou on trouve les fichiers compilés/.jar
	* :code:`external` : carde SD sur android, domicile (~) sur PC.
	* :code:`local` : chemin relatif à la racine de l'application ou stockage interne (privé) sous android

Vous n'allez qu'utiliser interne.

4. Audio
==========

Les format de fichiers sons supportés sont mp3, ogg et wav.
L'interface `Audio`_ gère tous ceux qui est relaté à l'audio ce qui comprends

	* :code:`Sons` : généralement de moins de 10secondes, taille de 1MB généralement
	* :code:`Musiques` : toute le reste

Comme d'habitude, la classe `Gdx`_ possède un champ static qui contient une instance de `Audio`_ prête.
Les musiques, comme les sons, **doivent être libérés** lorsqu'ils ne sont plus nécessaires (dispose())

.. toctree::
	 :maxdepth: 1

			Sons        <audio/sound>
			Musiques    <audio/music>

5. Affichage graphique, Dessin et événements
===================================================

Cette partie vient volontairement après car elle est plus compliquée. On va s'intéresser
au code de la méthode :code:`render` et en particulier à la partie :code:`draw` (qui
dessine un stage).

.. toctree::
	 :maxdepth: 1

			Nettoyer l'écran        <render/clean>
			Introduction au batch   <render/batch>
			Mise en page            <render/layout>
			Affichage d'images      <render/draw>
			Affichage de widgets    <render/widgets>
			Événements              <render/events>

6. Actors
==========

La classe Actor représente n'importe quel élément du jeu (personnage, coffre, sort, boutons, fond d'écran...).

	* coordonnées x,y (setPosition, getX, getY)
	* taille (getWidth, getHeight)
	* rotation (getRotation)
	* origine/point de rotation (getOriginX, getOriginY, setOrigin)
	* zoom (getScaleX, getScaleY)
	* si un objet est visible (isVisible, setVisible)
	* sa couleur (getColor)
	* méthode de déplacement (moveby)
	* actions (addAction, clearActions)
	* une méthode act = leur méthode update
	* une méthode draw = leur méthode de render
	* le stage dans lequel il est (getStage)

**Group**

La classe Group (extends Actor) permet à des Acteurs d'être groupés à un Acteur, ce qui a pour effet que ces
Acteurs seront par exemple dessinés relativement à la position du dit Acteur.

.. code:: java

		Group group = new Group();
		group.addActor(Actor actor);
		actor.setPosition(0f,0f); //coin supérieur gauche du groupe

On peut par exemple placer des habits sur notre personnage, ou un statut au dessus de sa tête...

Attention, l'ordre de dessin des acteurs et du groupe est déterminé dans la méthode draw de l'acteur qui extends
Group. Vous y déciderez si l'appel à super.draw (dessine enfants) doit être avant le code qui dessine l'Acteur
groupe.

**Améliorer la classe Actor/Group**

La classe actor est très générique, voici des méthodes à coder qui pourrait vous être utiles dans
vos réalisations futures

	* charger une texture
	* centrer un élément à une position
	* centrer un élément sur un actor
	* changer l'opacité
	* garder le joueur dans la map
	* définir les limites du monde pour la caméra
	* centre la caméra sur le joueur
	* collision réaliste & mouvement réaliste
	* animations (sprites)
	* savoir deux acteurs sont proches

7. Petites trucs utiles
==========================

.. toctree::
	 :maxdepth: 1

			Cinématiques    <others/cine>
			Collision       <others/collision>
			Animations      <others/anim>
			Tiled           <others/tiled>

8. Faire de belles applications
=====================================

...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://libgdx.com/dev/setup/
	* https://github.com/libgdx/libgdx/wiki
	* https://libgdx.badlogicgames.com/ci/nightlies/docs/api/

.. liens

.. _ApplicationAdapter: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/ApplicationAdapter.html
.. _Game: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Game.html
.. _Gdx: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Gdx.html
.. _FileHandle: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/files/FileHandle.html
.. _Files: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Files.html
.. _Audio: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Audio.html