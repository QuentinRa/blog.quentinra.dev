.. _jetbrains:

==============
Jetbrains
==============

| :math:`\color{grey}{Version \ 0.6.15}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/03/2021}`

Cette page contiendra des tutoriels sur les logiciels
jetbrains donc PHPStorm, IntelliJ Idea, CLion, WebStorm...

.. hint::

	Voici des slides d'introduction à IntelliJ Idea
	:download:`IntelliJ_IDEA_Guide.pdf <../assets/utils/jetbrains/IntelliJ_IDEA_Guide.pdf>`

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

Les logiciels **sont payants** mais vous pouvez les avoir **gratuitement** en étant étudiant
(https://www.jetbrains.com/shop/eform/students).

	* s'inscrire avec votre email étudiant
	* attendre le mail et suivre les instructions
	* télécharger les logiciels et se connecter au lancement

Je parlerais de jetbrains pour parler des logiciels de Jetbrains.

2. Note de pré-introduction
===============================

Alors tout d'abord, comme tout IDE, il existe plein de raccourcis, mais
le point fort de jetbrains c'est l'autocomplétion et les suggestions d'erreurs

jetbrains souligne un mot/méthode/classe/... en

	* jaune : une possible erreur ou documentation manquante (warning)
	* rouge : une erreur (danger)
	* vert : une erreur typographique (typo)
	* gris (pas souligné, mot en gris) : variable/méthode/classe non utilisée

Vous pouvez faire **alt+entrée** dessus pour obtenir des suggestions pour résoudre le problème. Vous
pouvez aussi voir dans la barre de défilement de droite les endroits des mots soulignés
et tout en haut vous avez un check vert si tout ok, sinon vous pouvez cliquer et voir
les erreurs/warnings.

3. Présentation de l'interface
=====================================

Essayez de lire cette partie, même si vous n'allez pas tout retenir
pour avoir une idée de ce qui est proposé. L'interface ressemble environ à ça (ici c'est IntelliJ pour Java)
mais je rappelle que toutes sont similaires.

.. image:: /assets/utils/jetbrains/basic.png

