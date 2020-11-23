#include<stdio.h>
#include<stdlib.h>
#include<math.h> /* gcc -lm */
#define M_PI 3.141592653589793238462643383279502884
#define M_2PI (2*3.141592653589793238462643383279502884)

int main(void) {
	double a=M_PI,b=M_2PI;

	printf("%lf\n",a);
	long long int *p = (long long int *) &a;
	printf("%lldLL\n",*p);

	/* 4614256656552045848LL soit n = pi */

	printf("%lf\n",b);
	long long int *q = (long long int *) &b;
	printf("%lldLL\n",*q);

	/* 4618760256179416344LL soit n = 2pi */

  return EXIT_SUCCESS;
}