=======
Batch
=======

Pour éviter de faire des allocations pour chaque dessin, ce qui serait peu performant,
on transmet tout ce que l'on veut dessiner en un appel.

Ceci est le job du `Batch`_. Vous indiquez que vous allez dessiner
avec :code:`batch.begin()`, puis lui indiquez qu'il doit tout envoyer pour que
ce soit dessiné avec :code:`batch.end()`. Entre les deux appels, on dessine avec des appels à draw.

On peut utiliser la classe `SpriteBatch`_ dans l'exemple plus bas pour dessiner (implémente l'interface `Batch`_),
mais il y en a plein. En particulier, vous aurez dans la méthode :code:`draw` de chaque
:code:`Actor` un stage qui sera fournit, ouvert par le :code:`Stage` que vous utiliserez
pour dessiner.

.. code:: java

		// dans la méthode create()
		SpriteBatch batch = new SpriteBatch();

		// dans la méthode render()
		batch.begin(); //indique que l'on va dessiner

		// pleins de méthodes draw différentes en fonction de ce qu'on veut dessiner
		batch.draw(arguments...); // ici, autant d'appels que de dessins à faire

		batch.end(); // indique terminé, tout va être dessiné et affiché.

		// dans la méthode dispose()
		batch.dispose();

.. _Batch: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/g2d/Batch.html
.. _SpriteBatch: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/g2d/SpriteBatch.html