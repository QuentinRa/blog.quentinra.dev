#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define RAND_MAX 100
#define tentative_max 5

int main(int argc, char * argv[]) {
	int tentative=0,entier1,random,indice;
	srand(time(NULL));		/* chaque fois un random différent */
	random= rand() % RAND_MAX + 1;		/* nombre [0,100[ + 1 : [0,100] */

	do {
		printf("Devinez la valeur choisi [0,100] :");
		scanf("%d",&entier1);
		tentative++;
		if (entier1==random) {
			printf("Vous avez trouvé, le nombre était bien %d.\n",random);
			return EXIT_SUCCESS;
		} 
		if (entier1>random) {
			printf("-\n");
		} else {
			printf("+\n");
		}
		
	} while (tentative<tentative_max);

	printf("Le nombre était %d...\n",random);

	return EXIT_SUCCESS;
}