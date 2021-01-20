=======================================
Manipulation des Jar
=======================================

Vous pouvez voir un jar comme un exécutable .exe par exemple. Il regroupe toutes
les classes d'un projet et les fichiers utilisés. Vous pouvez double-clic pour lancer
votre programme.

Les jar sont souvent utilisés comme des librairies donc vous pouvez inclure
le code d'un projet facilement en utilisant un .jar.

Lancer un jar
==============================

Double clic dessus, en supposant que la bonne version de JAVA (version au moins
supérieure à celle utilisée pour compiler) soit installé.

Sinon :code:`java -jar fichier.jar`.

Créer un jar
=============

Utilisez la commande :code:`jar cvf nom.jar classe classe assets ...`. Je n'utilise pas ça pour le problème
des fichiers plus loin.

Plus d'informations : https://docs.oracle.com/javase/tutorial/deployment/jar/build.html

Accès aux fichiers
--------------------

Une fois dans un jar, l'accès (chemins) des fichiers est différent. Tous
vos chemins commencent par / (qui corresponds à la racine du jar
ou du projet si vous n'avez pas encore fait le jar).

Pour récupérer un fichier, juste mettre / ne suffit pas. Il faut utiliser la réflexion.
Voici les deux méthodes. Notez que vous ne pouvez que lire.

.. code:: java

	// méthode 1, retourne un stream ou null
	InputStream s = this.getClass().getResourceAsStream("/path");

	// méthode 1 bis
	NomClasse.class.getResourceAsStream("/path");

	// méthode 2, retourne une URL puis on obtient un fichier
	URL url = this.getClass().getResource("/path");
	File f = new File(url.toURI());

Je trouve ça assez embêtant donc j'utilise gradle pour gérer les méthodes
qui ne prennent ni une URL ni un InputStream (ex: méthode qui demande
le chemin d'un fichier parce qu'elle l'ouvre elle même et qui est trop complexe
pour que vous la recodiez vous même).

Créer un jar (gradle)
=======================

Voici la règle a ajouter dans :code:`build.gradle`. Le .jar créé est dans build/libs
par défaut dans IntelliJ Idea.

.. code:: none

		jar {
		 manifest {
			attributes 'Main-Class': 'package.Main'
		 }

		 from {
			configurations.runtimeClasspath.collect { it.isDirectory() ? it : zipTree(it) }
		 }
		}

ou encore (IntelliJ)

.. code:: none

		task makeJar(type: Jar) {
		 manifest {
			attributes 'Implementation-Title': 'NomDuProjet',
			 'Implementation-Version': getArchiveVersion(),
			 'Main-Class': 'package.Main'
		 }
		 setArchivesBaseName(project.name)
		 from { configurations.compile.collect { it.isDirectory() ? it : zipTree(it) } }
		 with jar
		}

Pour la gestion des fichiers, vous pouvez utiliser les méthodes plus hautes
mais cette fois la gestion des ressources est bien faite donc même sans
vous pouvez référer à des fichiers dans le .jar. (l'exemple typique c'est les méthodes
de la LIBGDX).