=========================
Création d'une fenêtre
=========================

On peut maintenant créer des fenêtres :

.. code:: java

	long window = glfwCreateWindow(int width, int height, java.lang.CharSequence title, long monitor, long share);

On lui donne la largeur, la hauteur, le titre, en passant monitor à 0/NULL (=fenêtré) (ou cf Plein écran)
et shade a 0 ou NULL. Elle renvoi un long qui correspond à la fenêtre ou 0/NULL en cas d'erreur.

.. code:: java

		long window = glfwCreateWindow(100,100,"title",0,0);
		if(window == NULL){
		 throw new RuntimeException("échec de la création d'une fenêtre");
		}

On peux placer notre fenêtre avec la méthode :code:`glfwSetWindowPos(long window,int xpos, int ypos);`
en lui donnant notre fenêtre et les cordonnées x,y du point haut-gauche de notre fenêtre. Pour centrer,
la fenêtre, on doit récupérer la taille de l'écran

.. code:: java

	GLFWVidMode vidMode = glfwGetVideoMode(glfwGetPrimaryMonitor());

Puis il ne reste plus qu'à utiliser les méthodes vidMode.height et vidMode.width.

On détruira une fenêtre avec la méthode :

.. code:: java

	glfwDestroyWindow(long window);

ou lorsque l'on quitte l'interface graphique, elle sera automatiquement détruite.

Plein écran
------------------

La méthode :code:`glfwGetPrimaryMonitor();` permet de récupérer la taille de l'écran (monitor) actuel.

On peux choisir de créer une fenêtre en mode plein écran avec

.. code:: java

	long window = glfwCreateWindow(int width, int height, java.lang.CharSequence title,glfwGetPrimaryMonitor(),long share);

Quelques méthodes utiles
----------------------------

Changer le titre de notre fenêtre

.. code:: java

		glfwSetWindowTitle(long window,java.nio.ByteBuffer title);

Changer l'icône de notre fenêtre :

.. code:: java

	glfwSetWindowIcon(long window,GLFWImage.Buffer images)

GLFWImage.Buffer images représente une image 32bits, little-endian,r(8bits)g(8bits)b(8bits)a(8bits).
Si la valeur NULL/0 est passée à la place de GLFWImage.Buffer images , la fenêtre reprends son icône de base.

Changer la taille de notre fenêtre

.. code:: java

	glfwSetWindowSize(long window,int width,int height);

Pour changer de nombres valeurs en une fois

.. code:: java

	glfwSetWindowMonitor(long window,long monitor,int xpos,int ypos,int width,int height,int refreshRate);

Les valeurs xpos,ypos sont ignorés en mode plein écran. Lorsqu'une fenêtre passe du mode plein écran à fenêtré,
tous les paramètres sont réinitialisés.(resizable, size, ratio limits...)

refreshRate correspond au nombre de Hz pour le rafraichissement. GLFW_DONT_CARE si vous ne voulez pas y toucher.

Paramètres des fenêtres/Contextes (Hint)
------------------------------------------------

On peut avant la création d'une fenêtre, déclarer des Hint qui seront appliqués A LA PROCHAINE fenêtre crée :

.. code:: java

	glfwWindowHint(int hint, int value);

Avant la première instruction :code:`glfwWindowHint()`, on appellera la méthode :

.. code:: java

	glfwDefaultWindowHints();

pour remettre par défault les Hint possiblement modifiées avant.
(même si on crée qu'une seule fenêtre, mieux vaut prévenir que guérir...)

On donneras un Hint (liste non exhaustive) et une valeur : GLFW_FALSE (pour désactiver)
ou GLFW_TRUE (pour activer) ... Plus d'infos
https://javadoc.lwjgl.org/org/lwjgl/glfw/GLFW.html#glfwWindowHint(int,int)

================= =========================================================================== ======================
Hints             Signification                                                                      Activation
================= =========================================================================== ======================
GLFW_RESIZABLE    Permet à l'utilisateur de redimensionner la fenêtre                                TRUE/FALSE
GLFW_VISIBLE      Permet de cacher la fenêtre/afficher. On utilisera                                 TRUE/FALSE
\                 :code:`glfwShowWindow(long window)` pour afficher la                               \
\                 fenêtre après sa création ou insersement glfwHideWindow(long window).              \
GLFW_DECORATED    Spécifie si la fenêtre doit avoir une bordure avec bouton fermer...                TRUE/FALSE
GLFW_MAXIMIZED    Si la fenêtre doit prends la taille maximale lors de sa création ou non            TRUE/FALSE
GLFW_REFRESH_RATE Taux de rafraichissement en Hz (Hertz)                                             Integer ou DONT_CARE
CENTER_CURSOR     Centre le curseur dans la fenêtre à sa création                                    TRUE/FALSE
================= =========================================================================== ======================

La méthode :code:`glfwDefaultWindowHints();`
permet de reinitialise tous les hint à leur valeur de départ (défaut).

