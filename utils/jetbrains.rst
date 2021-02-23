.. _jetbrains:

==============
Jetbrains
==============

| :math:`\color{grey}{Version \ 0.3.7}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/02/2021}`

Cette page contiendra des tutoriels sur les logiciels
jetbrains donc PHPStorm, IntelliJ Idea, CLion, WebStorm...

1. Général
============

Jetbrains propose des logiciels appelés IDE car ils vous aident à coder en vous donnant des suggestions
par exemple ou avec plein de fonctionnalités (intégration de base de données, correction orthographique,
intégration git, générer des diagrammes UML...).

Contrairement à un IDE comme VSCode qui est polyvalent (Jack of all trades, master of none)
vous devez utiliser un IDE spécialisé dans chaque langage,
ce qui peut couter beaucoup de mémoire disque (10Go 3IDE par exemple). Les interfaces se ressemblent
donc très facile de prendre en main les autres IDE.

	* IntelliJ IDEA, dit idea : :code:`java, ocaml, R` (et gradle/maven)
	* PHPStorm, Webstorm : :code:`php, html, js, bootstrap, css` et les framework js
	* CLion : :code:`C, C++`
	* PyCharm, Datalore : :code:`python` et analyse de données
	* YouTrack : utile pour la gestion de projet
	* CodeWithMe : plugin pour faire du pair-programming

Vous pouvez installer la Jetbrains toolbox pour gérer tout
ça facilement : https://www.jetbrains.com/toolbox-app/.

Les logiciels sont payants mais vous pouvez les avoir gratuitement en étant étudiant
(https://www.jetbrains.com/shop/eform/students).

Je parlerais de jetbrains pour parler des logiciels de Jetbrains.

2. Raccourcis
======================

Voici quelques raccourcis

	* :code:`shift+shift` : ouvre une fenêtre permettant de rechercher options, classes, fichiers récents, ...
	* :code:`CTRL+F` : rechercher un mot/regex/...
	* :code:`CTRL+SHIFT+F` : rechercher un mot/regex/... dans tout le projet
	* :code:`Clic droit dans un fichier`

		* :code:`open in` : ouvrir dans un explorateur de fichiers
		* :code:`generate` : générer les getters/toString/... en java
		* :code:`git` : voir les anciennes versions, ...
		* :code:`refactor` : renommer fichier, une méthode, ... dans tout le projet (ou pas) !

	* :code:`CTRL-D` : si rien sélectionné duplique la ligne sinon duplique la sélection
	* sélection + :code:`CTRL-ALT-T` : vous permet de générer un trycatch, un if, ... autour de la sélection
	* :code:`CTRL-SHIFT-T` : générer un test de la classe actuelle (donc faut être dans une classe)

Vous avez aussi les raccourcis basiques (autre que CTRL-F) comme CTRL-A (tout sélectionner), CTRL-C (copier),
CTRL-V (coller), SHIFT-BEGIN (sélection de position jusqu'au début de la ligne), SHIFT-END (sélection de position
jusqu'à la fin de la ligne) ou encore les SHIFT-FLECHE (sélection ligne haut/bas/...).

Petite précision, jetbrains souligne un mot/méthode/classe/... en

	* jaune : une possible erreur ou documentation manquante
	* rouge : une erreur
	* vert : une erreur typographique
	* gris (pas souligné mais il change le mot en gris) : variable/méthode/classe non utilisée

Vous pouvez faire alt+entrée dessus pour obtenir des suggestions pour résoudre le problème. Vous
pouvez aussi voir dans la barre de défilement de droite les endroits des mots soulignés
et tout en haut vous avez un check vert si tout ok, sinon vous pouvez cliquer et voir
les erreurs/warnings.

.. image:: /assets/utils/jetbrains/jb1.png

3. Général
======================

On rappelle que si vous ne trouvez pas un menu, essayer de faire shift+shift.

Vous pouvez faire en sorte que la molette puisse vous permettre de zoomer/dé-zoomer le code
dans Settings > Editor > General puis Change font size ... (première ligne).

Vous pouvez afficher une petite :code:`*` après le nom du fichier s'il a été modifié (si vous
utilisez git c'est inutile) avec Settings > Editor > General > Editor tabs puis :code:`Mark Modified (*)`.

Vous pouvez changer la langage de la correction orthographique avec Settings > Editing > Proofreading
puis ajouter/retirer des langages mais par expérience la correction orthographique n'est pas toujours
activée (si vous écrivez un .md vous verrez qu'elle est puissante, plus que dans les autres fichiers
comme ce .rst).

.. toctree::
   :maxdepth: 1

		Git      <jetbrains/all/git>
		Database <jetbrains/all/db>
		Todo     <jetbrains/all/todo>
		Terminal <jetbrains/all/terminal>
		Snippets <jetbrains/all/snippets>

4. PHPStorm
============================

Vous pouvez sélectionner la version php en bas à droite.

Parfois phpstorm ne détecte pas que vous utilisez une méthode, ... si vous
n'avez pas explicitement écrit dans l'appel dans le code. Vous pouvez faire
de la phpdoc avec :code:`/** @see class::method() **/` par exemple pour lui faire
comprendre que la méthode est utilisée (et/ou la classe).

.. toctree::
   :maxdepth: 1

		Configuration Remote      <jetbrains/pstorm/remote>

5. CLion
=========================

Mon résumé : un IDE pratique mais ultra chiant à utiliser. Il faut utiliser
un fichier CMake pour activer l'autocompletion (et tout le reste) et c'est un
peu chiant car la compilation n'est pas directe.

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
mais pour créer un profil : Settings > cmake (et vous mettez -DCMAKE_CXX_FLAGS="-Wall -Wextra"
par exemple comme options). Vous pouvez le mettre directement dans le CMakeLists.txt

.. code:: cmake

	# options -Wall -Wextra pour tous les profiles
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

.. toctree::
	 :maxdepth: 1

		Utiliser la librairie pthread <jetbrains/clion/pthread>
		Utiliser des libraires/.h/.a  <jetbrains/clion/lib>
		Changer de compilateur        <jetbrains/clion/comp>
		Remote Working                <jetbrains/clion/remote>

-----

**Crédits**
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* PHPSTORM
	* https://www.jetbrains.com/help/phpstorm/creating-a-remote-server-configuration.html
	* https://www.jetbrains.com/help/phpstorm/configuring-synchronization-with-a-remote-host.html#server-access-config
	* https://www.jetbrains.com/help/phpstorm/uploading-and-downloading-files.html#automaticUploadOnUpdate
	* https://www.jetbrains.com/help/clion/remote-projects-support.html#ipv6
	* https://www.jetbrains.com/help/clion/editing-individual-files-on-remote-hosts.html
	* https://www.jetbrains.com/help/clion/remote-projects-support.html