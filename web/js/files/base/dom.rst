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

On utilise généralement des query selector, soit la même syntaxe que dans
vos fichiers .html !

.. code:: js

	// getElementsByClassName('classe')
	document.querySelector(".classe")

	// document.getElementById('id');
	document.querySelector("#id")

Regardez le cours de CSS pour voir toutes les sélecteurs possibles.