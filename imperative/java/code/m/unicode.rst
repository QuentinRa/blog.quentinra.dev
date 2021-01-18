==========================
Caractères unicode
==========================

Certains caractères (à, é, ...) ne sont pas correctement affichés en java, sauf si le programme a été
compilé avec l'option encoding=langue. Le cas échéant, vous devez donc écrire ces caractères spéciaux
en unicode. ( https://unicode-table.com/en/ ).

.. code:: java

		// la valeur unicode de é est E9
		// écriture en java
		System.out.println("\u00E9"); // affiche é