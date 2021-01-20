==================
Gradle et Maven
==================

Maven
=========

Je n'ai jamais utilisé Maven, sauf pour 2 choses

	* obtenir un pom.xml, utilisé pour voir les dépenses de son projet (utilisé par github)
	* obtenir un .jar localement que je n'arrivais pas à obtenir avec gradle

Pour le pom.xml

.. code:: maven

		publishing {
		 publications {
			//noinspection GroovyAssignabilityCheck
			maven(MavenPublication) {
			 groupId = 'com.default.package' as Publication
			 artifactId = 'name' as Publication
			 version = '1.0.0-maven-SNAPSHOT' as Publication
			 //noinspection GroovyAssignabilityCheck
			 from components.java
			}
		 }
		}

Et le site https://search.maven.org/ pour trouver un .jar ou
comment l'importer (gradle/maven).

Gradle
=========

Gradle sert à compiler votre projet, générer un .jar, gérer vos dépendances, etc.

Vous avez deux fichiers à créer à la racine

	* :code:`build.gradle` : déclaration des règles
	* :code:`settings.gradle` : propriétés du projet

settings
--------------

Généralement :code:`settings.gradle` contient uniquement le nom du projet,
mais vous pouvez y inclure des sous-projets (si vous en avez)

.. code:: none

	rootProject.name = 'nom projet'
	include 'nom' // ce nom représente un projet à la racine (ex: un dossier api)

build
------------

Pour :code:`build.gradle`, c'est plus compliqué. Il faut importer des plugins,
définir les dépendances et les options de compilation.