.. _libgdx:

=========
Libgdx
=========

| :math:`\color{grey}{Version \ 0.4.12}`
| :math:`\color{grey}{Dernière \ édition \ le \ 15/03/2021}`

La libgdx est un framework java permettant la création de jeux vidéos, multiplateformes.

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

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://libgdx.com/dev/setup/

.. liens

.. _ApplicationAdapter: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/ApplicationAdapter.html
.. _Game: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Game.html
.. _Gdx: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Gdx.html
.. _FileHandle: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/files/FileHandle.html
.. _Files: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Files.html
.. _Audio: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Audio.html