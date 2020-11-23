/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char* strtoc(char *texte,int *capacite,int *marqueur,int *nombre);

int main(int argc, char * argv[]) {
	int capacite=10,taille=0,i,j;	/* capacite de base du tableau */
	char *texte=NULL,mot=NULL;	/* pointeur vers l'adresse du 1er élément */
	texte = (char*) malloc(capacite*sizeof(char));
	/* alocation tableau de 10 */

	printf("Entrez votre texte : ");
	for (i=0,j=0;;i++) {
		mot=strtoc(&taille);
	}

	/* libération de la mémoire */
	free(texte);
	free(mot);
	return EXIT_SUCCESS;
}

char* strtoc(int *taille) {
	int i,capacite=10;
	char *mot=NULL;
	mot = (char*) malloc(capacite*sizeof(char));
	
	for (i = 0;mot[i-1]!=' '&&i<50||i==0; ++i) {
		mot[i]=getchar();7
		/* si le 1er caractère est espace ou une suite d'espaces */
		if (mot[i]==' '&&i==0) {
			i--;
		}
		if (i+1>capacite) {
			capacite+=10;
			mot = (char*) realloc(mot,capacite*sizeof(char));
		}
	}
	*taille=i;
	/* renvoit le mot lu et sa taille <=50 */

	return mot;
}