Les explications sont

	(1)

			Vos fichiers, globalement ce menu sert à double-cliquer pour ouvrir un fichier.
			Vous pouvez faire un clic droit sur un fichier

			.. image:: /assets/utils/jetbrains/create.png

			Explications

				* new : créer un nouveau fichier
				* **analyse** > inspect : ouvre un menu avec toutes les erreurs/... d'un fichier et les solutions proposées
				* delete, copy, ...
				* **refactor** : outil pour renommer [#1]_
				* **reformat code** : nettoyer votre code (import inutiles, formalise tout : espaces, position des { ...)
				* **open in** : ouvrir dans un explorateur de fichiers ou dans un terminal
				* compare with : super utile pour comparer deux fichiers avec une interface
				* **git** : si vous avez git, vous permet de réinitialiser un fichier au dernier commit par exemple
				* Mark directory as : exclure un fichier, ...

	(2) compiler mais ne lance pas l'application
	(3) décider quoi compiler (quelle cible/classe/...)
	(4) compiler et lancer
	(5) le nombre de warnings, ... dans le fichiers (cliquer dessus pour voir le détails)
	(6) vous pouvez voir ici vos warnings, ... par ligne
	(7) la liste des **todos** (lorsqu'une personne mets un TODO/fixme dans un fichier, c'est dire qu'il y a un truc à faire)
	(8) problèmes du fichier actuel
	(9) terminal
	(10) les message à la compilation
	(11) la structure du fichier (en Java: les classes, les méthodes, ...)
	(12) **project structure** : gérer par exemple le JDK (java), les librairies...
	(13) non visible sur l'image (car pas de .git) mais sur la ligne du terminal vous avez un menu git

Voilà pour la présentation rapide, quelques détails en plus

	* sous IntelliJ (premium), PHPStorm, ... dans la colonne tout à droite vous pouvez ajouter une base de données
	*

		dans la colonne tout à gauche vous avez projet et git (si vous avez un .git donc pas dans l'exemple)
		pour ouvrir le menu de gestion de git.

	* le file en haut à gauche vous permet d'ouvrir, fermer un projet et d'ouvrir les paramètres

.. [#1] Très puissant, mais aussi risqué. Le refactor est un outil de renommage intelligent,
	par exemple pour une fonction, il va vous proposer de renommer toutes ces utilisations, mais...
	également les commentaires... Regarder les explications en partie 5.

4. Connaitre ses raccourcis (all)
==================================

Vous connaissez :code:`alt-entrée` sur un mot souligné, pour voir des solutions, voici maintenant
les raccourcis basiques, notez la syntax que je vais utiliser

	* :code:`a+b` : appuyez sur les touches a et b (en même temps)
	* :code:`*+b` : appuyez sur clic gauche et b (en même temps)
	* :code:`@+b` : appuyez sur clic droit et b (en même temps)
	* :code:`^+b` : sélectionner un truc et appuyez sur b (en même temps)
	* :code:`CTRL+b` ou :code:`ALT+B` : appuyez sur control/alt et b (en même temps)

**basiques**

	* :code:`CTRL+F` : rechercher un mot dans le fichier actuel
	* :code:`CTRL+A` : tout sélectionner
	* :code:`CTRL+C` : copier
	* :code:`CTRL+V` : coller
	* :code:`CTRL+Z` : revenir en arrière
	* :code:`CTRL+SHIFT+Z` : annuler un retour en arrière
	* :code:`SHIFT+[...]` : shift et une flèche/begin/end vous permet de rapidement sélectionner des trucs
	* :code:`CTRL+D` : si rien sélectionné duplique la ligne sinon duplique la sélection
	* :code:`CTRL+X` : si rien sélectionné supprime la ligne sinon supprime la sélection
	* :code:`CTRL+R` : faire du remplacement facilement
	* :code:`CTRL+G` : se déplacer à une ligne
	* :code:`CTRL+L` : se déplacer à la prochaine occurrence de la dernière recherche (avec CTRL-F ou CTRL-R)

**pratiques**

	* :code:`SHIFT+SHIFT` : source de toute vie, vous permet

		* de recherche un paramètre (donc à utiliser par la suite au lieu de file > settings > [galère])
		* de voir vos fichiers récents
		* de faire une smart search : cherche une classe/méthode/fichier/... depuis son nom

	* :code:`CTRL+E` : dieu, fichiers récents et interface avec les menus (plus beau que shift+shift mais c'est pas pareil)
	* :code:`CTRL+ALT+F` : rechercher un mot dans tous les fichiers/un dossier/...
	* :code:`^+CTRL+SHIFT+U` : passer la sélection minuscule à majuscule et inversement
	* :code:`ALT+7` (7=touche è) : ouvre le menu de structure du fichier vu plus haut (11)
	* :code:`CTRL+SHIFT+E` : montre les 3 deniers endroits ou vous étiez

**Orienté Objet (principalement)**

	* :code:`ALT+INSERT` (au dessus de Suppr) : générer les getters/setters/toString/equals/...
	* :code:`^+CTRL+ALT+T` : vous permet de générer un trycatch, un if, ... autour de la sélection
	* :code:`CTRL+SHIFT+T` : générer un test de la classe actuelle (donc faut être dans une classe)
	* :code:`CTRL+*` : au moment du clic sur une classe/..., vous montre les usages (appels, ...)

**Gimme free tips**

Vous pouvez faire en sorte que la molette puisse vous permettre de zoomer/dé-zoomer le code
dans Settings > Editor > General puis Change font size ... (première ligne).

Vous pouvez afficher une petite :code:`*` après le nom du fichier s'il a été modifié (si vous
utilisez git c'est inutile) avec Settings > Editor > General > Editor tabs puis :code:`Mark Modified (*)`.

Vous pouvez changer la langage de la correction orthographique avec Settings > Editing > Proofreading
puis ajouter/retirer des langages mais par expérience la correction orthographique n'est pas toujours
activée (si vous écrivez un .md vous verrez qu'elle est puissante, plus que dans les autres fichiers
comme ce .rst).

Une dernière, pour supprimer les warnings de variables not utilisées, souvent l'appeler
ignore ou ignored ça résous votre problème (dans un trycatch/...) même s'il y a d'autres
solutions.

5. Menus
=============

Voici les menus incontournables

.. toctree::
   :maxdepth: 1

		Git         <jetbrains/all/git>
		Database    <jetbrains/all/db>
		Todo        <jetbrains/all/todo>
		Terminal    <jetbrains/all/terminal>
		Snippets    <jetbrains/all/snippets>
		Refactor    <jetbrains/all/ref>
		Analyse     <jetbrains/all/analyse>
		UML         <jetbrains/all/uml>

6. Présentation des IDE
=========================

Enfin, vous l'attendiez, voici la présentation de chaque IDE

.. toctree::
   :maxdepth: 1

		IntelliJ IDEA (java)   <jetbrains/idea>
		PHPStorm (php)         <jetbrains/pstorm>
		CLion (C/C++)          <jetbrains/clion>

-----

**Crédits**
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://www.jetbrains.com/help/phpstorm/creating-a-remote-server-configuration.html
	* https://www.jetbrains.com/help/phpstorm/configuring-synchronization-with-a-remote-host.html#server-access-config
	* https://www.jetbrains.com/help/phpstorm/uploading-and-downloading-files.html#automaticUploadOnUpdate
	* https://www.jetbrains.com/help/clion/remote-projects-support.html#ipv6
	* https://www.jetbrains.com/help/clion/editing-individual-files-on-remote-hosts.html
	* https://www.jetbrains.com/help/clion/remote-projects-support.html
	* https://www.jetbrains.com/help/clion/gradle-support.html#gradle-config