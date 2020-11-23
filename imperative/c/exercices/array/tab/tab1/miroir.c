#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define CASES 10
#define RAND_MAX 100	/* 50 * 2 pour allez de -50 à 50 */

int main(int argc, char * argv[]) {
	int tableau[CASES],random,i;
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

	printf("+");
	for (i=0;i<CASES;i++) {	/* 1ere ligne du tableau */
		printf("-----+");
	}
	putchar('\n');
	for (i=CASES-1;i>=0;i--) {	/* on commence à case-1 car dans un tableau [0,x] les cases vont jusqu'à x-1 */
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
