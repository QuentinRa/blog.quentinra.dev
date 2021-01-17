=================================
Dictionnaires
=================================

Un dictionnaire est un tableau, dans lequel les indices ne sont pas 0, 1, ...
mais sont des strings appelés clefs (keys donc K) et chaque clef est associée
à une valeur (value donc V).

.. code:: py

		dico = {} # vide
		dico = {Clef1:valeur1, Clef2:valeur2 [, ...] }

		dico['clef3'] = 5 # ajout d'une valeur
		dico.pop('clef3') # suppression d'une valeur

		for K, V in dico.items() :
		 # K contient la clef et V la valeur