======================
Squelette d'une appli
======================

Voici deux exemples d'applications

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

		public class Main {
		 private GLFWErrorCallback errorCallback = GLFWErrorCallback.createPrint(System.err);

		 private void init(){
			// active notre Callback des erreurs
			glfwSetErrorCallback(errorCallback);

			// Initialisation du mode graphique
			if(glfwInit() == 0){ // echec ?
			 throw new IllegalStateException("Echec de l'initialisation du mode graphique");
			}

			//Hint -- on cache la fenêtre puis on l'affichera dès qu'elle sera "prête"
			glfwWindowHint(GLFW_VISIBLE,GLFW_FALSE);

			//création d'une fenêtre
			long window = glfwCreateWindow(1080,720,"Main",0,0);
			if(window == NULL){ // echec ?
			 throw new RuntimeException("Echec de la création d'une fenêtre");
			}

			// positionne la fenêtre (centré par rapport à l'écran)
			GLFWVidMode vidMode = glfwGetVideoMode(glfwGetPrimaryMonitor()); //récupération des dimension de l'écran
			glfwSetWindowPos(window,vidMode.width()-1080/2,vidMode.height()-720/2); // positon centrée

			// affiche la fenêtre - car on l'avait cachée
			glfwShowWindow(window);

			//Boucle qui garde la fenêtre ouverte
			while(!glfwWindowShouldClose(window)){ // tant que la fenêtre se doit pas se fermer
			 glfwSwapBuffers(window); //échange front buffer et back buffer
			 glfwPollEvents(); // récupération des evénements (clic quitter, invoke...)
			}

			// destruction de la fenêtre
			glfwDestroyWindow(window);

			//Fermeture mode graphique
			glfwTerminate();
			errorCallback.free(); // libération du callback d'erreur
		 }

		 public static void main(String[] args){
			new Main.init();
		 }
		}

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

		public class Main {
		 private boolean running = false;
		 private GLFWErrorCallback errorCallback = GLFWErrorCallback.createPrint(System.err);

		 // Game loop
		 private void start(){
			init();
			loop();
			dispose();
		 }

		 private void init(){
			// active notre Callback des erreurs
			glfwSetErrorCallback(errorCallback);

			// Initialisation du mode graphique
			if(glfwInit() == 0){
			 throw new IllegalStateException("Echec de l'initialisation du mode graphique");
			}

			//Hint -- on cache la fenêtre puis on l'affichera dès qu'elle sera "prête"
			glfwWindowHint(GLFW_VISIBLE,GLFW_FALSE);

			//création d'une fenêtre
			long window = glfwCreateWindow(1080,720,"Main",0,0);
			if(window == NULL){
			 throw new RuntimeException("Echec de la création d'une fenêtre");
			}

			// positionne la fenêtre (centré par rapport à l'écran)
			GLFWVidMode vidMode = glfwGetVideoMode(glfwGetPrimaryMonitor()); //récupération des dimension de l'écran
			glfwSetWindowPos(window,vidMode.width()-1080/2,vidMode.height()-720/2); // positon centrée

			// affiche la fenêtre - car on l'avait cachée
			glfwShowWindow(window);

			running = true;
		 }

		 private void dispose(){
			// destruction de la fenêtre
			glfwDestroyWindow(window);

			//Fermeture mode graphique
			glfwTerminate();
			errorCallback.free(); // libération du callback d'erreur
		 }

		 private void loop(){
			while(running){
			 // si utilisateur clique bouton fermer
			 if(glfwWindowShouldClose(window) == 1){
				running = false;
			 }
			 glfwSwapBuffers(window); //échange front buffer et back buffer
			 glfwPollEvents(); // récupération des evénements (clic quitter, invoke...)
			}
		 }

		 public static void main(String[] args){
			new Main.start();
		 }
		}