=========
Clavier
=========

.. code:: java

		import static org.lwjgl.glfw.GLFW.*;
		import static org.lwjgl.glfw.*;

Il existe deux moyens de savoir si l'utilisateur à tapé sur une touche (il existe plusieurs versions de la 2e
façon mais elles sont mauvaises (lambda expression, classe anonyme) ). La première qui est moyen est en utilisant
la méthode

.. code:: java

	int glfwGetKey(long window, int key);

Elle prends une fenêtre et un touche parmi la liste plus bas et nous renvoi GLFW_PRESS si la touche à été appuyée
ou (exclusif) GLFW_RELEASE si la touche est relâchée. On utilisera un callback.

La méthode :code:`void glfwPollEvents();` permet entre-autres de récupérer les évènement survenus
(clic de souris, touche appuyée...), et va en même temps appeler les callback. Si on a ajouté un keyCallback
à la fenêtre, alors dès que l'on interagit avec une touche, le keyCallback va être lancé :

On peut paramétrer dans notre keyCallback des actions tels que ouvrir un menu lorsque la touche i est appuyée.

On commence par créer un nouvelle classe, étape OBLIGATOIRE car la classe keyCallback est abstraite
(il existe d'autres méthodes en créant un classe anonyme ou en utilisant un lambda expression qui sont des
absurdités à ne jamais utiliser (leur usage ne se justifie généralement pas)).

.. code:: java

		// je crée une classe InputKey.java
		import static org.lwjgl.glfw.GLFW.*;
		import static org.lwjgl.glfw.*;

		public class InputKey extends GLFWKeyCallback{
		 // réécriture de la méthode abstraite
		 @Override
		 public void invoke(long window,int key,int scancode, int action, int mods) {
			// code que l'on exécute lorsqu'il y a une interaction avec le clavier
			// explication sur invoke plus bas.
		 }
		};

Et dans notre main

.. code:: java

		// création du keyCallback
		GLFWKeyCallback keyCallback = new InputKey();
		// ajout du Callback à la fenêtre
		glfwSetKeyCallback(window, keyCallback);

Je vous conseille de créer keyCallback comme un attribut static

.. code:: java

	private static GLFWKeyCallback keyCallback = new InputKey();

et d'ajouter keyCallback a la fenêtre dans la boucle init() mais ce n'est pas obligatoire.

invoke à en argument une fenêtre (qui est celle associé au Callback), une key : constante associé à la touche, un
scancode : constante associé à la touche par le system, action : GLFW_RELEASE (relâche touche), GLFW_PRESS
(appuie sur la touche) ou GLFW_REPEAT (maintien appuyé), mods : bitfield describing which modifiers
keys were held down.

Exemple d'utilisation, je veux changer le titre de la fenêtre si l'utilisateur appuie sur k.

.. code:: java

		import static org.lwjgl.glfw.GLFW.*;
		import static org.lwjgl.glfw.*;

		public class InputKey extends GLFWKeyCallback{
		 @Override
		 public void invoke(long window,int key,int scancode, int action, int mods) {
			// touche k appuyée
			if (key == GLFW_KEY_K && action == GLFW_PRESS){
			 glfwSetWindowTitle(window,"Le joueur a appuyé sur k");
			}
		 }
		};