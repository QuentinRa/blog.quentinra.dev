============
Packages
============

L'architecture java est sous la forme de packages.

Par exemple la librairie graphique swing est dans le package javax.swing.
Ce package est un dossier qui contient des classes comme Jpanel...

Importer un package
--------------------

Il est recommandé d'importer les classes une par une (plutôt que d'utiliser \*)
car c'est normalement par optimisé de charger x classes pour en utiliser une
(même s'il est probable que ce soit optimisé). Généralement après 5 classes
vous pouvez utiliser \*.

.. code:: java

		// import d'une classe
		import javax.swing.JPanel;
		// import de toutes les classes du package mais pas des packages dans javax.swing
		import javax.swing.*;

		// importer une constante static, non recommandé
		import static package.classe.CONSTANTE;

Créer un package
----------------------

Il est également possible de créer vos package.

.. code:: java

		package nom;

		import ...;

		public class Main {
		  ...
		}

Attention sur le nom du package. Un package est un dossier, et les classes sont par
défaut dans un dossier sans nom. Si vous ajoutez un dossier (appelé :code:`api` par exemple) à la racine, alors

.. code:: java

	package api;

Notez que par convention

	* vous ne devez pas utiliser de majuscules
	* vous ne devez pas utiliser de -,_,\*, ...
	* vous devez tout écrire en minuscules

Si on veut représenter un dossier dans un package, on n'utilise pas un :code:`/` mais un :code:`.`.

.. code:: java

	package folder.subfolder.[...];

.. important::

	Il n'est pas possible d'importer une classe qui est dans le package par défaut donc généralement les
	développeurs font un dossier src/ (racine) qui contient un com.site.projet (url) par exemple
	et toute les classes sont donc dans un package nommé (donc pas celui par défaut ici src/).

package.info
----------------------

Une bonne pratique est un fichier :code:`package.info`
qui décrit votre package.

.. code:: java

	/*
	*
	* de la javadoc pour décrire le package
	*
	*/
	package nom.package;