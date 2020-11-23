================================================================
4. Processus - Processus
================================================================

Un processus crée un autre processus en se dupliquant, cela se fait
avec :code:`fork`. Fork va crée un copie du code et continuer son exécution
dans le père et dans le fils. Elle retourne 0 dans le fils et le pid
du fils dans le père.

Le père peut attendre un processus fils avec la fonction wait (attendre
n'importe quel fils mais 1 seul), ou wait_pid (attends un/plusieurs processus particuliers).

.. code:: c

		#include<sys/types.h>
		#include<sys/wait.h>
		#include<unistd.h>

		//création d'un processus
		pid_t fork(void); //retourne 0 dans le fils, !0 dans le père

		//récupération du numéro de processus, 1 si le père est mort
		pid_t getpid();
		pid_t getppid();

		//attendre un processus, status contiendra au reveil l'action qui l'a réveillé
		//voir WIF_EXITED retourne true si exit, WEXITSTATUS retourne le code d'exit. etc...
		int wait(int *status) ;//retourne le processus qui l'a réveillé
		//attends un processus, pid=0=fils, pid=-1=groupe
		int waitpid(int pid, int *status, int options);

Exemple de code

.. code:: c

		#include<sys/types.h>
		#include<sys/wait.h>
		#include<unistd.h>

		int main(void){
		 if(fork() = 0){
		  print("1. On est dans le fils\n");
		 } else {
		  wait(NULL); // on attends que le fils affiche ses messages
		  printf("2. On est dans le père\n"); // on continue le code du père
		 }
		 printf("mon pid est %d\n",  getpid()); // cette ligne est affichée dans le fils et le père
		 return 0
		}

Le résultat est

.. code:: none

		1. On est dans le fils <CR>
		mon pid est 27892 <CR>
		2. On est dans le père <CR>
		mon pid est 27891 <CR>
