===========
Événements
===========

La libgdx considère deux types d'évènements :

	* évènement continu (maintient) marcher/courir/...
	* évènement discontinu (clic) saut, tir, attaque

Les actions discontinues, introduisent le principe d'observateurs (listeners),
sur le même principe que dans swing.

Action continues
***********************

Les actions continues sont des actions que l'on vérifie en permanence
(ce sont des if dans vos méthodes "input"). Par exemple dans le input
de player, vous aurez des if qui regardent si la touche "Z" pour avancez
est pressée et si oui

	* avance le player (bof)
	* indique à la classe que le joueur veut avancer le player, laisse update faire le calcul (nice)

On peut regarder si une touche est saisie avec le champ static de type `Input`_ de la classe `Gdx`_

.. code:: java

	boolean Gdx.input.methodeRecuperation(args);

Pour les clavier, on a comme méthodes de récupération :

	* isKeyPressed(`Input.Keys`_ key) : touche actuellement appuyée
	* isKeyJustPressed(`Input.Keys`_ key) : touche appuyée

Action discontinues
*************************

Personnellement, j'utilise que ça. Comme dans swing, on va pouvoir associer des observateurs (`EventListener`_)
mais seulement aux `Actor`_ ou aux classes qui possèdent une méthode addListener.

.. code:: java

		Actor a = new Actor();
		a.addListener(EventListener listener);

Exemple de création d'un observer

.. code:: java

		public Observateur implements EventListener {
		 @Override
		 public boolean handle(Event event) {
			if(isMousePressed(event)){
			 //code
			 return true; //true = traité l'événement
			}
			return false;//sinon false = pas traité
		 }

		 // regarde si le type d'évènement est bien du type souris cliqué.
		 // il faut coder une méthode comme ça pour vérifier à chaque fois !
		 public static boolean isMousePressed(Event event){
			return ((event instanceof InputEvent) && ((InputEvent) event).getType().equals(InputEvent.Type.touchDown));
		 }
		}

Event peut être de l'un des trois types suivants

	* `InputEvent`_
	* `ChangeEvent`_
	* `FocusEvent`_

Maintenant pour que l'observateur soit appelé, il faut qu'il soit ajouté à un gestionnaire
d'évènements et que celui-ci soit associé au gestionnaire d'évènements principal.

Un gestionnaire d'évènement est une classe qui implémente `InputProcessor`_ donc dans cet gestionnaire,
on écrit le code pour exécuter par exemple les observateurs.

Un stage implémente déjà `InputProcessor`_ et appelle les observateurs de tous ses acteurs.

.. code:: java

		boolean keyDown(int keycode); //touche maintenue
		boolean keyTyped(char character); //touche appuyée
		boolean keyUp(int keycode); //touche relâchée
		boolean mouseMoved(int screenX, int screenY); //déplacement souris
		boolean scrolled(int amount); //scroll
		boolean touchDown(int screenX, int screenY, int pointer, int button); //clic souris maintenu
		boolean touchDragged(int screenX, int screenY, int pointer); //clic souris
		boolean touchUp(int screenX, int screenY, int pointer, int button); //clic souris relâché

Cependant, ce n'est pas terminé. Il faut avertir le gestionnaire principal d'utiliser notre InputProcessor.
On utilise la méthode de Gdx input

.. code:: java

	Gdx.input.setInputProcessor(InputProcessor processor);

Vous voyez que la méthode s'appelle set et non add. Vous devez utilisez un `InputMultiplexer`_
si vous voulez ajouter plusieurs gestionnaires d'événements.

.. code::

		InputMultiplexer im = new InputMultiplexer();
		im.addProcessor(InputProcessor processor); //ajouter un processus
		im.removeProcessor(InputProcessor processor); //retirer un processus

		// dans create ou onShow
		Gdx.input.setInputProcessor(im);


.. _Input: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Input.html
.. _Gdx: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Gdx.html
.. _Actor: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/Actor.html
.. _Input.Keys: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/Input.Keys.html
.. _InputProcessor: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/InputProcessor.html
.. _InputMultiplexer: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/InputMultiplexer.html
.. _InputEvent: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/InputEvent.html
.. _ChangeEvent: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/utils/ChangeListener.ChangeEvent.html
.. _FocusEvent: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/utils/FocusListener.FocusEvent.html
.. _EventListener: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/EventListener.html