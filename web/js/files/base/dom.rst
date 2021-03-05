===========================
Manipulation de document
===========================

On utilise la variable :code:`document`.

Sélection d'éléments
**********************

Par amateurisme ou parce que c'est plus répandu, on utilise

.. code:: js

		//récupère l'élément ayant cet ID
		let div = document.getElementById('id');
		//récupère tous les éléments ayant cette classe
		let divs = document.getElementsByClassName('classe');
		// toutes les balises a
		let tab_links = document.getElementsByTagName('a');

On utilise généralement des query selector, soit la même syntaxe que dans
vos fichiers .html !

.. code:: js

	// getElementsByClassName('classe')
	document.querySelector(".classe")
	// document.getElementById('id');
	document.querySelector("#id")
	// toutes les balises a
	document.querySelector("a")

	// pour obtenir un tableau
	document.querySelectorAll("#id")

Regardez le cours de CSS pour voir toutes les sélecteurs possibles.

Manipuler un élément
*************************

Une fois que vous avez récupéré un élément avec le DOM, vous voudrez probablement lire
ses propriétés ou le modifier. En fait c'est assez simple, on va considérer
:code:`let e = document.querySelector('....')`

	* :code:`e.src` : si une image par exemple, on se rappelle src = source
	* :code:`e.href` : si un lien par exemple, on se rappelle href = destination
	* :code:`e.style` : le style d'une balise
	* :code:`e.className` : la valeur de class, a ne pas utiliser si plusieurs classes
	* :code:`e.un_truc` : ...

Vous avez un accès en lecture/écriture donc pouvez à tout moment changer la source
d'une image par exemple en assignat e.src.

Si vous voulez savoir si e, votre élément contient une propriété (href, src, ...)
avec :code:`e.hasOwnProperty('un_truc')` (vous pouvez tester des indexes de tableaux, ...).

Si vous avez plusieurs classes alors className est un peu embêtant car c'est une string
donc utilisez :code:`e.classList` par exemple :code:`e.classList.add('test')`
ou :code:`e.classList.remove('test')`.

En ce qui concerne le style, voici quelques exemples

.. code:: js

	div.style.width = "5px";
	div.style.display = "none";

D'autres propriétés ultra importes sont