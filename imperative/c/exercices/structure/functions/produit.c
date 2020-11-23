/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char * argv[]) {
	int i,x,produit=1;
	char *endptr;
	if (argc<2) {
		printf("0\n");
		return EXIT_SUCCESS;
	}

	for (i=0;i<argc-1;i++) {
		x = (int) strtol(argv[i+1],&endptr,10);
		if (*endptr!=0)	{
			x=1;
		}

		produit*=x;
	}
	printf("produit = %d\n",produit);

	return EXIT_SUCCESS;
}