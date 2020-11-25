/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int i;

	if (argc<2) {
		printf("%s <arguments>*\n",argv[0]);
	}

	for (i=0;i<argc-1;i++) {
		printf("%c\n",*argv[i+1]);
	}

	return EXIT_SUCCESS;
}