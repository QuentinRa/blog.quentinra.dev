/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char * argv[]) {
	
	int i,j;
	FILE *fichier=NULL;

	if (argc!=2){
		fprintf(stderr, "Usage : %s <nom/chemin>\n",argv[0]);
		return EXIT_FAILURE;
	}

	fichier = fopen(argv[1],"r");
	if (!fichier){
		fprintf(stdout,"Unable to open %s in read mode.\n",argv[1]);
		return EXIT_FAILURE;
	}

	for (i = 0; argv[1][i]!=' '&& argv[1][i]!='\n'; i++){
		if(argv[1][i]=='.'){
			int capacite=4;
			char *buf=NULL;
			buf = (char*) malloc(capacite*sizeof(char));
			for (j = 0; argv[1][i]!=' ' && argv[1][i]!='\n' ; j++,i++){
				buf[j]=argv[1][i];
				if(j+1>capacite){
					capacite+=4;
					buf = (char*) realloc(buf,capacite*sizeof(char));
				}
			}
			buf[j]='\0';
			if(strcmp(buf,".tar")!=0){
				fprintf(stderr, "%s is not a .tar file\n",argv[1]);
				return EXIT_FAILURE;
			}
		}
	}

	char buf[100];/* le nom fait max 100 caractère (99+'\0') */
	long x;
	int c=0;

	while(!feof(fichier)&&c<10){
		/* Récupération du nom */
		fgets(buf,100,fichier);
		fprintf(stdout,"name :%s\n",buf);
		/* deplacement -> taille */
		fseek(fichier,1UL+24UL,SEEK_CUR);

		/* récupération taille */
		fgets(buf,12,fichier);
		/* conversion */
		x = strtol(buf,NULL,10);
		/* deplacement fin de l'en-tête */
		fseek(fichier,500UL-135UL,SEEK_CUR);
		/* déplacement au prochain nom (<=> taille fichier) */
		fseek(fichier,x*sizeof(char)/8,SEEK_CUR);
		c++;
	}

	fclose(fichier);

	return EXIT_SUCCESS;
}