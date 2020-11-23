/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int stop=0;
	double rayon=0.0,distance,k=0.0,i,j;
	printf("Rayon? ");
	scanf("%lf",&rayon);

	for (i=0.0;i<rayon*2-1;i++) {
		for (j=0.0;j<rayon*2-1;j++) {
		distance=((rayon-1.0)-j)*((rayon-1.0)-j)+((rayon-1.0)-i)*((rayon-1.0)-i);
		stop=0;
		k=0.0;
		while(stop==0) {
			if (k*k>=distance){
				stop=1;
			}
			k+=0.01;
		}
		distance=k;
			if (distance<rayon)
				printf(" *");
			else
				printf("  ");
		}
		printf("\n");
	}

	return EXIT_SUCCESS;
}