======================
Create from scratch
======================

Créer un projet depuis rien et qui n'utilisera rien, ça arrive souvent.

Je vais donc supposer ici que vous

	* n'allez pas utiliser maven
	* n'allez pas utiliser gradle

Par exemple, vous importer un projet d'éclipse dans un IDE, IntelliJ idea
vous permet de faire ça facile, suffit de l'importer. Mais si votre projet
utilise des trucs bizarre (comme des librairies spéciales genre JUnit3 et 4
en plus de JUnit5...) alors faut faire un petit peu de travail.

Regardez la partie sur project structure

	* comment créer/gérer ses modules
	* comment ajouter une librairie

		* ajouter un .jar (pas recommandé)
		* ajouter un librairie (maven implicit)

	* définir le JDK