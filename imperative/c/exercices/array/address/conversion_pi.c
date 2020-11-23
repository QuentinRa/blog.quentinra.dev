#include<stdio.h>
#include<stdlib.h>

int main(void) {
	long long int n = 4614256656552045848LL;	/* On assigne n a une certaine valeur qui vaut pi */
	double *p = (double*) &n;					/* On convertit l'adresse de n vers un pointeur p ("p",&n,double,&p) */
	printf("π = %f\n",*p);	/* On lit la valeur contenu a l'adresse pointée par p soit &n donc π = 4614256656552045848LL ) */



	long long int m = 4618760256179416344LL; /* On assigne n a une certaine valeur a priori deux pi */
	double *q = (double*) &m;
	printf("2π = %f\n",*q);


  return EXIT_SUCCESS;
}