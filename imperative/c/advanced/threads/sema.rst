================================================================
5. Threads et concurrence - Sémaphores
================================================================

Il est possible que les ressource soit limités, par exemple pour limiter
le nombre de requêtes simultanées à un serveur. On peut créer ce que l'on appelle des Sémaphores.

Il s'agit de sorte de stock contenant le nombre max de ressources disponibles,
qui est diminué de 1 lors que des ressources sont empruntés et augmenté de 1 lors que des ressources
sont rendues.

.. code:: c

		//init une sémaphore
		int sem_init(&semaphore, 0 /*tous threads*/, taille);

		//attends qu'une ressource ce libère, puis prends la ressource
		int sem_wait(sem_t *sem);

		//libère une ressource
		int sem_post(sem_t *sem);

Une méthode alternative serait d'utiliser les conditions, c'est-à-dire empêcher
quelqu'un de faire quelque chose tant qu'une condition n'est pas vraie.

.. code:: c

		pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
		pthread_cond_t cond;
		//mutex
		pthread_mutex_lock(&mutex);
		//attends, déverrouille automatique le mutex et le re-vérouille
		//lors que la condition est true
		while(condition) pthread_cond_wait(&cond, &mutex);
		//code
		//réveil de tous ceux qui attendent cette condition
		pthread_cond_broadcast(&cond);
		//deverrouillage du mutex
		pthread_mutex_unlock(&mutex);