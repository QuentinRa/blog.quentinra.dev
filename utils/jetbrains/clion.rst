=====================
CLion (C/C++)
=====================

Un IDE très peu facile à utiliser, car il utilise CMake pour compiler.
Cela pose un certain nombre de problèmes

	* vous devez apprendre CMake (non! pas du tout en fait)
	* vous êtes limités par CMake en terme de librairies (oui :code:`😭`, voir plus bas)
	* les fichiers non associés à CMake ne seront pas corrigés (pas de vérification de syntaxe...)

Donc pour plus de détails, vous allez créer un fichier :code:`CMakeLists.txt` à la racine,
dont le contenu est assez simple et change rarement (si vous voulez ajouter des librairies
par exemple). Si vous voulez utiliser des librairies, alors parfois c'est très compliqué,
donc je mets toutes mes trouvailles ici !

Enfin, il faut bien s'assurer que les fichiers sont compilés par CLion, donc

	* tous les .c utilisés sont dedans
	* tous les .h utilisés sont dedans
	* et : les .h sont liés au .c (directement=include ou indirectement avec un .h include dans le .c qui include d'autres .h)

Voici le contenu d'un CMakeLists.txt

.. code:: cmake

		cmake_minimum_required(VERSION 3.16.3) # ou 17
		project(nom_projet C) # le nom du projet, et on indique que c'est du C
		set(CMAKE_C_STANDARD 99) # définit le standard

		# une cible est comme une cible Makefile, voir après
		# vous pouvez avoir plein de cibles, il faut lister tous les .c et .h
		add_executable(nom_cible main.c main.h ...)

Dans ce menu, vous pouvez retrouver vos cibles (ici prim, le 2) et compilez (1)
ou lancer (+compiler, la flèche verte 4).

.. image:: /assets/utils/jetbrains/cl1.png

Le 3 indique le profil utilisé pour compiler. Un profil permet par exemple d'avoir
des options de compilation de DEBUG (development) et des options de compilation
RELEASE (production) différentes. Vous n'en n'aurez certainement pas besoin
mais pour créer un profil : Settings > cmake (et vous mettez :code:`-DCMAKE_CXX_FLAGS="-Wall -Wextra"`
par exemple comme options). Vous pouvez le mettre directement dans le CMakeLists.txt

.. code:: cmake

	# options -Wall -Wextra pour tous les profiles
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

.. toctree::
	 :maxdepth: 1

		Utiliser la librairie pthread <clion/pthread>
		Utiliser des libraires/.h/.a  <clion/lib>
		Changer de compilateur        <clion/comp>
		Remote Working                <clion/remote>

Si vous n'avez pas CMake d'installé, vous pouvez l'installer via WSL
en suivant ce tutoriel https://www.jetbrains.com/help/clion/how-to-use-wsl-development-environment-in-product.html#wsl-tooclhain.


