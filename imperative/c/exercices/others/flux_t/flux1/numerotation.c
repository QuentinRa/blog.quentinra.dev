/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include "../colors.h"

int main(int argc, char * argv[]) {

	int i,j=0,capacite=256;
	char *texte=NULL;
	FILE *file=NULL;
	texte = (char*) malloc(capacite*sizeof(char));

	if (argc!=2){
		fprintf(stderr, "Usage : %s <chemin/nom>\n",argv[0]);
		return EXIT_FAILURE;
	}

	file = fopen(argv[1],"r");
	if (!file){
		fprintf(stderr,"Unable to open %s in read mode.\n",argv[1]);
		return EXIT_FAILURE;
	}

	for(i=0;!feof(file);i++){
		fgets(texte,capacite,file);
		do {
			while(texte[j]!='\n'&&texte[j]!='\0'){
				j++;
			}
			/* Si on n'avait pas fini la ligne */
			if(texte[j]!='\n'){
				capacite+=256;
				texte = (char*) realloc(texte,capacite*sizeof(char));
				fgets(texte+j-1,capacite,file);
			}
		}while(texte[j]!='\n');
		fprintf(stdout,ANSI_COLOR_BRED"%2d. "ANSI_COLOR_RESET,i+1);
		fprintf(stdout,"%s",texte);
	}
	putchar('\n');

	fclose(file);
	free(texte);

	return EXIT_SUCCESS;
}