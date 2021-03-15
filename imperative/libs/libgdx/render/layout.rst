=================
Mise en page
=================

Avant de commencer à dessiner, il faut savoir que vous allez
presque sûrement positionner les composants à des endroits, ceci est
définit par ce qu'on appelle le LayoutManager.

Avec la LIBGDX, on utilise la classe `Table`_.

Elle fonctionne sur le même principe qu'un tableau excel, vous avez des cases (`Cell`_) : vous pouvez les fusionner,
leur faire prendre plusieurs lignes/colonnes, et placer du contenu dedans (`Actor`_).

.. code:: java

		Table table = new Table();
		// ligne ultra importante
		// on dit au tableau de prendre tout son parent
		table.setFillParent(true);

La classe Table est une sous-classe de Actor, on peut donc mettre un tableau dans une cellule.

Ajouter du contenu dans le tableau

.. code:: java

		Cell<T> add(Actor... actors); //ajoute une cellule avec un acteur
		Cell<T> add(String text); //ajoute une cellule avec du texte
		Cell<T> add(); //ajoute une cellule vide

Toutes les cellules sont ajoutés (add) sur la même ligne, row permet de passer à la ligne suivante.

.. code:: java

	Cell<T> row();

Toutes les méthodes retournent une Cell, on peut effectuer des actions dessus

	* :code:`Cell<T> colspan(int colspan);` : une cellule prends plusieurs colonnes (rowspan(int) pour les lignes)
	* :code:`Cell<T> expandX()` : force une cellule à prendre l'espace restant horizontal (expandY pour vertical)
	* :code:`Cell<T> pad(float top, float left, float bottom, float right);` : applique du padding dans la cellule.
	* :code:`Cell<T> size(float width, float height)` : taille de la cellule
	* :code:`Cell<T> top(), bottom(), right(), left()` : alignement du contenu

.. _Actor: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/Actor.html
.. _Cell: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/Cell.html
.. _Table: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/Table.html