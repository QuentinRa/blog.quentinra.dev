========
Musique
========

On charge une musique avec la méthode

.. code:: java

	Gdx.audio.newMusic(FileHandle file);

Voici quelques méthodes

.. code:: java

		void play();
		void pause();
		boolean isPlaying();
		void setLooping(boolean isLooping); //isLooping()
		void setVolume(float volume); //getVolume()
		void setPosition(float position); //getPosition()
		void stop();