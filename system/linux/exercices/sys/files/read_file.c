#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main(int argc, char * argv[]) {
	int fd,n;
	char buffer[256];

	if (argc!=2) {
		fprintf(stderr," Usage : %s nom_fichier\n",argv[0]);
		/* envoit l'erreur sur la sortie d'erreur */
		return EXIT_FAILURE;
	}

	fd=open(argv[1],O_RDONLY);

	while (n=read(fd,buffer,256)) {
		if(n==-1) {
			perror("read fails\n");
			/* affiche le message système d'erreur de l'appel système */
			return EXIT_FAILURE;
		}
		write(1,buffer,n);
	}
	close(fd);

	return EXIT_SUCCESS;
}