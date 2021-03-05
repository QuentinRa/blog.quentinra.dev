=========================
Types en JS, Tableaux
=========================

En ce qui concerne les types et valeurs, vous pouvez utiliser

	* :code:`true` : un booléen
	* :code:`5` : un entier
	* :code:`5.0` : un float
	* :code:`'5.0'` : une string
	* :code:`"5.0"` : une string
	* :code:`[]` : un tableau (plus de détails plus loin)
	* :code:`undefined` : un truc qui existe pas
	* :code:`null` : un truc null

String
**************

Vous pouvez utiliser sur une string str

	* :code:`str.length` : avoir sa taille
	* :code:`str.indexOf(str2)` : avoir la première position de str2 dans str
	* :code:`str.lastIndexOf(str2)` : dernier indice
	* :code:`str.toLowerCase()` : tout en minuscules
	* :code:`str.toUpperCase()` : tout en majuscules
	* :code:`str.replace('a','b')` : replace 'a' par 'b'
	* :code:`str.replaceAll('a','b')` : appliqué à toutes les occurrences
	* :code:`str.trim()` : supprimer les espaces avant et après

On remarque plein de fonctions vues en JAVA. Attention une string
n'est pas un tableau malgré le fait que :code:`str[0]` retourne
le premier caractère, vous ne pouvez "pas le modifier" (testez et vous allez trouver
le résultat bizarre mais c'est lié au concept du JS).

Tableaux
*********************

On peut créer un tableau avec

	* :code:`[]` : tableau vide
	* :code:`[5,"toto", "hello"]` : tableau
	* :code:`new Array(5,"toto", "hello")` : pareil que celui plus haut

La logique est la même qu'en C (ou autre...) donc on fait
:code:`tab[0]` pour obtenir le premier élément.

Vous pouvez utiliser sur un tableau tab

	* :code:`tab.length` : avoir sa taille
	* :code:`tab.concat(tab2)` : fusion de deux tableaux
	* :code:`tab.push(e)` : ajoute un élément et retourne la taille
	* :code:`tab.pop()` : retire le dernier élément et le retourne
	* :code:`tab.reverse()` : inverse un tableau