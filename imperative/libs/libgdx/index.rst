.. _libgdx:

=========
Libgdx
=========

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/03/2021}`

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

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://libgdx.com/dev/setup/

.. liens

.. _ApplicationAdapter: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/ApplicationAdapter.html
.. _Game: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Game.html