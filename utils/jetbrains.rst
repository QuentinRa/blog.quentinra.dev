==============
Jetbrains
==============

| :math:`\color{grey}{Version \ 0.1.4}`
| :math:`\color{grey}{Dernière \ édition \ le \ 16/02/2021}`

Cette page contiendra des tutoriels sur les logiciels
jetbrains donc PHPStorm, IntelliJ Idea, CLion, WebStorm...

1. Général
============

Jetbrains propose des logiciels appelés IDE car ils vous aident à coder en vous donnant des suggestions
par exemple ou avec plein de fonctionnalités (intégration de base de données, correction orthographique,
intégration git, générer des diagrammes UML...).

Contrairement à un IDE comme VSCode qui est polyvalent (Jack of all trades, master of none)
vous devez utiliser un IDE spécialité dans chaque langage. Toutes les interfaces
se ressemblent mais c'est généralement lourd (par exemple 10Go pour 3 IDE).

	* IntelliJ IDEA, dit idea : :code:`java, ocaml, R` (et gradle/maven)
	* PHPStorm, Webstorm : :code:`php, html, js, bootstrap, css` et les framework js
	* CLion : :code:`C, C++`
	* PyCharm, Datalore : :code:`python` et analyse de données
	* YouTrack : utile pour la gestion de projet
	* CodeWithMe : plugin pour faire du pair-programming

Vous pouvez installer la Jetbrains toolbox pour gérer tout ça facilement : https://www.jetbrains.com/toolbox-app/.

Les logiciels sont payants mais vous pouvez les avoir gratuitement en étant étudiant
(https://www.jetbrains.com/shop/eform/students).

Je parlerais de jetbrains pour parler des logiciels de Jetbrains.

2. Raccourcis
======================

Voici quelques raccourcis

	* :code:`shift+shift` : ouvre une fenêtre permettant de rechercher options, classes, fichiers récents, ...
	* :code:`CTRL+F` : rechercher un mot/...
	* :code:`CTRL+SHIFT+F` : rechercher un mot/... dans tout le projet
	* :code:`Clic droit` (dans un fichier)

		* :code:`open in` : ouvrir dans un explorateur de fichiers
		* :code:`generate` : générer les getters/toString/... en java
		* :code:`git` : voir les anciennes versions, ...
		* :code:`refactor` : renommer fichier, ...

	* :code:`CTRL-D` : si rien sélectionné duplique la ligne sinon duplique la sélection

Vous avez aussi les raccourcis basiques (autre que CTRL-F) comme CTRL-A (tout sélectionner), CTRL-C (copier),
CTRL-V (coller), SHIFT-BEGIN (sélection de position jusqu'au début de la ligne), SHIFT-END (sélection de position
jusqu'à la fin de la ligne) ou encore les SHIFT-FLECHE.

Petite précision, jetbrains souligne un mot/... en

	* jaune : une possible erreur ou documentation manquante
	* rouge : une erreur
	* vert : une erreur typographique
	* gris (pas souligné mais il change le mot en gris) : variable/méthode/classe non utilisée

Vous pouvez faire alt+entrée dessus pour obtenir des suggestions pour résoudre le problème.

3. Général
======================

On rappelle que si vous ne trouvez pas un menu, essayer de faire shift+shift puis
:code:`Change font size` ou :code:`Mark Modified` par exemple.

Vous pouvez faire en sorte que la molette puisse vous permettre de zoomer/dé-zoomer le code
dans Settings > Editor > General puis Change font size ... (première ligne).

Vous pouvez afficher une petite :code:`*` après le nom du fichier s'il a été modifié (si vous
utilisez git c'est inutile) avec Settings > Editor > General > Editor tabs puis :code:`Mark Modified (*)`.

Vous pouvez changer la langage de la correction orthographique avec Settings > Editing > Proofreading
puis ajouter/retirer des langages mais par expérience la correction orthographique n'est pas toujours
activée (si vous écrivez un .md vous verrez qu'elle est puissante enfin plus que dans les autres fichiers).

.. toctree::
   :maxdepth: 1

		Git      <jetbrains/git>
		Database <jetbrains/db>
		Todo     <jetbrains/todo>
		Terminal <jetbrains/terminal>
		Snippets <jetbrains/snippets>

4. PHPStorm
============================

Vous pouvez sélectionner la version php en bas à droite.

Parfois phpstorm ne détecte pas que vous utilisez une méthode, ... si vous
n'avez pas explicitement écrit dans l'appel dans le code. Vous pouvez faire
de la phpdoc avec :code:`/** @see class::method() **/` par exemple pour lui faire
comprendre que la méthode est utilisée (et/ou la classe).

.. toctree::
   :maxdepth: 1

		Configuration Remote      <jetbrains/remote>

-----

**Crédits**
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* PHPSTORM
	* https://www.jetbrains.com/help/phpstorm/creating-a-remote-server-configuration.html
	* https://www.jetbrains.com/help/phpstorm/configuring-synchronization-with-a-remote-host.html#server-access-config
	* https://www.jetbrains.com/help/phpstorm/uploading-and-downloading-files.html#automaticUploadOnUpdate