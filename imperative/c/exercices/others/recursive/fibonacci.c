/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int fibonacci(int n){
	if (n>2){
		return fibonacci(n-2)+fibonacci(n-1);
	} else {
		return 1;
	}
}

int main(int argc, char * argv[]) {

	int e1;
	printf("neme? ");
	scanf("%d",&e1);
	fprintf(stdout,"%d\n",fibonacci(e1));

	return EXIT_SUCCESS;
}