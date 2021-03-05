=========================
Types en JS, Tableaux
=========================

En ce qui concerne les types et valeurs, vous pouvez utiliser

	* :code:`true` : un booléen (type Boolean)
	* :code:`5` : un entier (type Number)
	* :code:`5.0` : un float (type Number)
	* :code:`'5.0'` : une string (type String)
	* :code:`"5.0"` : une string (type String)
	* :code:`[]` : un tableau (plus de détails plus loin, type Array)
	* :code:`undefined` : un truc qui existe pas
	* :code:`null` : un truc null
	* :code:`NaN` : not a number

Vous pouvez obtenir le type d'une variable avec :code:`typeof variable`. Il
existe comme en JAVA des fonctions toString, valueOf ou parseInt/parseFloat pour convertir
des valeurs. Vous pouvez vérifier le type d'une variable avec :code:`var instanceof type`.

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

Donc vous retrouverez des fonctions comme substring, slice, substr, concat

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
	* :code:`tab.forEach(f)` : applique une fonction sur chaque élément
	* :code:`Array.isArray(tab)` : true si c'est un tableau
	* :code:`tab.sort()` : trier un tableau
	* :code:`tab.sort(f)` : trier un tableau selon une fonction de tri f(a,b) qui retourne {-1,0,1}