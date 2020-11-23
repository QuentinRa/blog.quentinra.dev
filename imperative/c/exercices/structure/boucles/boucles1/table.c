#include<stdio.h>
#include<stdlib.h>
#define quotientmax 10

int main(int argc, char * argv[]) {
	int entier1,quotient;

	printf("entrez un entier :");
	scanf("%d",&entier1);

	for (quotient=1;quotient<=quotientmax;quotient++) {	/* entier x quotient [1,10] */
		printf("%3d x%3d = %4d \n",entier1,quotient,entier1*quotient);
	}

	return EXIT_SUCCESS;
}
