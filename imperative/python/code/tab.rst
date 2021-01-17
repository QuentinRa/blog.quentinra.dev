==============================
Tableaux et listes
==============================

**Déclaration**

.. code:: py

		tab = [] #tableau vide
		tab = [3,5,6] #tableau avec des valeurs

**Fonctions**

.. code:: py

		tab.append(e) #ajoute au tableau un élément e

		tab[0] #retourne la valeur dans la case 0
		# IndexError si l'index n'existe pas

		# parcours
		for i in tab:
			# i contient a chaque tour un élément du tableau

		len(tab) #taille du tableau

		tab.count(object) #retourne le nombre d'instance d'un object dans un tableau
		sorted(tab) # tri un tableau

Numpy array
----------------

Il s'agit de tableaux sur lesquels les opérations sont censées être ultra optimisées et rapides.
On peut par exemple multiplier chacune des cases du tableau en une opération.

.. code:: py

		# création
		tab = [2,5,7] # tableau normal

		import numpy
		n_tab = numpy.array(tab) # conversion

		# exploitation
		n_tab_carre = n_tab^2

Liste
--------------

Vous pouvez simplifier le code pour créer un sous-tableau d'un tableau en créant une liste.
Une liste est également plus manipulable qu'un tableau (suppression, index négatifs, ...).

.. code:: py

	list = [ajoute for i in source if condition ] # pour chaque élément de source,
	# si condition est Vrai alors ajoute est ajouté.

	# exemple
	list = [i for i in in range(0,10) if i%2==0]
