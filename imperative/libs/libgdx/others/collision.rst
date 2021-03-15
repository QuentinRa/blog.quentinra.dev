============
Collision
============

La libgdx propose dans le package math des classes dont 3 peuvent nous servir à calculer
si deux entités se touchent (s'intersectent).


**Collision Simple**

Il s'agit d'une méthode rapide pour tester la collision.
On va associer a chacun de nos acteurs un objet de la classe `Rectangle`_.

.. code:: java

		// les x,y, width, height sont celles de notre acteur
		Rectangle rectangle = Rectangle(float x, float y, float width, float height);
		// collision, renvoi vrai si rectangle et autreRectangle se touchent
		boolean rectangle.overlaps(Rectangle autreRectangle);

**Collision Avancée**

Utiliser des rectangles n'est pas très précis pour les formes non rectangulaires,
on dispose de la classe `Polygon`_ pour un recouvrement plus précis.

Il vous faudra alors trouver un moyen de déterminer les points pour créer un `Polygon`_
qui entoure votre entité.

Pour déterminer s'il y a collision entre deux Polygones, on utilise `Intersector`_.

.. code:: java

	boolean Intersector.overlapConvexPolygons(Polygon p1, Polygon p2);

Calculer si deux polygon s'intersectent est coûteux, on préférera regarder d'abord si deux rectangles se croissent.

**Collision réaliste**

Le système de collision, nous préviens lorsqu'un acteur est sur un autre, mais certains acteurs
sont solides, et on ne peut pas "se placer" dessus.

Il faut donc calculer avant chaque déplacement s'il va y avoir collision (voir 1. et 2.).

`Intersector`_ nous permet également s'il y a collision entre deux acteurs, d'obtenir la distance minimum pour
éviter la collision avec la classe `MinimumTranslationVector`_.

.. code:: java

	boolean Intersector.overlapConvexPolygons(Polygon p1, Polygon p2, Intersector.MinimumTranslationVector mtv);

Il ne vous reste plus qu'a ajuster la position avec MinimumTranslationVector.normal
et MinimumTranslationVector.depth (si vous êtes en 3D).

.. _MinimumTranslationVector: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/math/Intersector.MinimumTranslationVector.html
.. _Rectangle: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/math/Rectangle.html
.. _Intersector: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/math/Intersector.html
.. _Polygon: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/math/Polygon.html