================
Utilisation
================

On compilera comme suit

.. code:: bash

	javac -cp .:path/to/lib/* File.java

puis (en remplacant System par le nom du dossier contenant les natives de votre système actuel)

.. code:: bash

	java -cp .:path/to/lib/* -Djava.library.path=path/to/natives/SystemExploitation File

Ex : Dans un dossier contenant lib/ et natives/ sous Windows

.. code:: bash

	javac -cp .:lib/* File.java
	java -cp .:lib/* -Djava.library.path=natives/windows File

Vous pouvez trouver un fichier d'exemple ici : `https://www.lwjgl.org/guide <https://www.lwjgl.org/guide>`_.