================================
Compilation
================================

Java crée et exécute les fichiers au langage machine sur
une machine virtuelle, qui a donc les mêmes spécifications peu importe la machine
sur laquelle le code est exécuté.

La compilation se fait avec :code:`javac` (inclus dans le jdk, donne des .class)
et l'exécution se fait avec :code:`java` (inclus dans le jdk/jre).

.. code:: bash

		# compiler
		javac Main.java ....

		# exécuter (on ne met pas les .class)
		java Main [arguments]

:code:`warning` : Notez que le fichier exécuté doit contenir une méthode main.

.. code:: java

		//Main.java
		public class Main {
		 public static void main(String[] args){
			System.out.println("Hello World");
		 }
		}

:code:`warning` : La classe Main déclarée publique doit être dans un .java du même nom.