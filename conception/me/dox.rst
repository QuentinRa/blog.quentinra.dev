.. _doxygen:

================================
Documentation Doxygen
================================

| :math:`\color{grey}{Version \ 0.5.5}`
| :math:`\color{grey}{Dernière \ édition \ le \ 08/03/2021}`

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

	* base

		* :code:`PROJECT_NAME = "nom du projet"` : nom de votre projet
		* :code:`PROJECT_NUMBER = "version"` (par exemple "version 0.0.5")
		* :code:`PROJECT_BRIEF = "desc"` : description du projet
		* :code:`PROJECT_LOGO = "path"` : chemin d'un logo si vous en avez
		* :code:`OUTPUT_DIRECTORY = "path"` : ✅ chemin dans lequel il va mettre les fichiers .html générés
		* :code:`OUTPUT_LANGUAGE = "English"` : langage de votre documentation
		* :code:`QUIET = YES` : ✅ mettez YES si vous ne voulez voir que les erreurs
		* WARN_IF_UNDOCUMENTED, WARN_IF_DOC_ERROR, ... : choisir quels warnings/erreurs afficher
		* :code:`INPUT = path` : ✅ ajouter un path vers le dossier contenant les fichiers documentés
		* :code:`INPUT += path` : ✅ si vous avez plusieurs paths
		* :code:`RECURSIVE = YES` : ✅ probablement que vous voulez que INPUT cherche récursivement
		* :code:`EXCLUDE = path` : comme input mais pour les fichiers/dossiers/chemins à ne pas compiler
		* :code:`IMAGE_PATH = path` : dossier des images (si vous utilisez \image dans le code)

	* html

		* :code:`LAYOUT_FILE = "path"` : si vous voulez changer l'apparence de la documentation
		* :code:`HTML_HEADER = header.html` : si vous avez un fichier d'en tête
		* :code:`HTML_FOOTER = footer.html` : si vous avez un fichier de bas de page
		* :code:`HTML_EXTRA_STYLESHEET = style.css` : si vous avez un fichier de style
		* :code:`HTML_EXTRA_FILES = file.js` : si vous avez un fichier js, d'autres fichiers, ...

3. Rédiger sa documentation
==============================

Attention, doxygen est fatigant car il demande pour chaque fichier
que vous ayant un commentaire avec :code:`\file`, ou encore avant
chaque typedef que vous ayez un :code:`\typedef` ou avant un
struct d'avoir un :code:`\struct` ou encore devant une fonction d'avoir
:code:`\fn`.

Vous l'aurez compris, vous allez devoir faire l'idiot et mettre un tag
pour dire à doxygen que vous commentez un fichier/... avant votre
documentation sinon tout le fichier ne sera pas documenté (si pas de \file), ou alors
une structure ne sera pas documenté etc.

Ah et vous pensiez que c'était tout ? Eh bien non, doxygen vous demande aussi de documenter
chaque include, variable, ... avec un commentaire de la forme :code:`//!< ...` sur chaque
ligne, ce qui est parfois relou.

Vous pouvez mettre :code:`\param` ou :code:`@param` c'est pareil !

Vous pouvez écrire en latex dans votre documentation, attention à activer
Mathjax dans le Doxyfile si ce n'est pas déjà fait (:code:`USE_MATHJAX = TRUE`).

4. Documentation en C
========================

Cette partie récapitule la documentation en C, mais la logique est pareille ailleurs,
sauf que vous n'aurez peut être pas de typedef et de struct.

.. code:: c

		/*!
		* \file file.h
		* \author Calistro
		* \version 0.1
		* \date 27/02/2021
		* \see Nom1
		* \see Nom2
		*
		* A freaking .h x)
		*
		*/

C'est assez transparent, en début de chaque fichier vous allez avoir un commentaire du genre,
avec le nom du fichier, l'auteur, la version, la date. Vous pouvez également avec
see indiquer qu'il sera intéressant d'aller voir un fichier/type/...

Pour commenter une structure

.. code:: c

		/*!
		* \typedef ma_struct
		* \struct ma_struct_s file.h "headers/file.h"
		* \param id: ...
		* \param key: ...
		*
		* Description of this struct
		*
		*/
		typedef struct ma_struct_s {
		 int id; //!< brief description of this attribute
		 char* key; //!< brief description of this attribute
		} ma_struct; //!< brief description of this struct

