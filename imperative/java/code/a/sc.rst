================
Pile et Files
================

Pile
-----------

Il existe plusieurs moyens de créer une pile, en voici une

.. code:: java

		Queue<Classe> pile = new LinkedList<Classe>();

		//méthodes
		add(element); //ajoute un élément
		offer(element); //ajoute un élément
		element(); //retourne l'élément en haut mais ne le retire pas
		peek(); //retourne le dernier élément
		poll(); //retourne et supprime le dernier élément
		remove(); //supprime le dernier élément

Alternativement, vous pouvez utiliser le classe :code:`Stack`.

Files
------------

Vous pouvez utiliser LinkedList comme pour les piles.