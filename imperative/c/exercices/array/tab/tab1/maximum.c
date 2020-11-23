#include<stdio.h>
#include<stdlib.h>
#define CASES 10
#define RAND_MAX 100	/* 50 * 2 pour allez de -50 à 50 */

int main(int argc, char * argv[]) {
	int tableau[CASES],random,i,maximum=0,indice=0;
	srand(time(NULL));

	for (i=0;i<CASES;i++) {
		random = rand()%RAND_MAX+1-50;	/* rand_max+1 pour allez de [0,100] 100 compris 
	et moins 50 pour avoir que des valeurs entre -50 et 50. */
		tableau[i]=random;
	}

	for (i=0;i<CASES;i++) {
		if (tableau[i]>maximum) {
			maximum=tableau[i];
			indice=i+1;			/* car t[0] corresponds à notre 1ère case */
		}
	}

	for (i=0;i<indice*2-1;i++) {	/* affiche 3 espace par 3 espace, 6 correpondent à 1 case (1 indice)
	mais on veut pas la barre à la fin de notre case mais au milieu donc on lui retire un demi-indice */
		printf("   ");
	}
	printf("|\n");
	for (i=0;i<indice*2-1;i++) { 	/* affiche 3 espace par 3 espace, 6 correpondent à 1 case (1 indice)
	mais on veut pas la barre à la fin de notre case mais au milieu donc on lui retire un demi-indice */
		printf("   ");
	}
	printf("V\n");

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

	return EXIT_SUCCESS;
}