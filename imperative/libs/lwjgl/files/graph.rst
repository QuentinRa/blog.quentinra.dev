================
Mode graphique
================

.. code:: java

			import org.lwjgl.*;
			import org.lwjgl.glfw.*;
			import org.lwjgl.opengl.*;
			import org.lwjgl.system.*;

			import java.nio.*;

			import static org.lwjgl.glfw.Callbacks.*;
			import static org.lwjgl.glfw.GLFW.*;
			import static org.lwjgl.opengl.GL11.*;
			import static org.lwjgl.system.MemoryStack.*;
			import static org.lwjgl.system.MemoryUtil.*;

**Mode graphique**

La méthode :code:`glfwInit();` permet d'initialiser le mode graphique. Elle prépare tout ce dont on aura
besoin pour utiliser le mode graphique et n'est pas optionnelle ! Elle renvoi un boolean :
true si elle a réussi à initialiser le mode graphique sinon false.

.. hint::

	On doit vérifier le retour de glfwInit().

	.. code:: java

		if(glfwInit() == false){
		 throw new IllegalStateException("Echec de l'initialisation du mode graphique");
		}

La méthode glfwInit() fait entre-autre des allocations en mémoire et doit donc être fermée à la fin du
programme ou lorsqu'on le quitte :code:`glfwTerminate();`.

La méthode glfwTerminate s'occupe de libérer la mémoire...