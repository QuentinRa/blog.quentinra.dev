==========
Contexte
==========

.. code:: java

	import org.lwjgl.glfw.*;
	import static org.lwjgl.glfw.GLFW.*;

Le contexte est "une image" sur la carte graphique sur laquelle OPENGL va "dessiner"
et qui est affichée dans notre fenêtre. Les fenêtre ont par défaut deux buffer : "front buffer" qui est celui
actuellement affiché à l'écran et le "back buffer" qui est le buffer sur lequel on dessine(render). La méthode

.. code:: java

		void glfwSwapBuffers(long window);

permet d'échanger les buffer et ainsi d'afficher ce que l'on vient de dessiner et nous donner un nouveau
buffer pour dessiner. On placera par exemple à la fin de notre méthode render() glfwSwapBuffers.

On peut noter la méthode

.. code:: java

	void glfwSwapInterval(int interval);

qui prends un int qui est le nombre minimum de temps à attendre depuis le dernier :code:`glfwSwapBuffers`
avant le prochain :code:`glfwSwapBuffers`. Cette méthode sert à faire ce qu'on appel couramment :
vertical synchronization, vertical retrace synchronization or just vsync.

Après la création de la fenêtre, on doit lui associer un contexte

.. code:: java

	void glfwMakeContextCurrent(long window);

Puis, et seulement après, on préviens la librairie que l'on a crée notre contexte :

.. code:: java

	GL.createCapabilities();

On peut savoir sur quel fenêtre le contexte est :

.. code:: java

	long glfwGetCurrentContext();

Créer un contexte est nécessaire pour utiliser :code:`glfwSwapInterval` mais même s'il ne l'est pas pour
:code:`glfwSwapBuffers` (que vous devez impérativement utiliser), on le créera toujours par exemple à
la fin de notre boucle init(). Il permet par exemple l'utilisation des extensions ou encore
:code:`glfwGetProcAddress` ainsi que de "partager" les écrans lors de la création d'une fenêtre
(le fameux "share" que l'on mettait à 0 lors de la création d'une fenêtre).