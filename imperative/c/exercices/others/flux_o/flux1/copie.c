/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char * argv[]){

	FILE* file=NULL;
	int capacite=10,i,fin,indice=0;
	char *fichier=NULL;
	char option[2]="w";
	fichier = (char*) malloc(capacite*sizeof(char));

	/* Si on as pas 3 arguments (sans option) ou 4 (avec) */
	if (argc!=4 && argc!=3){
		/* option --help */
		if (argv[1]!=NULL && strcmp(argv[1],"--help")==0){
			fprintf(stderr, "Usage : %s [-a] <source> <dest>\n",argv[0]);
			fprintf(stderr, "Options:\n -a : put <source> at the end of <dest>\n");
			return EXIT_FAILURE;
		} else {
			fprintf(stderr, "Usage : %s [options] <source> <dest>\n--help for help.\n",argv[0]);
			return EXIT_FAILURE;
		}
	}

	/* S'il y a l'option, nombre d'arguments décallés de 1 */
	if (strcmp(argv[1],"-a")==0){
		indice=1;
		option[0]='a';
	}

	/* Ouverture : lecture */
	file = fopen(argv[1+indice],"r");
	if (!file){
		fprintf(stderr, "%s is not a file/doesn't exist.\n",argv[1+indice]);
		return EXIT_FAILURE;
	}

	/* Lecture */
	for (i = 0; !feof(file) ; i++){
		fread(fichier+i,sizeof(char),1,file);
		/* réallocation */
		if (i+2>capacite){
			capacite+=10;
			fichier = (char*) realloc(fichier,capacite*sizeof(char));
		}
	}
	fin = i;

	fclose(file);

	/* Si option a : on vérifie que le fichier existe */
	if (option[0]=='a'){
		file = fopen(argv[2+indice],"r");
		if (!file){
			fprintf(stderr, "%s is not a file/doesn't exist.\n",argv[2+indice]);
			return EXIT_FAILURE;
		}
		fclose(file);
	}

	/* ouverture du 2e : ecriture */
	file = fopen(argv[2+indice],option);
	if (!file){
		fprintf(stderr, "Unable to open %s in write mode.\n",argv[2+indice]);
		return EXIT_FAILURE;
	}

	for (i = 0; i<fin ; ++i){
		fwrite(fichier+i,sizeof(char),1,file);
	}

	return EXIT_SUCCESS;
}