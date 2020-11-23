================================================================
4. Processus - Recouvrement
================================================================

Lancer un autre programme dans un processus s'appelle le recouvrement.
Par exemple vous pouvez créer un processus puis le recouvrir avec
un script bash, donc le processus va exécuter le code bash.

.. warning::

	N'oubliez pas que le premier argument d'une commande est elle même.
	(le premier argument de `ls` et ls lui même).

.. code:: c

		//ref est le chemin de l'exécutable (./a.out)
		// Lorsque les arguments sont une liste, on met NULL à la fin pour indiquer que c'est fini

		int execl(const char* ref, const char * args, ..., NULL) ;
		int execlp(const char* ref, const char * args, ..., NULL) ;
		// on passe un environnement modifié
		int execle(const char* ref, const char * args, ..., NULL, char* const envp[]);
		int execv(const char* ref, const char * argv[]);

Exemple de code

.. code:: c

		int main(void){
		 execl("/bin/ls", "ls", "-la", ".", NULL);
		 perror("exec failed"); // ces lignes ne seront jamais exécutées
		 return -1;
		}