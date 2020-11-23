================================================================
4. Processus - Tubes
================================================================

La communication entre processus se fait par signaux ou par
tubes (canal entre deux processus).

Il existe deux types de tubes, les tubes nommés (mkfifo) sont des fichiers (spéciaux)
donc on peut utiliser pas mal des fonctions sur les fichiers. Alternativement,
il y a les tubes non nommés avec pipe.

.. code:: c

		// Création, tab[0] = "fichier" lecture, tab[1] = "fichier" écriture
		// le père écris le fils lit et inversement en passant tab[0]/tab[1] à read/write
		int pipe(int tab[2]);//  Fermer avec close lecture/écriture si non utilisé

		// un tube nommé est un fichier qui reste après la fin du programme
		// il faut le créer avec la commande mkfifo s'il existe pas.
		int mkfifo(const char* nom, mode_t modeOuverture);

Exemple de code

.. code:: c

		int main(void){
		 int tab[2];

		 //pipe va mettre les descripteurs 0 = lecture dans tab[0] et 1 = écriture dans tab[1]
		 pipe(tab);

		 //exemple écriture dans le pipe
		 write(tab[1], "Hello World", 11+1); // le \0 à la fin

		 //exemple de lecture dans le pipe
		 char buf[25];
		 read(tab[0], &buf, 25-1); // le \0 à la fin

		 close(tab[1]);
		 close(tab[0]);
		}