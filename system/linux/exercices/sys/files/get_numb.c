#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main(int argc, char * argv[]) {
	int n,fr,x;
	long int i,offset;
	off_t l;	/* type de lseek */

	if (argc!=3) {
		fprintf(stderr,"Usage : %s <file_name> <offset>\n",argv[0]);
		return EXIT_FAILURE;
	}

	/* ouverture du fichier */
		fr = open(argv[1],O_RDONLY);
		if (fr==-1) {
			perror("open read mode fails");
			/* affiche le message système d'erreur de l'appel système */
			return EXIT_FAILURE;
		}

	i = strtol(argv[2],NULL,10);
	offset=i*sizeof(int);	/* lseek se déplace octect par octect et i=32 octect si je met 2 je veut en réalité 2*32*/

	/* déplace le curseur */
		l=lseek(fr,(off_t) offset,SEEK_SET);
		if(l==-1) {
			perror("lseek fails");
			/* affiche le message système d'erreur de l'appel système */
			return EXIT_FAILURE;
		}

	/*printf("%ld\n",l);*/

	n=read(fr,&x,sizeof(int));
	if(n==-1) {
		perror("read in file fails");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	}

	if(n==0) {
		printf("Offset is out of range!\n");
	} else {
		printf("The number at offset %ld is 0x%08x --> %d\n",i,x,x);
	}
	/* on remplit avec des 0 avec %0x et %8x pour 8 chiffres */
	/*printf("n=%d\n",n);*/

	close(fr);

	return EXIT_SUCCESS;
}