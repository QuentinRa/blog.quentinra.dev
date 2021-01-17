=======================================
Branchements
=======================================

Le plus compliqué donc :code:`warning`.

.. code:: bash

	if [ condition ]; then
	#code
	# elif est facultatif
	elif [ condition ]; then
			#code
	# si tous les elif + le if ont échoué. Facultatif.
	else
		#code
	fi

Vous pouvez aussi mettre [[ condition ]] mais ce n'est pas recommandé vu que la norme
POSIX indique seulement un crochet.

Rappel : en bash 0 = true et 1/autre = false.

En fait :code:`[ condition ]` est équivalent a faire :code:`test condition` (test est une commande)
donc vous ne pouvez pas utiliser de && ou ||.

**Options**

	* :code:`-o condition` : équivalent de ||
	* :code:`-a condition` : équivalent de &&
	* :code:`! condition` : négation d'une condition

**Opérateurs**

Les opérateurs >, <, ... servent à comparer selon l'ordre du dictionnaire. Si vous voulez
comparer si un nombre est plus grand qu'un autre, ou une variable a une valeur plus petite
qu'une autre alors il faut utiliser les opérateurs

	* :code:`a -le b` : true si a :code:`plus petit` que b (lesser equals)
	* :code:`a -lt b` : true si a :code:`plus petit (strict)` que b (lesser than)
	* :code:`a -eq b` : true si a :code:`égal` b (equals)
	* :code:`a -ne b` : true si a :code:`différent` de b (not equals)
	* :code:`a -gt b` : true si a :code:`plus plus (strict)` que b (greater than)
	* :code:`a -ge b` : true si a :code:`plus plus` que b (greater equals)

**Conditions spéciales**

Vous pouvez vouloir tester si un fichier existe, si on peut le lire, si une variable est vide
etc. Cela se fait avec les options suivantes

	* :code:`-f chemin` : true si chemin est un fichier
	* :code:`-d chemin` : true si chemin est un dossier
	* :code:`-a chemin` : true si chemin est un fichier système
	* :code:`-w chemin` : true si on a la permission w
	* :code:`-z $variable` : true si variable est vide

