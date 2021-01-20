==================
Gradle et Maven
==================

Maven
=========

Je n'ai jamais utilisé Maven, sauf pour 2 choses

	* obtenir un pom.xml, utilisé pour voir les dépenses de son projet (utilisé par github)
	* obtenir un .jar localement que je n'arrivais pas à obtenir avec gradle

Pour le pom.xml

.. code:: none

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

.. code:: none

		plugins {
		 id 'idea' // IntelliJ Idea, si besoin
		 id 'java' // Java
		 id 'maven-publish' // Maven, si besoin
		}

Déclaration de propriétés

.. code:: none

		version '1.1.0' // version par exemple, facultatif

		repositories {
		 mavenCentral() // organisation des fichiers, voir après
		 jcenter()
		 //noinspection GroovyAssignabilityCheck
		 // ultra utile, si vous avez des .jar locaux
		 // flatDir { dirs 'libs' }
		}

Compilation

.. code:: none

		//noinspection GroovyAssignabilityCheck
		tasks.withType(JavaCompile) {
		 // quelques options (facultatif)
		 options.compilerArgs << "-Xlint:unchecked" << "-Xlint:deprecation"
		 // pour les caractères accentués etc. faut cette option
		 options.encoding = 'UTF-8'
		 // version du compilateur (version JAVA/JDK)
		 sourceCompatibility = 11
		 targetCompatibility = 11
		}

Déclaration des dépendances (voir le lien maven https://search.maven.org/,
la ligne a ajouter et dans la partie "gradle" de la page associée à la librairie
que vous voulez importer).

.. code:: none

		dependencies {
		 // demande la compilation d'un sous projet
		 // implementation project(':nexus')
		 // demande la compilation d'un .jar local (dans le dossier libs par exemple comme vu plus haut)
		 // implementation name: 'lgs-2.1.1'
		 // Déclaration des librairies uniquement pour les tets
		 testImplementation group: 'org.junit.jupiter', name: 'junit-jupiter-api', version: '5.7.0'
		 // librairies pour les test et la version officielle
		 // ces librairies sont des exemples...
		 implementation group: 'org.jasypt', name: 'jasypt', version: '1.9.3'
		 implementation group: 'net.lingala.zip4j', name: 'zip4j', version: '2.6.1'
		 implementation group: 'org.xerial', name: 'sqlite-jdbc', version: '3.32.3'
		 implementation group: 'org.json', name: 'json', version: '20200518'
		}

Organisation des fichiers
-------------------------

L'organisation des fichiers peut être perturbante. Votre projet
va ressembler à ça

.. code:: none

	/ (racine)
	----- .gradle/ (on s'en fiche)
	----- gradle/ (contient la version gradle)
	----- src/ (dossier source généralement)
	---------- main/ (dossier avec votre projet)
	--------------- java/ (package default du projet)
	--------------- ressources/ (dossier des ressources, corresponds au /)
	---------- test/ (dossier avec vos tests)
	--------------- java/ (package default des tests)
	--------------- ressources/ (dossier des ressources tests, corresponds au /)