#include<stdio.h>
#include<stdlib.h>
#define repetition 5

int main(int argc, char * argv[]) {
	double reel;
	char caractere;
	int i;

	printf("Entrez un réel :");
	scanf("%lf",&reel);

	printf("%e\n",reel);	/* %e ou (%E) pour la notation scientifique */

	getchar();	
	/* on doit récupérer le retour chariot illisible pour le %c */

	printf("Entrez un caractere :");
	scanf("%c",&caractere);

	for(i=0;i<repetition;i++) {
		printf("%c ",caractere);
	}
	putchar('\n');

	return EXIT_SUCCESS;
}