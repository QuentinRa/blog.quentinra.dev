================================================================
4. Processus - Signaux
================================================================

La communication entre processus se fait par signaux ou par tubes (canal entre deux processus).

Les signaux sont de la forme : Un code/action
(ex: quitter) exécute une fonction (ex: arrêter le programme).

Le signaux sont envoyés lorsqu'un combinaisons de touches est exécutée, par
exemple CTRL-C (mort) ou CTRL-Z (interruption).

Vous pouvez

	* signal : réécrire l'action faite si le signal est détecté
	* kill : simule le fait que le signal a été déclenché
	* pause : un processus dort et se réveille au premier signal reçu
	* sleep : pareil que pause mais se réveille tout seul après x ms

.. code:: c

		#include <signal.h>

		// réécrit la fonction d'un signal, prends l'adresse d'une fonction du type : void fonction(int);
		sig_t signal(int numero_signal, void (*handler)(int)) ;// retourne SIG_ERR soit (long) -1 si erreur

		// détruis un processus, pid=0=groupe, pid=-1=tous
		int kill(pid_t pid, int signal);

		// met le processus en pause et attends n'importe quel signal
		int pause(void);

		unsigned int sleep(unsigned int seconds);//pause durant x ms