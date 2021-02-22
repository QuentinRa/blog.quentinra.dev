=====================
Introduction
=====================

Junit4 est composé d'un seul jar (et parfois hamcrest) donc facile à installer ce qui n'est pas le cas
forcément le cas pour JUnit5 divisé en modules : api (base), engine, params (tests
paramétriques), launcher et runner (lancer les tests), ...

Installation (gradle)
--------------------------

Pour "installer" JUnit, vous pouvez le faire facilement avec gradle (ou maven)

.. code:: none

	dependencies {
	  // compilation
	  testImplementation 'org.junit.jupiter:junit-jupiter-api:5.6.0'
	  // runtime
	  testImplementation group: 'org.junit.jupiter', name: 'junit-jupiter-api', version: '5.7.0'
	  testImplementation group: 'org.junit.jupiter', name: 'junit-jupiter-engine', version: '5.6.0'
	  testImplementation group: 'org.junit.jupiter', name: 'junit-jupiter-params', version: '5.6.0'
	  testImplementation group: 'org.junit.platform', name: 'junit-platform-launcher', version: '1.7.0'
	  testImplementation group: 'org.junit.platform', name: 'junit-platform-runner', version: '1.7.0'
	}

	test {
	 useJUnitPlatform()
	}

ou pour installer JUnit4

.. code:: none

	dependencies {
	  testImplementation group: 'junit', name: 'junit', version: '4.13'
	}

Installation (jar)
-----------------------

Si vous comptez utiliser JUnit sans IDE (aye) alors vous aurez
probablement des difficultés à compiler/exécuter vos tests.

Il faut inclure le ou les .jar de tests dans le classpath (cp)
à la compilation pour certains et généralement tous à l'exécution (runtime).
Regarder le dependencies de l'installation gradle pour vous faire une idée.

On considère que vous avez un dossier libs contenant tous vos .jar (téléchargés
sur mvnrepository par exemple).

Vous pouvez trouver de l'aide plus complète
pour junit4 ici : https://www.tutorialspoint.com/junit/junit_environment_setup.htm.

.. code:: bash

	# junit4
	$ javac -cp ".:libs/*" TestSuite.java
	$ java -cp ".:libs/*" org.junit.runner.JUnitCore TestSuite

	###############
	#### junit5
	###############
	$ mkdir out
	# attention, on mets ; sous windows et : sous linux
	$ javac -d out -cp ".:libs/*" TestSuite.java
	# exécution
	$ java -jar junit-platform-console-standalone-1.7.0.jar -cp "out" --scan-classpath

Pour JUnit5, voici mon TestSuite.java

.. code:: java

		import org.junit.jupiter.api.Test;

		import static org.junit.jupiter.api.Assertions.assertTrue;

		public class TestSuite {
		 @Test
		 public void testUn(){
		  System.out.println("Un");
		  assertTrue(true);
		 }
		}