==================
Nettoyer l'écran
==================

Tout d'abord, généralement dans la méthode create, il faut décider la couleur de fond
de l'application, aka le fond d'écran (plus une couleur de nettoyage, voir cours lwjgl mais bref).

.. code:: java

	// définie couleur de nettoyage
	Gdx.gl.glClearColor(float r, float g, float b, float a);

Ensuite dans :code:`render`, il faut nettoyer l'écran avant d'afficher, donc la première ligne
est :code:`Gdx.gl.glClear(int mask);` en considérant mask (argument séparés par :code:`|`)

* GL20.GL_COLOR_BUFFER_BIT : nettoyage du buffer représentant les bits de l'écran
* GL20.GL_DEPTH_BUFFER_BIT : nettoie les buffers sur l'axe z (pour les jeux 3D)