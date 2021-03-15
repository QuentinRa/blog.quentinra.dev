=========
Fenêtre
=========

La méthode :code:`glfwWindowShouldClose(long window);`
retourne un boolean qui indique si la fenêtre doit être fermée. On peut par exemple créer une boucle while,
qui tourne tant que l'on ne doit pas fermer la fenêtre :

.. code:: java

		while(glfwWindowShouldClose(window)){
		 // code
		 // récupération des événements
		 glfwSwapBuffers(window); //voir contexte, échange front buffer et back buffer
		 glfwPollEvents();
		}

La valeur lue par glfwWindowShouldClose peut être changé si l'utilisateur clique sur le bouton pour fermer
par exemple ou par le programmeur (l'utilisateur appuie sur échap par exemple) avec la méthode

.. code:: java

	glfwSetWindowShouldClose(long window,boolean value));