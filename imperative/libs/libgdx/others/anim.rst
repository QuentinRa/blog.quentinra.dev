============
Animations
============

La libgdx possède la classe `Animation`_.
Elle permet par exemple de jouer une série d'images (`TextureRegion`_ lorsqu'un acteur se déplace).

.. code:: java

		//on reste frameDuration sur chaque image de la textureRegion
		Animation<TextureRegion> myAnimation = new Animation<TextureRegion>(float frameDuration, Array<TextureRegion> keyFrames);

La méthode getKeyFrame renvoi la TextureRegion a afficher.

.. code:: java

		// stateTime doit contenir le temps écoulé depuis le lancement de l'animation
		TextureRegion getKeyFrame(float stateTime);

La méthode isAnimationFinished renvoi si l'animation est terminée

.. code:: java

	boolean isAnimationFinished(float stateTime);

La méthode setPlayMode permet de définir un mode d'exécution de l'animation (voir plus bas)

.. code:: java

	void setPlayMode(Animation.PlayMode playMode);

**Modes de lancements**

Il est possible de faire boucler l'animation, de la jouer dans un ordre particulier. La classe `PlayMode`_
contient les modes disponibles.

	*	NORMAL : mode de base
	*	LOOP : boucle l'animation
	*	LOOP_PINGPONG : ???
	*	LOOP_RANDOM : ???
	*	LOOP_REVERSED : ???
	*	REVERSED : ???

.. _Animation: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/g2d/Animation.html
.. _PlayMode: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/g2d/Animation.PlayMode.html
.. _TextureRegion: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/g2d/TextureRegion.html