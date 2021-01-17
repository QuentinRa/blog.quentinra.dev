=============
Exceptions
=============

Les exceptions sont le nom donné aux erreurs, par exemple si une variable n'existe pas.
Il existe des exceptions qui arrivent de manière imprévues (un fichier n'est pas accessible, ...)
et pour éviter que le programme s'arrête, il est possible de les capturer.

.. code:: py

		try:
		 # ici le code qui risque de lever une exception
		except Exception: # ici la branche si Exception est levée
		 # code