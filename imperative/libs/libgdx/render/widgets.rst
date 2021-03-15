=========
Widgets
=========

La construction des widgets suit le même principe, quel que soit le type (bouton, label)

	* On créé notre widget
	* On lui applique optionnellement un style, ce qui comprends une police.

Notez que tous les widgets sont des instances de Actor (cf Actor) donc il sont gérés pareil
que ce soit au niveau de l'affichage ou au niveau de récupération des évènements.

Normalement, on utilise un fichier .json spécial qui contient le style de tous nos composants
mais ce ne sera pas expliqué pour le moment.

Seulement deux widgets seront présentés ici, en fait moi je n'utilise plus ça du tout, et je
vous montrerais plus tard ce que je fais.

Label
********

On affiche du texte avec la classe `Label`_ et sa classe de style associée `Label.Style`_.

.. code:: java

	Label(java.lang.CharSequence text, Label.LabelStyle style);

Quelques méthodes utiles :

	* :code:`void setText(String text)` : change le texte
	*	:code:`void setColor(Color color)` : change la couleur
	*	:code:`void setPosition(float x, float y)` : change la position
	*	:code:`void setWrap(boolean wrap)` : va à la ligne lorsque plus de place

Button
********

On considère deux type de boutons

	* charge l'image d'un bouton avec directement le texte dedans
	* charge un image vide et on met du texte dessus.

Notez que cette partie n'explique pas comment ajouter du code lorsqu'un bouton est cliqué.
Veuillez vous référer à la section événements

Bouton image
----------------

On affiche un bouton "image" avec la classe `Button`_ et sa classe de style associée `Button.Style`_.

.. code:: java

	Button button = new Button();

On peut associer à chaque état du bouton une image de l'interface Drawable.

Les états sont des champs static de ButtonStyle :

	* up: image affichée de base
	* down: image affichée lorsque le bouton est appuyé
	* checked: image affichée lorsque le bouton est survolé

.. code:: java

		ButtonStyle style = new ButtonStyle();
		style.up = new TextureRegionDrawable(new Texture(FileHandle texture)); //charge texture du bouton
		style.checked = new TextureRegionDrawable(new Texture(FileHandle texture))); //texture au survol
		button.setStyle(style);

Remarque : pour ajouter une texture, on pourra utiliser la classe TextureRegionDrawable...

Bouton text-image
--------------------

On affiche un bouton "texte" avec la classe `TextButton`_ et avec la classe de style `TextButton.TextButtonStyle`_.

.. code:: java

	TextButton(String text, TextButtonStyle style);

Notez que le bouton texte-image est un bouton image auquel on a ajouté du texte donc il possède les
champs up, down, checked...

Le petit problème est qu'il est possible que le texte soit plus grand que l'image. On utilise alors `NinePatch`_
pour agrandir l'image sans la déformer.

L'idée du NinePatch est de découper une image en 3 lignes et 3 colonnes et d'étirer
seulement le centre donc les bordures ne sont pas déformés.

.. code:: java

	NinePatch(Texture texture, int left, int right, int top, int bottom);

On peut ensuite passer la version NinePatch qui implémente Drawable à nos boutons comme on l'a vu dans Bouton "image".

.. code:: java

	NinePatchDrawable(NinePatch ninePatch);

Ce qui donne

.. code:: java

		TextButtonStyle style = new TextButtonStyle();
		//charge texture du bouton
		style.up = new NinePatchDrawable(new NinePatch(new Texture(FileHandle texture)));
		TextButton textButton = new TextButton("HelloWorld", style);

.. _NinePatch: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/graphics/g2d/NinePatch.html
.. _TextButton: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/TextButton.html
.. _TextButton.TextButtonStyle: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/TextButton.TextButtonStyle.html
.. _Button: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/Button.html
.. _Button.Style: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/Button.ButtonStyle.html
.. _Label: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/Label.html
.. _Label.Style: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/ui/Label.LabelStyle.html