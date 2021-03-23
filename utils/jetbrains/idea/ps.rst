==================================
Project Structure (et modules)
==================================

Project structure est une fenêtre ou un menu permettant de gérer votre projet.

.. image:: /assets/utils/jetbrains/conf/s1.png

Vous pouvez y définir votre JDK ou un télécharger un.

.. image:: /assets/utils/jetbrains/conf/s2.png

Vous pouvez définir

	* source : le dossier contenant les fichiers java
	* tests : le dossier contenant les fichiers Junit
	* ... ressources : le dossier contenant les fichiers .png, ... (pas très utile sauf le design)
	* excluded : tout ce vous ne voulez pas compiler, ... et que vous pouvez même cacher !

.. image:: /assets/utils/jetbrains/conf/s3.png

Typiquement, vos classes doivent forcément être dans un dossier source ou Intellij ne les regardera
pas.

Vous pouvez ajouter des librairies

	* java : des .jar
	* maven : des .jar, mais récupérés via l'URL maven

		* trouver les .jar https://mvnrepository.com/
		* format : :code:`org.junit.jupiter:junit-jupiter-api:5.7.1` pour https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-api

.. image:: /assets/utils/jetbrains/conf/s4.png