=================================
Manipulation de Lanceurs
=================================


.. _LwjglApplicationConfiguration: https://libgdx.badlogicgames.com/ci/nightlies/docs/api/com/badlogic/gdx/backends/lwjgl/LwjglApplicationConfiguration.html
.. _Starter-classes: https://github.com/libgdx/libgdx/wiki/Starter-classes-and-configuration#desktop-lwjgl3

On va utiliser un duo Application/ApplicationConfiguration qui corresponds au lanceur
de notre Jeu (ici TestGame). Par exemple on aura un lanceur HTML si on veut exécuter
notre code dans un site web etc.

Voici le tutoriel officiel, très simple : `Starter-classes`_.

Voici un exemple avec Lwjgl, mais notez que vous devriez utiliser Lwjgl3 !
La configuration (taille fenêtre, ...) est faite avec une classe de configuration
dont la doc est ici : `LwjglApplicationConfiguration`_ (une pour chaque lanceur).

.. code:: java

		import com.badlogic.gdx.backends.lwjgl.LwjglApplication;
		import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration;
		// c'est une classe que j'ai crée, c'est mon jeu !
		// dans le package game, la classe TestGame
		import game.TestGame;

		public class DesktopLauncher {
		 public static void main (String[] arg) {
			//Création d'un fichier de configuration
			LwjglApplicationConfiguration config = new LwjglApplicationConfiguration();
			//configurations éventuelles, ici aucune
			//lance le lanceur d'application
			new LwjglApplication(new TestGame(), config);
		 }
		}