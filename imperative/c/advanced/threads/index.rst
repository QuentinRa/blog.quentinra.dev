================================================================
5. Threads et concurrence - Threads
================================================================

On utilise

	*
		pthread_create pour créer un thread, en lui donnant un identifiant (pthread_t),
		un environnement (ou NULL si aucun), une fonction a exécuter et des arguments (un seul mais qui peut
		être de n'importe quel type).

	* pthread_join prends un id de thread et bloque le processus principal tant que le thread n'est pas terminé

	* pthread_exit met fin au code d'un thread et retourne un code de retour reçu par pthread_join


.. code:: c

		#include <pthread.h> # -lpthread à la compilation

		//Création d'un thread
		int pthread_create(pthread_t *thread, const pthread_attr_t *envr, void* (*fonction) (void*), void* args);

		//envoyer un code de retour à la fin de l'éxécution
		void pthread_exit(void *code_retour);

		//processus attends la fin d'exécution d'un thread
		int pthread_join(pthread_t thread, void **code_retour);

Exemple de code

.. code:: c

		void *fonction(void *args);

		int main(void){
		 pthread_t mon_thread; //futur thread
		 int args = 5;
		 //création du thread
		 pthread_create(mon_thread, NULL, fonction,(void*) &args);
		 //attends la fin de l'exécution de la fonction
		 pthread_join(mon_thread, NULL);
		 return EXIT_SUCCESS;
		}

		void *fonction(void *args){
		 int fonction_args = *((int*) args);
		 //fonction_args contient 5
		 printf("%d", fonction_args);
		 pthread_exit(NULL);//code de retour
		}