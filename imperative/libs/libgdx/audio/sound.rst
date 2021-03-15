========
Sons
========

On charge un sons avec la méthode

.. code:: java

	Gdx.audio.newSound(FileHandle file);

On peut lancer plusieurs instances d'un son en même temps. Les méthodes qui ne prennent pas d'arguments sont
faites sur toutes les instances du même son et celles qui prennent un id (long) sont faites juste pour un seul.

Voici quelques méthodes

.. code:: java

		///
		// Lecture
		///
		long play();
		long play(float volume); //joue un son, volume de 0 à 1
		///
		// Pause
		///
		void pause();
		void pause(long soundId); //arrêter un seul
		///
		// Relancer
		///
		void resume();
		void resume(long soundId); //relancer un seul
		///
		// Jouer en boucle
		///
		long loop();
		long loop(float volume); //joue un son, volume de 0 à 1
		///
		// Arrêter
		///
		void stop();
		void stop(long soundId); //arrêter un seul