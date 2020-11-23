#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int i,j,hauteur;	/* i pour les lignes et j pour les colonnes */
	printf("hauteur?");
	scanf("%d",&hauteur);

	for (i=0;i<hauteur;i++) {
		for (j=0;j<hauteur-1-i;j++) {
			printf(" ");
		}
		for (;j<hauteur+i;j++) {
			printf("*");
		}
		putchar('\n');
	}

	return EXIT_SUCCESS;
}