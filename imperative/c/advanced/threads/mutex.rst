================================================================
5. Threads et concurrence - Accès simultanés
================================================================

Il se peut que des Threads essayent de modifier la même variable en même temps,
ce qui résulte en une variable ayant une valeur incorrecte.

Dans ce cas, on utilise un mutex : il s'agit d'une variable
que l'on va verrouiller dans un thread avant d'exécuter du code (ex: changement de variable). Dans les
autres thread, ils vont aussi essayer de verrouiller le mutex pour exécuter
un bout de code cependant tant que le mutex n'est pas libéré, alors ils devront attendre.
Lorsque le mutex est libéré, un thread au hasard peut le verrouiller parmi ceux qui attendaient.

.. code:: c

		// Création d'un mutex, une pour tous les threads
		pthread_mutex_t mutex_var = PTHREAD_MUTEX_INITIALIZER;

		// ce thread verrouille le mutex, ou attends que le mutex soit libéré
		int pthread_mutex_lock(pthread_mutex_t *mutex);

		//entre le verrouillage et le déverrouillage, on écris le code

		//ce thread libère le mutex
		int pthread_mutex_unlock(pthread_mutex_t *mutex);

Par exemple :

.. code:: c

	pthread_mutex_t mutex_var = PTHREAD_MUTEX_INITIALIZER;

	int variable_globale = 5;

	void *fonction_thread(void *args){
	 // on essaye de lock le mutex
	 pthread_mutex_lock(&mutex_var);
	 // seulement la personne qui a réussi à verrouillé le mutex peut modifier
	 // cette variable donc pas de problème
	 variable_globale++;
	 // on déverrouille pour que le prochain thread puisse modifier la variable
	 pthread_mutex_unlock(&mutex_var);
	}


