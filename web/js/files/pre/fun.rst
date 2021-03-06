====================
Fonctions en JS
====================

Fonctions
====================

Une fonction est un bloc de code, les variables n'existent que dans ce
bloc sauf si vous utilisez var.

.. code:: js

	function pow(x) {
		return x*x;
	}

	pow(2)

Vous pouvez aussi utiliser des arguments par défaut

.. code:: js

	function pow(x, k = 1) {
		return x ** k;
	}

	pow(5, 1) // 5^1 = 5
	pow(5) // pow(5, 1) = 5
	pow(5, 2) // 5^2 = 25

pour faire une fonction anonyme (utilisé dans les promesse nottament dans
les requêtes AJAX), on fait

.. code:: js

	// marche pas toujours, uniquement pour les closures
	function (){
		// code
	}

	// ou sinon
	() => {
		// code
	}

Attention cependant, la deuxième syntaxe est floue sur le portée des variables
donc elles sont généralement considérées comme étant globales.

Closures
====================

.. code:: js

		// exemple de fonction
		function compteur(){
		 // attributs privés
		 let count = 0;
		 // avec une closure
		 return function () {
		  return count++;
		 };
		}

Cette notion est ultra importe car vous allez déclarer des attributs
(et des fonctions qui sont des attributs privés) puis
dans le return vous allez retourner l'Interface de la classe.

.. code:: js

	let api = function() {
	 function _fetch(begin, end, section){
	  // ... code ...
	 }

	 // un objet qui corresponds à la partie publique
	 return {
	  getAllNews:_fetch(0,10,"news"),
	  getAllGames:_fetch(0,10,"games"),
	 }

	}

