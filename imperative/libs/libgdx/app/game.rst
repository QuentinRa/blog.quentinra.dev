===============================
Classe Game/ApplicationAdapter
===============================

**Présentation**

Les méthodes sont

	* :code:`create()` : initialisations, allocations
	* :code:`render()` : l'équivalent de la gameloop (n'oubliez pas de la structurer en input, update et render)
	* :code:`dispose()` : libération des ressources
	* :code:`resize(int width, int height)` : appelé à chaque re-dimensionnement
	* :code:`pause()` : sous Android, appui sur le bouton Home
	* :code:`resume()` : sous Android, retour sur l'application

Attention! La libgdx ne supporte pas les initialisations en dehors d'une méthode.

**Explication**

En gros, le lanceur va lancer la classe de jeu qui extends Game/ApplicationAdapter
et appeler ses méthodes.

	* Elle appelle :code:`create` au démarrage et :code:`dispose` à la fin
	* environ 60 fois par seconde, elle appelle :code:`render` pour actualiser l'affichage
	* elle appelle :code:`resize`, :code:`pause`, :code:`resume` en fonction des actions de l'utilisateur

Vous pouvez obtenir l'écart entre deux affichages avec Gdx.graphics.getDeltaTime(),
qui est l'argument :code:`df` des fonctions qui vont suivre.

**render ?**

La méthode render est le coeur de votre jeu : vous allez écrire le code pour dessiner
à l'écran ce qu'il faut afficher. En pratique, on découpe render en trois méthodes

	* :code:`input(df)` : on l'appelle en premier pour récupérer la saisie du joueur
	* :code:`update(df)` : on l'appelle ensuite pour mettre à jour l'état du jeu
	* :code:`render()` : notre fonction qui affichera le jeu

Juste au cas ou, voici le code théorique

.. code:: java

	public void render() {
		float df = Gdx.graphics.getDeltaTime();
		this.input(df); // todo: à coder
		this.update(df); // todo: à coder
		this.render(df); // todo: à coder
	}

**En pratique ?**

En pratique, coder le code pour afficher notre jeu est parfois compliqué, donc on utilise
des Stages et des Acteurs, et on ajoute ce qu'on veut dessiner (Acteurs) au Stages puis
on demande au stage de se dessiner/mettre à jour, ce qui est fait récursivement.

Vous pouvez voir comment on fait cela plus tard.