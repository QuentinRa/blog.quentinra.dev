=========
Memento
=========

Aussi appelé Token.

Le memento est un patron qui avait l'air cool car il permet de sauvegarder l'état
d'un objet, en vue de le restaurer plus tard.

En pratique, sauvegarder un objet c'est probablement excessif, dans le cas
d'un undo/redo, on va généralement sauvegarder les actions effectuées et on va
appliquer l'action inverse lorsqu'il demande de revenir en arrière.

More

	* :code:`➡️` : par exemple pour un undo/redo
	* :code:`✅` : pratique
	* :code:`🚫` : lourd/coûteux

Le code sera peut-être fait plus tard, voici la théorie si vous voulez le faire

	* on considère des états (ex: 1,2,3, ....)
	* on créé une classe Memento qui contient les données à sauvegarder et le nom de l'état
	* on créé une classe Caretaker qui contient tous les états

		* on ajoute des états avec add(Memento)
		* on récupère un état avec get(int)

	* on considère notre objet qui possède une méthode getMemento():Memento par exemple et setState(Memento)