==========
Modules
==========

Un script python est appelé un module.
Un module correspond généralement à 1 idée (1 concept, 1 logique).

**Le module est dans le même dossier**

.. code:: py

		# importation de constants.py avec
		import constants
		import constants as const # renomme, donc on utilisera const.fonction() ...

**Le module est dans un autre dossier**

On va mettre le chemin du du script (=package) dans le import mais en remplacement
les / (slash) par des . (point).

.. code:: py

		# importation de dossier/autredossier/constants.py avec
		import dossier.autredossier.constants

**Utilisation**

.. code:: py

		import constants # a peut être une classe, une fonction, ...
		constants.fonction() # appel d'une fonction dans constants
		constants.CONSTANTE # utilisation d'une constante dans constants
		# ...

**Importation sélective**

Pour optimiser les imports, il est préférable de n'importer que le strict nécessaire.

.. code:: py

		from constants import fonction
		from constants import variable
		from constants import * # tout importer

**Importation depuis une url**

.. code:: py

		import urllib # bibliothèque native
		utllib.ulropen(url) # import de url