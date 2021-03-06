.. _doxygen:

================================
Documentation Doxygen
================================

| :math:`\color{grey}{Version \ 0.3.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 07/03/2021}`

Ce cours est basé sur :code:`doxygen 1.9.1`.

Doxygen est un outil vous permettant de documenter votre code. Je vais être honnête et dire que
je pense que c'est un outil merdique car il demande TROP de rédaction, donc au lieu d'écrire
des commentaires pertinents, vous allez faire de la paperasse.

Personnellement, j'adore la JAVADoc en JAVA et vous recommande de l'utiliser au lieu
d'utiliser Doxygen en Java. Pour les autres langages, sûrement doxygen est une bonne
alternative. Le format de doxygen est semblable à la javadoc (ou plutôt inclut la javadoc).

1. Introduction
===================================

Tout d'abord, il faut savoir si vous n'avez jamais fait de javadoc, que vous allez
écrire des commentaires dans votre code (souvent coloriés en vert plutôt que le gris
habituel pour indiquer que c'est de la doc). Cette doc sera compilé avec une commande
et donnera un site web (un dossier avec des .html). En ouvrant index.html vous pourrez
voir votre documentation.

Tout d'abord pour installer Doxygen sous windows

	* Télécharger le .exe : https://sourceforge.net/projects/doxygen/files/latest/download
	* Suivez les instructions d'installation
	* éditer le PATH

		* dans "taper ici pour rechercher"	(bas à gauche) tapez "var"
		* cliquez sur "modifier les variables ... pour votre compte"
		* cliquez sur la ligne Path
		* cliquez sur modifier
		* cliquez sur nouveau
		* écrivez :code:`C:\Program Files\doxygen\bin`
		* sauvegardez (ok) et quittez

	* ensuite tapez dans un terminal (cmd, powershell) : :code:`doxygen -v`
	* normalement ça marche. Vous pouvez utiliser l'interface graphique aussi mais c'est pour les amateurs ça...

2. Logique et forme
========================

Vous allez écrire des commentaires de la forme

.. code:: java

	/**
	* ...
	*/

	/*!
	* ...
	*/

avec ... le contenu de la documentation. Vous allez écrire dans un fichier Doxyfile comment
compiler la doc et enfin avec :code:`doxygen Doxyfile`, vous allez compiler la doc et
générer une page web.

Pour créer un fichier :code:`Doxyfile` vide, taper :code:`doxygen -g`. Ensuite ouvrez le,
vous devez regarder les lignes suivantes. Vous pouvez ne rien mettre (laissez vide)

	* :code:`PROJECT_NAME = "nom du projet"` : nom de votre projet
	* :code:`PROJECT_NUMBER = "version"` (par exemple "version 0.0.5")
	* :code:`PROJECT_BRIEF = "desc"` : description du projet
	* :code:`PROJECT_LOGO = "path"` : chemin d'un logo si vous en avez
	* :code:`OUTPUT_DIRECTORY = "path"` : **<!>** chemin dans lequel il va mettre les fichiers .html générés
	* :code:`OUTPUT_LANGUAGE = "English"` : langage de votre documentation
	* :code:`LAYOUT_FILE = "path"` : si vous voulez changer l'apparence de la documentation
	* :code:`QUIET = YES` : **<!>** mettez YES si vous ne voulez voir que les erreurs
	* WARN_IF_UNDOCUMENTED, WARN_IF_DOC_ERROR, ... : choisir quels warnings/erreurs afficher
	* :code:`INPUT = path` : **<!>** ajouter un path vers le dossier contenant les fichiers documentés
	* :code:`INPUT += path` : **<!>** si vous avez plusieurs paths
	* :code:`RECURSIVE = YES` : **<!>** probablement que vous voulez que INPUT cherche récursivement

-----

**Crédits**
	* Anonymous#4310 (étudiant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.jetbrains.com/help/clion/creating-and-viewing-doxygen-documentation.html#assistance
	* https://www.doxygen.nl/manual/index.html
	* https://www.doxygen.nl/manual/commands.html
	* https://stackoverflow.com/questions/62038742/modify-doxygen-template-in-clion
	* https://www.mitk.org/images/1/1c/BugSquashingSeminars$2013-07-17-DoxyReference.pdf
	* https://franckh.developpez.com/tutoriels/outils/doxygen/

	* themes lookup

		* https://gitlab.ti.bfh.ch/doxygen-theme/doc
		* https://github.com/nnen/doxygen-theme
		* https://github.com/Velron/doxygen-bootstrapped
		* https://github.com/cellcortex/doxygen-bootstrapped
		* https://github.com/Velron/doxygen-bootstrapped
		* https://stackoverflow.com/questions/9629779/change-the-theme-of-doxygen
		* https://blog.magnum.graphics/meta/improved-doxygen-documentation-and-search/