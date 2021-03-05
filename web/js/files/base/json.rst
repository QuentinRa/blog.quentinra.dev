=============================
Serialization : JSON
=============================

Tout d'abord, si vous ne connaissez pas le JSON, vous pouvez regarder
le cours associé mais ce n'est pas important pour la suite.

Le JSON est le format très répandu (avec le XML) pour envoyer des données
complexes (objets, tableaux, ...) sous la forme d'une string. Vous
le verrez partout dans la partie API Rest.

.. code:: none

		[
		 "nom" : {
		  "attribut1" : "valeur"
		 }
		]

Pour convertir un truc en JSON, on utilise :code:`JSON.stringify(truc)` qui donne
une string.

On utilise :code:`JSON.parse(string)` pour ré-obtenir notre truc.