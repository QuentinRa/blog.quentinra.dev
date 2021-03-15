.. _libgdx:

=========
Libgdx
=========

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/03/2021}`

La libgdx est un framework java permettant la création de jeux vidéos, multiplateformes.

1. Nom de partie
===================================

Étant donné que je ne vais pas faire des applications multiplateformes, je montrais principalement
comment installer la version PC uniquement.

Il y a un tutoriel en 4 étapes sur le site officiel : `https://libgdx.com/dev/setup/ <https://libgdx.com/dev/setup/>`_.

Juste si besoin, normalement non, pour télécharger le JDK 8 sous Windows
`https://github.com/ojdkbuild/ojdkbuild <https://github.com/ojdkbuild/ojdkbuild>`_.

Pour l'installation PC uniquement, pas besoin d'IDE, de SDK, juste d'un JDK.

	* on va télécharger la librairie, en particulier les fichiers .jar PC uniquement

		* https://mvnrepository.com/search?q=libgdx
		* Gdx: https://repo1.maven.org/maven2/com/badlogicgames/gdx/gdx/1.9.14/gdx-1.9.14.jar
		* Gdx freetype : https://repo1.maven.org/maven2/com/badlogicgames/gdx/gdx-freetype/1.9.14/gdx-freetype-1.9.14.jar
		* Gdx lwjgl : https://repo1.maven.org/maven2/com/badlogicgames/gdx/gdx-backend-lwjgl/1.9.14/gdx-backend-lwjgl-1.9.14.jar
		* ou Gdx lwjgl3 : https://repo1.maven.org/maven2/com/badlogicgames/gdx/gdx-backend-lwjgl3/1.9.14/gdx-backend-lwjgl3-1.9.14.jar

	* on va tout mettre dans :code:`libs/` à la racine du projet
	* on compile avec :code:`javac -cp "libs/*:."` (Linux)
	* on compile avec :code:`javac -cp "libs/*;."` (Windows)

Si vous utilisez IntelliJ, alors utilisez gradle avec les jar vu plus haut. Sinon vous devez regarder
le cours sur IntelliJ qui vous expliquera comment inclure un .jar dans un projet.

Vous pouvez trouver du code pour tester ici : https://libgdx.com/dev/simple-game/#the-full-source
mais je n'ai pas testé, je remettrais mon code de test plus tard.

Je pense que ces deux liens vous seront utiles

	* https://github.com/libgdx/libgdx/wiki
	* https://libgdx.badlogicgames.com/ci/nightlies/docs/api/

2. Structure
======================

La libgdx contient une arborescence assez complexe, voici les dossier importants

.. code:: bash

		android/ # contient le lanceur android
		android/assets/ #le repertoire des ressources
		core/ # contient les sources que vous allez coder
		desktop/ # contient le lanceur PC
		html/ # contient le lanceur Web
		ios/ # contient le lanceur IOS

En gros dans la version normale, vous aurez votre code dans core, vos fichiers/images dans
android/assets et dans chaque autre dossier (core/desktop/...) vous aurez un lanceur
qui lance la version de votre code html/... Notez que vous allez coder une seule fois, donc seulement
dans core. Le reste est fait automatiquement.

Sauf que nous utilisons la version PC uniquement, sans utiliser leur structure donc nous aurons
quelque chose comme ça

.. code:: bash

		# vous devez donner des chemins d'assets de la forme assets/
		assets/ # on va y mettre nos fichiers, images, ...
		libs/ # si vous n'utilisez pas gradle
		src/ # on y mets notre code

ou simplement, si vous utilisez gradle.

.. code:: bash

	src/ # on y mets notre code
	build.gradle

Mon build.gradle ressemble à ça pour Libgdx 1.9.11
:download:`build.gradle <../../../assets/imperative/libgdx/build.gradle>`. Vous devez savoir, mais les
ressources sont dans :code:`src/main/ressources`.

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://libgdx.com/dev/setup/