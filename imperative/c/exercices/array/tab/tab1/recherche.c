#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define CASES 10
#define RAND_MAX 100	/* 50 * 2 pour allez de -50 à 50 */

int main(int argc, char * argv[]) {
	int tableau[CASES],random,i,entier1,resultat=-1,indice;
	srand(time(NULL));

	for (i=0;i<CASES;i++) {
		random = rand()%RAND_MAX+1-50;	/* rand_max+1 pour allez de [0,100] 100 compris 
	et moins 50 pour avoir que des valeurs entre -50 et 50. */
		tableau[i]=random;
	}

	printf("+");
	for (i=0;i<CASES;i++) {	/* 1ere ligne du tableau */
		printf("-----+");
	}
	putchar('\n');
	for (i=0;i<CASES;i++) {
		printf("|%5d",tableau[i]);	/* remplissage */
	}
	printf("|\n");
	printf("+");
	for (i=0;i<CASES;i++) {	/* dernière ligne */
		printf("-----+");
	}
	putchar('\n');

	do {
		printf("Entrez une valeur [-50,50] :");
		scanf("%d",&entier1);
	} while ((entier1>50)||(entier1<-50));

	for (i=0;i<CASES;i++) {
		if (entier1==tableau[i]) {
			resultat=0;
			indice=i;
			break;	/* on sort pour le PLUS PETIT indice */
		}
	}
	if (resultat==0) {
		printf("Le plus petit indice pour lequel on peut trouver la valeur est %d.\n",indice+1);
		/* car t[0] corresponds à notre 1ère case */
	} else {
		printf("-1 (la valeur ne s'y trouve pas).\n");
	}

	return EXIT_SUCCESS;
}
