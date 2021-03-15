==================
Stages et Actors
==================

.. _Actor: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/Actor.html
.. _Stage: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/scenes/scene2d/Stage.html

Tous les objets (boutons, joueur, fond d'écran, ...) sont pour la libgdx des `Actor`_.

En fait ce n'est pas le cas, au début seulement les widgets (boutons, ...) sont des actors mais pour
que tout marche facilement, vous allez faire en sorte que tout ce que vous créez qui sera affiché
hérite de actor.

La classe Actor par défaut est très rustique, c'est normal, vous verrez plus en détail plus tard
en quoi elle consiste, comment l'améliorer etc.
Chaque acteur possède une méthode pour l'afficher (draw) et une méthode pour le mettre à jour (act).

Pour l'instant, on va supposer que l'on a des Actors et qu'on voudrait les afficher. Cela
se fait avec un `Stage`_.

Pour éviter de devoir appeler act et draw sur chaque acteur dans la méthode render, on ajoute
tous les acteurs à un Stage, qui lorsque l'on appelle act/draw dessus, répercute l'appel,
sur tous les acteurs ajoutés, **dans l'ordre d'ajout**. J'insiste sur l'ordre d'ajout, car
cela nous permets de mettre des acteurs au dessus de d'autres acteurs.

.. code:: java

		public void create(){
		 ...
		 this.stage = new Stage(); //Création d'un Stage
		 Actor actor = new Actor(); //création d'un acteur
		 stage.addActor(actor); //ajout au Stage
		 ...
		}

		public void render(float delta) {
		 this.stage.act(); //update de tous les acteurs
		 this.stage.draw(); //dessin de tous les acteurs
		}

		public void dispose() {
		 this.stage.dispose(); //on doit libérer le stage, qui va libérer tous ses acteurs
		}

Les avantages d'un stage sont

	* un stage possède une caméra (qu'on pourra déplacer)
	* un stage possède un gestionnaire d'événement

Quelques notes

	* l'interface étant fixe, on la mets généralement dans un stage à part, et on ne bougera jamais sa caméra
	* on peut aussi faire un stage pour le fond d'écran
	* on dessine l'interface en dernier mais c'est généralement la première à récupérer les input

		.. code:: java

			public void render(){
			 // on regarde l'interface en premier pour input
			 stageInterface.act();
			 stageJeu.act();

			 stageJeu.draw();
			 // on dessine l'interface en dernier
			 stageInterface.draw();
			}
