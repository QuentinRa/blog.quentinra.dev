#include<stdio.h>
#include<stdlib.h>
#include<math.h> /* gcc -lm */
#ifndef M_PI
#define M_PI 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679 
#endif 

int main(int argc, char * argv[]) {
	double calcul1,calcul2,calcul3,calcul4,calcul5,calcul6;

	calcul1=sqrt(fabs(log(0.5)));
	calcul2=sin(M_PI/6);
	calcul3=atan(pow(13,2));
	calcul4=exp(pow(-1,4));
	/*calcul5=log(-3);
	log NE PEUT PAS prendre une valeur négative donc nan (ce n'est pas un nombre) */
	calcul6=pow(sqrt(2),2);

	printf("%lf\n",calcul1);	/* 0.832555	*/
	printf("%lf\n",calcul2);	/* 0.500000 */
	printf("%lf\n",calcul3);	/* 1.564879 */
	printf("%lf\n",calcul4);	/* 2.718282 */
	printf("%lf\n",calcul5);	/*    nan   */
	printf("%lf\n",calcul6);	/* 2.000000 */

	return EXIT_SUCCESS;
}
