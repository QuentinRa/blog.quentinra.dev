=========
Souris
=========

.. code:: java

		import org.lwjgl.glfw.*;
		import static org.lwjgl.glfw.GLFW.*;

Récupération des "clics" (v1)
------------------------------

La méthode :code:`int glfwGetMouseButton(long window,int button)`
prends une fenêtre, et un bouton parmi :

	*	:code:`GLFW_MOUSE_BUTTON_LEFT` : clic gauche de la souris
	*	:code:`GLFW_MOUSE_BUTTON_RIGHT` : clic droit de la souris
	*	:code:`GLFW_MOUSE_BUTTON_MIDDLE` : bouton central de la souris (scroll)

Notez que ces constantes valent respectivement 0,1,2 et renvoi

	*	:code:`GL_PRESS` : le bouton a été appuyé
	*	:code:`GL_RELEASE` : le bouton n'est pas appuyé
	*	:code:`GL_REPEAT` : le bouton est maintenu

Bien sur cette méthode est acceptable mais très peu optimisée : on l'utilisera par exemple dans un if
en regardant si le bouton 0 a été appuyée par exemple, cependant cela impliquerai en théorie que l'on regarde
à chaque la condition qu'il y a eu un clic ou non. L'alternative plus optimal est un MouseBoutonCallback.

Récupération des "clics" (v2)
------------------------------

On utilise un callback, on va créer un classe (MouseClic.java par exemple) :

.. code:: java

		import org.lwjgl.glfw.*;
		import static org.lwjgl.glfw.GLFW.*;

		// MouseClic hérite de l'interface GLFWMouseButtonCallbackI pour la méthode invoke
		public class MouseClic implements GLFWMouseButtonCallbackI {
		 @Override
		 public void invoke(long window, int button, int action, int mods) {
			// clic droit appuyé
			if (button == GLFW_MOUSE_BUTTON_RIGHT && action == GLFW_PRESS ) {
			 System.out.println("clic droit"); //message
			}
		 }
		}

invoke vous donne accès :

	*	window : fenêtre à laquelle le callback est associé
	*	button : :code:`GLFW_MOUSE_BUTTON_[nombre]` avec les nombres allant de 0 à 7 (0,1,2 clic principaux)
	*	action : GL_PRESS GL_RELEASE GL_REPEAT
	*	mods : champ de bit avec la description des "modifier key" (shift, capslock) qui sont activés.

Et dans notre main

.. code:: java

		// attribut -> callback clic souris
		private static MouseClic mouseClic = new MouseClic();
		...
		// activation callback clic souris
		glfwSetMouseButtonCallback(window,mouseClic);