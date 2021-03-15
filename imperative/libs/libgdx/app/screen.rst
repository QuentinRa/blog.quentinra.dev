=============
Classe Game
=============

On peut considérer une application comme étant une panoplie d'écrans.
La classe `Screen`_ permet d'en représenter un.

La classe `Game`_, possède les accesseurs getScreen et setScreen qui permettent
de manipuler le `Screen`_ actuellement affiché par l'application.

Un `Screen`_ possède toutes les méthode de Game et en plus

.. code:: java

		void show(); //appelée lorsque l'application passe sur cet écran
		void hide(); //appelée lorsque l'application quitte cet écran

.. _Game: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Game.html
.. _Screen: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Screen.html