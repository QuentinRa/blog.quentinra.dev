#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int entier1,entier2;

	printf("Entrez un premier entier :\n");
	scanf("%d",&entier1);
	printf("Entrez un second entier :\n");
	scanf("%d",&entier2);

	if (entier1>entier2) {			/* si entier1 est le plus grand : on le garde */
	} else {
		entier1=entier2;		/* sinon la valeur d'entier2 devient entier1 et le plus grand */
	}

	printf("Entrez un troisième entier :\n");
	scanf("%d",&entier2);

	if (entier1>entier2) {		/* si l'ancien plus grand toujours le plus grand : maximum */
		printf("%d est la maximum.\n",entier1);
	} else {					/* sinon c'est l'autre */
		entier1=entier2;
		printf("%d est la maximum.\n",entier1);
	}



	return EXIT_SUCCESS;
}