===========================================================================
8. Flux et Fichiers - Manipulation de flux via appels système linux
===========================================================================

La logique est que l'on va représenter un fichier par un descripteur (un entier). Lorsque
le fichier est ouvert, le système garde toutes les informations à un endroit, et si vous
voulez lire/écrire ou faire n'importe quel action sur le fichier, alors vous
donner le descripteur aux fonctions et elles travaillerons sur le fichier en question.

Appel système
	Il s'agit d'une fonction du système qui sont les instructions les plus basiques
	que sait exécuter le système. On compte read, write, fork, exit, kill, ...

Il existe trois flux pré-ouverts pour vous et que vous n'avez pas a fermer

	*	stdin (descripteur 0) : saisie à la console
	*	stdout (descripteur 1) : écriture à la console
	*	stderr (descripteur 2) : écriture à la console d'erreur

Explications des mots de lecture/écriture
	Il existe 2 modes d'ouverture : O_RDONLY (lecture uniquement),
	O_WRONLY (écriture uniquement, vide le fichier).

	Lorsque vous ouvrez un fichier en O_WRONLY, vous pouvez le vider avec
	O_TRUNC et devez spécifier les permissions.

	Vous pouvez créer le fichier s'il n'existe pas avec O_CREAT.

	Pour utilisez plusieurs options, vous les séparez pas un pipe (\|) : O_WRONLY\|O_TRUNC\|O_CREAT par exemple.

On dispose des fonctions

	* open : ouvrir un fichier
	* read : lire
	* write : écrire
	* close : fermer le fichier
	* lseek : se déplacer dans le fichier
	* perror : lorsqu'un appel système rate, perror contient des informations sur l'erreur
	* fstat/stat : retourne des informations sur le fichier

.. code:: c

		#include<fcntl.h>
		#include<unistd.h>

		int main(void){
		 // Arguments
		 // testez la taille de argc
		 // si pas bon, affichez une erreur sur stderr puis exit(1)

		 // Ouverture d'un fichier
		 int descripteur;

		 // modes : O_RDONLY, O_WRONLY, O_CREAT, O_TRUNC, perms(0600)
		 // ex: open("path", O_RDONLY) ou open("path", O_WRONLY|O_CREAT|O_TRUNC, 0600)

		 descripteur = open(path, mode);
		 if(descripteur == -1) perror("message"); exit(2);

		 // Lecture
		 // Vérifier le retour -> perror si retour==-1
		 int lu = read(descripteur, ou_mettre_la_lecture, combien_lire);

		 // Écriture
		 // Vérifier le retour -> perror si retour==-1
		 // Si retour ==0 alors on est a la fin
		 // note : le fichier est ouvert en lecture donc cette ligne ne marche pas dans ce cas
		 int ecrit = write(descripteur,quoi,combien);

		 // Déplacement
		 // depuis : SEEK_CUR, SEEK_SET, SEEK_END
		 //Vérifier le retour -> perror si retour==-1
		 off_t pos = lseek(quoi,(off_t) combien,depuis);

		 // Fermeture
		 close(fr);
		}

Note sur perror
	Il existe une variable ERRNO qui contient une code.

	Si un appel système rate (par exemple write) alors write va mettre dans
	ERRNO le code d'erreur.

	Il existe un fichier dans lequel il y a toutes les correspondances code vers message, donc
	pour chaque code, il y a un message d'erreur.

	perror(message) va lire le code, trouver le message associé et afficher dans la sortie d'erreur :
	message de l'erreur: message.