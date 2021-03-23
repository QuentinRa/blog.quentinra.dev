.. _jetbrains:

==============
Jetbrains
==============

| :math:`\color{grey}{Version \ 0.3.8}`
| :math:`\color{grey}{Dernière \ édition \ le \ 07/03/2021}`

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

Les logiciels **sont payants** mais vous pouvez les avoir **gratuitement** en étant étudiant
(https://www.jetbrains.com/shop/eform/students).

	* s'inscrire avec votre email étudiant
	* attendre le mail et suivre les instructions
	* télécharger les logiciels et se connecter au lancement

Je parlerais de jetbrains pour parler des logiciels de Jetbrains.

2. Raccourcis
======================

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

L'interface ressemble environ à ça (ici c'est IntelliJ pour Java)

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
				* **refractor** :
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
	* https://www.jetbrains.com/help/clion/gradle-support.html#gradle-config