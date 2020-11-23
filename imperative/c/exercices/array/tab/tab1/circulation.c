#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define CASES 10
#define RAND_MAX 100	/* 50 * 2 pour allez de -50 à 50 */
#define avancement 4

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
		for (i=0;i<CASES;i++) {
			if (CASES-avancement+i<CASES) {
				printf("|%5d",tableau[CASES-avancement+i]);	/* 10 - 4 -0 : on commence à la case 6 */
			} else {
				printf("|%5d",tableau[i-avancement]);	/* 4 - 4 : on commence à la case 0 */
			}
		}
	printf("|\n");
	printf("+");
	for (i=0;i<CASES;i++) {	/* dernière ligne */
		printf("-----+");
	}
	putchar('\n');

	return EXIT_SUCCESS;
}