:code:`Attention` : mettre \typedef après \struct peut résulter en une erreur
:code:`Compound ... is not documented`, de longues heures de debug juste pour ça...

.. code:: c

	#include "other.h" //!< ... description

.. code:: c

		/*!
		* \fn int pow(const int x, const int k);
		* \brief short description
		*
		* This is
		* a long description
		*
		* \param[in] x ...
		* \param[in] k ...
		* \return ...
		* \see ...
		*/
		int pow(const int x, const int k);

La première ligne est inutile, je la mets pas parce que c'est con, mais il faut la mettre.
On met ensuite une description courte, une plus longue. On décrit les paramètres avec param
et le retour avec return. S'il faut aller voir d'autres fonctions/... on le fait encore avec see.

	* :code:`\param nom` : version simple qui corresponds à in
	* :code:`\param[in] nom` : in veut dire que vous allez seulement lire la variable (souvent const)
	* :code:`\param[out] nom` : out veut dire que vous allez seulement écrire dans la variable
	* :code:`\param[in,out] nom` : vous faites in et/ou out

Vous pouvez ajouter

	* :code:`\deprecated desc` si une fonction/truc ne doit plus être utilisé
	* :code:`\bug desc` si vous avez détecté un bug
	* :code:`\def name desc` documentation d'un define
	* :code:`\note desc` pour ajouter une note
	* :code:`int var; ///< description ...` documentation d'une variable

En matière de tests

	* :code:`\test description` : décrire un test pouvant être fait
	* :code:`\pre description` : décrire les préconditions (conditions a respecter avant appel)
	* :code:`\post description` : décrire les postconditions (conditions qui seront respectés après appel)
	* :code:`\invariant description` : décrire les invariants

5. Documentation en JAVA
==========================

Je vous invite à regarder la partie JAVADOC du cours de JAVA, globalement
c'est pareil que plus haut avec quelques trucs en plus

	* il y a des paquets donc on ajoutera :code:`\package name`
	* il y a des exceptions donc on ajoutera :code:`\exception name desc` ou :code:`\throw`
	* il y a des interfaces donc on ajoutera :code:`\interface name desc`
	* ...

6. Documentation Calistro
============================

Ancien commentateur amateur et motivé, j'ai rapidement arrêté de documenter tout mon code
(tous les getters, setters, ...). J'essaye donc d'arrêter d'être idiot et noyer mon code
sous de la documentation souvent inutile en ne documentant que ce qui pourrait être utile

	* documenter les imports
	* documenter les variables (et leur donner des noms pertinents)
	*
		faire des sections, par exemple un grand commentaire pour dire que tous les getters/setters
		sont ici (je trouve ça plus beau pour uniformiser les fichiers et aider à
		facilement trouver par exemple les fonctions implémentées dans une section implements)
	*
		éviter de mettre :code:`@return int, un entier` parce que c'est déjà écrit dans la signature
		donc si ya rien à dire, je mets rien
	*
		éviter les commentaires copiés collés, @see peut parfois aider, sinon j'ai sûrement mal
		codé quelque chose
	*
		une bonne description en haut de la classe c'est important pour indiquer au lecteur
		si oui ou non il veut lire cette classe
	*
		ne pas mettre :code:`\date` et :code:`\version` ou ne pas leur donner des valeurs compliquées
		parce que c'est chiant de changer tout le temps/de leur donner une valeur pertinente
	* donner des descriptions pertinents des attributs

		* donner un interval par exemple
		* donner des valeurs particulières s'il y en a
		* indiquer les possibles modifications faites dessus
		* indiquer des méthodes pouvant être appelées dans la continuité
		* indiquer le résultat retourné en cas d'erreur

	* essayer de mettre un maximum de commentaires non javadoc donc des :code:`//` par exemple, 1 par ligne c'est pas mal (ça fait beau)
	* montrer des exemples de code (utilisant notre fonction), parfois ça aide beaucoup si elle est complexe !!!
	* faire des Readme.md (ou autre) dans chaque dossier, pour faire un sommaire de ce qu'on peut trouver dedans
	* ...

