=========================
Structure du framework
=========================

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
:download:`build.gradle <../../../../assets/imperative/libgdx/build.gradle>`. Vous devez savoir, mais les
ressources sont dans :code:`src/main/ressources`.