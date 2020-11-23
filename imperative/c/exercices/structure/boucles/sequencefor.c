#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int entier1,entier2,min,max;

	printf("Entrez un premier entier :\n");
	scanf("%d",&entier1);
	printf("Entrez un second entier :\n");
	scanf("%d",&entier2);
	putchar('\n');

	min=entier1>entier2?entier2:entier1;	/*si entier1 le + grand alors min= entier2 sinon min= entier1 */
	max=entier1>entier2?entier1:entier2;	/*si entier1 le + grand alors max= entier1 sinon min= entier2 */

	for (;min<=max;min++) {		/*on commence à min (SENS LARGE) jusqu'à <= (SENS LARGE) */
		printf("%d\n",min);
	}

	return EXIT_SUCCESS;
}