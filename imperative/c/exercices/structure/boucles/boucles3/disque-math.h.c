/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char * argv[]) {
	double rayon=0,distance,i,j;
	printf("Rayon? ");
	scanf("%lf",&rayon);

	for (i=0;i<rayon*2-1;i++) {
		for (j=0;j<rayon*2-1;j++) {
		distance=sqrt(pow(((rayon-1)-j),2)+pow(((rayon-1)-i),2));
		/* notre point (j,i) et le centre (rayon-1,rayon-1) */
			if (distance<rayon)
				printf(" *");
			else
				printf("  ");
		}
		printf("\n");
	}

	return EXIT_SUCCESS;
}