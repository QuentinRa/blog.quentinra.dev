==============================
Déclaration de fonction
==============================

Une fonction est un ensemble de code qui fait généralement
une "fonction"/service/opération.

Par exemple une fonction pow(valeur, puissance)
calculerais et vous retourne la valeur d'une variable après l'avoir mise à la puissance.

On appelle que les arguments sont les valeurs pouvant être transmis à une
fonction. Par exemple, len(objet)
qui retourne la taille d'un objet prends en argument l'objet dont on veut connaitre la taille.

**Déclaration**

.. code:: py

		def nom_fonction(): # ce fonction ne retourne rien, on parle de procédure
		 # code

		def nom_fonction(argument1, argument2, ...): # ce fonction ne retourne rien, on parle de procédure
		 # code

		def nom_fonction():
		 # code
		 return ... # ce fonction retourne un résultat

**Appel**

.. code:: py

		nom_fonction() # appel d'une fonction
		nom_fonction(1, 2.5) # appel d'une fonction avec paramètres/arguments
		x = nom_fonction() # appel d'une fonction qui retourne un résultat

**Fonctions et Opérations basiques**

:code:`len()`
	renvoi la valeur de la fonction <trouver_laquelle> d'une classe,
	soit le nombre de caractères pour un string, le nombre d'éléments pour un tableau etc...

:code:`del()`
	unset/supprime une variable (par exemple pour retirer un élément d'une liste, etc...)

:code:`dir()`
	retourne toutes les méthodes/propriétés d'une classe.

:code:`type(objet)`
	retourne une valeur du module types (import types) correspond au type de l'objet.

**Autres**

Faire une fonction vide (sans code) : utiliser l'instruction vide :code:`pass`.
