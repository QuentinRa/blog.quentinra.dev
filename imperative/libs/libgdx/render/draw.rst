======================
Affichage et Images
======================

Alors premièrement, je n'ai jamais fait aucun dessin, la seule chose que j'ai affiché
c'est des images. Je vais donc uniquement expliquer comment dessiner des images.

**Une image**

Une image est représentée par la classe `Texture`_, le code suivant demande d'avoir lu la partie sur
les fichiers.

.. code:: java

	Texture(FileHandler file);

On utilise ensuite un batch et la méthode draw pour dessiner l'image

.. code:: java

	batch.draw(Texture texture, float x, float y);

N'oubliez pas de libérer votre image !

**SpriteSheet**

Un SpriteSheet est une image qui contient plein de petites images. On utilisera la classe TextureRegion.

.. code:: java

	TextureRegion(Texture texture);

L'avantage est que l'on charge une seule image donc pas beaucoup de ressources et la classe TextureRegion
permet de naviguer sur l'image avec le système u,v (si une image contient 4 images sur une ligne et 2 lignes,
alors sa première sous image va de x=0,y=0 à x=1/4=0.25,y=1/2=0.5).

Deux des variantes de draw pour dessiner une textureRegion sont

.. code:: java

		batch.draw(TextureRegion region, float x, float y);
		batch.draw(TextureRegion region, float x, float y, float originX, float originY,
		float width, float height, float scaleX, float scaleY, float rotation);

Si vous êtes dans un actor, les valeurs originX, ... peuvent toutes être récupérées avec des
getters.

.. _Texture: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/Texture.html
.. _TextureRegion: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/g2d/TextureRegion.html
