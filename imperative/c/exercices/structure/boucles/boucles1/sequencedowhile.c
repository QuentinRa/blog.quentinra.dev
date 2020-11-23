#include<stdio.h>
#include<stdlib.h>
/*Version do ... while */

int main(int argc, char * argv[]) {
	int entier1,entier2,min,max;

	printf("Entrez un premier entier :\n");
	scanf("%d",&entier1);
	printf("Entrez un second entier :\n");
	scanf("%d",&entier2);
	putchar('\n');

	min=entier1>entier2?entier2:entier1;	/*si entier1 le + grand alors min= entier2 sinon min= entier1 */
	max=entier1>entier2?entier1:entier2;	/*si entier1 le + grand alors max= entier1 sinon min= entier2 */

	do {					/* SENS LARGE donc j'affiche min puis min+1, min +2... */
		printf("%d\n",min);
		min++;
	} while (min<=max);		/* SENS LARGE, jusqu'à ce que min soit EGAL a max */

	return EXIT_SUCCESS;
}