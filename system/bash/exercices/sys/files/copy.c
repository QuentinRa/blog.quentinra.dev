#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main(int argc, char * argv[]) {
	int fr,fw,n;
	char buffer[256];

	if (argc!=3) {
		fprintf(stderr,"Usage : %s <nom_fichier_source> <nom_fichier_destination>\n",argv[0]);
		/* envoit l'erreur sur la sortie d'erreur */
		return EXIT_FAILURE;
	}

	fr=open(argv[1],O_RDONLY);
	if (fr==-1) {
		perror("open read mode fails\n");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	}
	
	fw=open(argv[2],O_WRONLY|O_CREAT|O_TRUNC,0600);
	/* si create, on fait obligatoirement les permissions (0)600 pour rw pour moi */
	/* creat pour créer et trunc pour couper (remettre a taille zéro) si déja crée */
    if (fw==-1) {
    	perror("open write mode fails\n");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
    }

	while (n=read(fr,buffer,256)) {
		if(n==-1) {
			perror("read fails\n");
			/* affiche le message système d'erreur de l'appel système */
			return EXIT_FAILURE;
		}
		write(fw,buffer,n);
	}
	close(fr);
	close(fw);

	return EXIT_SUCCESS;
}