Dans CLion, vous pouvez visualiser/pré-visualiser la documentation avec CTRL-Q.

7. Doxygen (enhanced)
==========================

Honnêtement, je trouvais que j'écrivais trop de documentation, et en plus l'interface
était moche, donc j'ai cherché à faire un truc beau, et au final j'arrive
à avoir une donc sans warnings mais qui est belle et avec moins de documentation
dans le code. Un exemple sont les \param devant un struct qui en fait sont facultatifs
mais cela rendait la doc plus claire de les mettre dans la version normale.

Il faudra installer doxygen, et télécharger

	* sur `https://github.com/mosra/m.css <https://github.com/mosra/m.css>`_
	* le dossier documentation/templates
	* le fichier documentation/__init__.py
	* le fichier documentation/_search.py
	* le fichier documentation/doxygen.py
	* le fichier documentation/favicon-dark.png
	* le fichier documentation/favicon-light.png
	* le fichier documentation/python.py
	* le fichier documentation/search.js
	* le contenu du dossier plugins (les 4 scripts .py) à mettre dans le dossier style (voir ci-après)
	* le dossier css
	* et personnellement j'ai tout mis dans le dossier style à la racine du projet
	* donc j'ai par exemple /style/css ou /style/dot2svg.py
	*

		si vous avez mis css dans style, alors il faut éditer dans doxygen.py deux lignes
		et remplacer :code:`../css/......` par :code:`css/........`.


Ensuite, voici les étapes

	* si pip n'est pas installé, sous linux :code:`sudo apt-get install python3-pip`
	* :code:`pip3 install jinja2 Pygments`
	*
		créer un DoxyFile par exemple DoxyCSS à la racine

		.. code::

				# used to become a god
				# style\doxygen.py DoxyCSS
				# inclut le Doxyfile original
				@INCLUDE                = Doxyfile
				# faits des modifications (faut pas modifier ces lignes normalement)
				GENERATE_HTML           = NO
				GENERATE_LATEX          = NO
				GENERATE_XML            = YES
				XML_PROGRAMLISTING     = NO
				XML_NS_MEMB_FILE_SCOPE = YES

	* si vous êtes sous linux : :code:`chmod +x style/doxygen.py`
	* ensuite vous faites :code:`style\doxygen.py DoxyCSS` (ou / sous linux)
	* la doc html/latex/... est au même endroit que d'habitude

Les points que j'ai notés

	* vous devez ajoute :code:`\dir` pour que vos fichiers soit ajoutés dans Files
	*

		vous pouvez créer des fichiers :code:`package.dox` (peu importe le nom mais package c'est bien)
		pour décrire un dossier (faites le d'abord dans un fichier puis avant de râler parce
		que ça copie la desc de chaque fichier dans la description du dossier, testez ça).
		Notez qu'en C++ ou en PHP, il suffit de remplacer dir par namespace

		.. code::

				/** @dir headers

				\authors ...
				\date 08/03/2021

				Une description du dossier
				*/

Vous pouvez modifier la barre de recherche avec un conf.py ou alors
avec les options doxyfile (notez que une_page.html est dans le nom
du .html généré à la toute fin dans votre dossier html/)

.. code::

		M_LINKS_NAVBAR1 = \
				"<a href=\"une_page.html\">User documentation</a>" \
				"annotated"
		M_LINKS_NAVBAR2 = \
				"files" \
				"<a href=\"une_page.html\">Fonctions</a>" \
				"<a href=\"un_lien">GitHub</a>"

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
	* https://stackoverflow.com/questions/9502426/how-to-make-an-introduction-page-with-doxygen

	* themes lookup

		* https://gitlab.ti.bfh.ch/doxygen-theme/doc
		* https://github.com/nnen/doxygen-theme
		* https://github.com/Velron/doxygen-bootstrapped
		* https://github.com/cellcortex/doxygen-bootstrapped
		* https://github.com/Velron/doxygen-bootstrapped
		* https://stackoverflow.com/questions/9629779/change-the-theme-of-doxygen
		* https://blog.magnum.graphics/meta/improved-doxygen-documentation-and-search/
		* https://mcss.mosra.cz/documentation/doxygen/#basic-usage
		* https://github.com/mosra/m.css