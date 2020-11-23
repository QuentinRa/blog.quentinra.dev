#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned entier1,entier2;
	int i,compteur=0;

	printf("Entrez une valeur >= 0 :");
	scanf("%d",&entier1);

	do {
		printf("Entrez une valeur > 0 :");		/* > 0 */
		scanf("%d",&entier2);
	} while (entier2<=0);

	for(i=entier1;i>=0;i-=entier2) {		/* commence par entier, on lui retire entier2 et on compte */
		compteur++;					/* combien de fois on le fait -1 car a zéro tour (1er) compteur vaut 1 */
	}

	printf("--> %d = %d x %d + %d \n",entier1,compteur-1,entier2,i+entier2); /* i négatif c'est combien il a retiré alors */
											/* qu'il avait pas donc on lui rajoute l'entier pour avoir le reste */
	return EXIT_SUCCESS;
}
