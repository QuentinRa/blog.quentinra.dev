=====================
Notion de CallBack
=====================

Les callback sont extrêmement important. Ils permettent par exemple s'il y a eu une erreur,
d'obtenir un message d'erreur (dans notre langage) pour que l'on puisse assez facilement identifier l'erreur.
Il permettent de traiter le retour d'un événement tel un clic de la souris, interaction avec le clavier...
et de dire par exemple si on a appuyé sur une touche ce que le programme doit faire. Cet exemple illustre un
type de callback mais il en existe d'autres.

**Création**

On peut créer un callback, ErrorCallback, qui va afficher sur la sortie d'erreur et en faisant
directement appel à .set() pour le rendre effectif

.. code::: java

	GLFWErrorCallback.createPrint(System.err).set();

ou encore :

On peut créer un attribut à notre classe et lui donner un callback puis l'activer

.. code:: java

		//Création de l'attribut
		private GLFWErrorCallback errorCallback = GLFWErrorCallback.createPrint(System.err);
		...
		// activation du Callback
		glfwSetErrorCallback(errorCallback);

Remarque : Un callback peut (et notamment doit pour ErrorCallback) être activé avant L'initialisation du mode
graphique. (ErrorCallback vous préviendra par exemple si vous avez oublié d'activer le mode graphique)...

Il existe d'autres callback tel que le KeyCallback (qui permet de savoir lorsque l'utilisateur appui sur une touche,
traité dans la section clavier-souris.)

**Destruction**

On peut libérer les Callback 1 par 1 (cas ErrorCallback plus bas)

.. code:: java

		keyCallback.free();
		keyCallback2.free();
		...

Ou on peut libérer tous les Callback associés à une fenêtre d'un coup

.. code:: java

		glfwFreeCallbacks(long window);

APRES avoir terminé/stoppé le mode graphique, on libère le Callback Error

.. code:: java

		glfwTerminate();
		glfwSetErrorCallback(null).free();
		// ou si vous avez utilisé un attribut
		glfwTerminate();
		errorCallback.free();
