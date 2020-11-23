/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include "time.h"

void tableau(double *tab,int capacite){
	if (capacite!=1){
		fprintf(stdout,"%.2f, ",tab[0]);
		tableau(tab+1,capacite-1);
	} else {
		fprintf(stdout,"%.2f\n",tab[0]);
	}
}

int main(int argc, char * argv[]) {

	double tab[]={1.25,47.80, 77.01, 54.23, 895.14};
	
	tableau(tab,5);

	return EXIT_SUCCESS;
}