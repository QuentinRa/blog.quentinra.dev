==============
Cinématiques
==============

La libgdx ne gère pas directement les "cinématiques" mais une cinématique est un ensemble de scènes
où un `Actor`_ effectue une `Action`_.

Attention à ne pas confondre `Actions`_ (crée des Action) et `Action`_ (action crée par Actions).

Actions génériques
************************

La classe Actions contient des méthodes static renvoyant des actions génériques

	* :code:`fadeIn(float duration);` : fait apparaitre une acteur. (inverse fadeOut(float));
	* :code:`moveBy(float x, float y, float duration);` : déplace un acteur.
	* :code:`rotateBy(float rotationAmount, float duration);` : fait pivoter un acteur.
	* :code:`show();` : affiche un acteur (inverse hide());
	* :code:`removeActor();` : retire du stage l'acteur qui a appelé cette action.
	* :code:`Actions.run(Runnable runnable);` : execute la méthode run de la classe Runnable
	* ...

On ajoute une action à un acteur avec addAction

.. code:: java

		// créé une action
		Action action = Actions.methode(arguments);
		Actor actor = new Actor();
		// l'acteur exécute action
		actor.addAction(action);

Modificateurs d'Actions
************************

On peut vouloir qu'une action soit répétée, ou alors qu'elle soit jouée après une autre.
Les méthodes pour changer le comportement d'une action sont de la forme

.. code:: java

	Action Actions.changementComportement(Action action);//prends une action et renvoi l'action modifiée

Quelques modificateurs

	*	:code:`Actions.after(Action action);` : exécute l'action donnée en argument lorsque les précédentes actions sont terminés.
	*	:code:`Actions.repeat(int repetitions, Action action);` : répète action répetitions fois.
	*	:code:`Actions.forever(Action actionARepeter);` : repète une action en boucle.
	*	:code:`Actions.delay(float duration, Action action);` : attends duration secondes avant de lancer l'action.
	*	:code:`Actions.sequence(Action action, ...)` : groupe dans un objet, une suite d'actions et les exécute les unes après les autres.

.. code:: java

		Action action2 = Actions.forever(action);
		actor.addAction(action2);

Créer des Actions
********************

Crée une action revient à créer une classe qui extends Action dont on surcharge la méthode act. Notez que la
classe possède un attribut Action#target qui contient l'acteur sur lequel on effectue l'action. La méthode
renvoi true si l'action est terminée, sinon false.

.. code:: java

		public class Exemple extends Action{
		 @Override
		 public boolean act(float dt){//dt = temps depuis dernier appel
			this.target.moveBy(1,1); //déplace l'acteur qui appelle l'action
			return true; //action finie
		 }
		}

.. _Action: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/Action.html
.. _Actions: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/actions/Actions.html
.. _Actor: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/Actor.html