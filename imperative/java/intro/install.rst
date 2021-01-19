==============
Installation
==============

Java Runtime Edition
	Il s'agit d'un runnable qui permet uniquement de lancer un programme Java.

	Commande : :code:`java`

Java Development Kit
	Il s'agit d'un kit permettant de compiler du Java, mais qui inclus aussi le JRE
	donc vous pouvez lancer vos programme java.

	Commande : :code:`javac`

Plus de détails dans la partie compilation. Ces commandes sont utiles en ligne de commande
mais généralement vous allez utiliser un IDE (au moins après avoir maitrisé les bases).

Integrated Development Environment (IDE)
	Typiquement c'est un logiciel dans lequel vous allez codé. Ce logiciel vous indique sans compiler
	les import à faire, les erreurs, les variables inutiles, ...

	Les meilleurs IDE vous permettent même de gérer une base de données (ex: JAVA et du SQL),
	un gestionnaire de version (ex: Java et Git) ou encore de générer des diagrammes de classes (ex: Java et UML).

	| Mon IDE est :code:`Intellij Idea` (Jetbrains) pour le Java.
	| Vous pouvez aussi utiliser VSCode par exemple.
	|
		Un IDE non recommandé est :code:`eclipse`
		(trop de trucs à l'écran/mauvaise IHM, auto-complétion est peu performante, intégration gradle/maven relou,
		positif: opensource, pas d'analyse de code, chiant à utiliser, positif: plugins, ...)

Installation JDK
-------------------

Vous pouvez simplement télécharger le jdk
sur le site de oracle : https://www.oracle.com/java/technologies/javase-downloads.html.

C'est facile à faire, mais vous utilisez alors un produit d'Oracle...

Alternativement, vous pouvez télécharger open-jdk (https://openjdk.java.net/). Sous windows
par contre c'est compliqué, vous pouvez trouver pas mal de builds ici : https://github.com/ojdkbuild/ojdkbuild.

IntelliJ Idea
-------------------

Une fois installé (rien de compliqué), pour le lancer sous linux il faut trouver un
idea.sh dans un dossier bin mais vraiment rien de compliqué.

Vous ne pouvez coder que du java dedans ce qui est la plus grande restriction
(par d'auto completion pour pas mal d'autres langages nativement).

	* créer un nouveau projet

		* jdk : prendre java 11, 15, 10,	 8, ... (ça dépends de ce que vous avez installé)
		* cliquez sur "create projet from template" et puis donnez un nom + chemin
		* le paquet = dossier dans lequel il va mettre le main donc par exemple
		* chemin : ~/java/tp/
		* package : tp1

	* colonne de gauche : projet contient la liste des fichiers du projet
	* en haut à droite : flèche verte pour compiler+lancer, scarabée : debug.
	* clic droit

		* generate : générer des méthodes etc.
		* analyse : les erreurs etc.

	* alt+entrée : menu ultra utiles

J'ai rapidement mis certains trucs pour commencer, un guide plus complet
sera sûrement fait plus tard.