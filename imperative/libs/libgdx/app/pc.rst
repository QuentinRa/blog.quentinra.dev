===============================
Installation PC uniquement
===============================

.. _Libgdx Setup: https://libgdx.com/dev/setup/
.. _JDK8: https://github.com/ojdkbuild/ojdkbuild

Il y a un tutoriel en 4 étapes sur le site officiel : `Libgdx Setup`_.
Juste si besoin, normalement non, pour télécharger le JDK 8 sous Windows `JDK8`_.

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