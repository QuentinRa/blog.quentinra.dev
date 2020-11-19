================================================================
Analyser le besoin, établir le périmètre du projet
================================================================

L'objectif de cette partie est d'obtenir une idée précise de ce
que vous voulez faire et comment.

Une fois que vous aurez votre liste de tâches, et possiblement
une idée de leur coût, vous pourrez organiser tout çà
dans la partie suivante.

1. Analyser le besoin
==================================

Vous le verrez sur le cours sur la qualité, mais il arrive souvent que
l'on ne donne pas au client ce qu'il veut, soit parce qu'il a changé d'avis ou soit
parce que vous l'avez mal compris/il s'est mal exprimé.

La méthode Agile-Scrum (:ref:`scrum`) est une méthode généralement utilisée
car elle est flexible et fait régulièrement intervenir le client, ce qui
diminue le risque, cependant tous les projets ne sont pas agiles.

Généralement, après avoir discuté avec le client, vous avez rédigé un texte
décrivant ce qu'il veut.

	* vous pouvez dans un premier temps faire une maquette de ce que le client veut et lui montrer

		* vous avez une dans la partie :ref:`ihm`
		* je recommande de faire une maquette dynamique d'un logiciel, car cela aide beaucoup pour voir

			* que vous n'oubliez pas des fonctionnalités clefs évidentes (fermer le programme, sauvegarder etc...)
			* de vous donnez une idée des problèmes que vous allez rencontrer (taille écran, ...)
			* de penser à l'avance à l'apparence des écrans

	* dans un second temps, vous pouvez lister toutes les tâches à faire (coder fenêtre xxx, ...)

		* généralement les tâches sont priorisés
		* vous pouvez ordonner les tâches par groupe pour faciliter la partie suivante
		* vous pouvez associer à chaque tâche un coût en temps

	* dans un dernier temps, il est critique d'étudier la faisabilité de ce que vous souhaitez faire
	* \
		vous pouvez également faire un Diagramme UML du projet mais seulement si ça aide,
		ou mieux : pratiquer le :ref:`mdd` (parce que c'est long mais ça aide) !

**Prioriser ses tâches**

Généralement, toutes les tâches ne seront pas réalisés,
de nouvelles pourront être ajoutés, on utilise la notation MoSCoW pour prioriser

	*	Must : doit être fait
	*	Should : doit être fait après les Must
	*	Could : peut être fait
	*	Would : si tout le reste a été fait

Alternativement, il existe la matrice d’Eisenhower qui
fonctionne sur le même principe (Faire, Déléguer, Planifier, Éliminer).

2. Comment réaliser le livrable + Périmètre
==============================================

Cette partie à pour objectif de vous donner une aide
sur ce que vous devriez penser lors avant de vous lancer

	* vous pouvez penser à public de votre application

		* plateforme/système d'exploitation
		* langue
		* niveau technique

	* comment les données sont sauvegardées ?

		* fichier ? : format, ...
		* base de données ? : version, ...

	* besoin de matériel supplémentaire ?
	* restrictions ?
	* méthode de développement particulière ? :ref:`mdd`, :ref:`scrum`, tdd, pair-programming
