/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned int nombre=10,capacite=0,i=0,j,k=0,in=0;
	double *p=NULL,*second=NULL;
	char c;
 	p = (double*) malloc(nombre*sizeof(double));

 	while (c!='q') {
 		printf("nombre %d? ",k+1);
 		scanf("%lf",(p+k));
 		scanf("%c",&c);
 		k++;
 		if (k+1>nombre) {
 			nombre+=10;
 			p = (double*) realloc(p,10*sizeof(double));
 		}
 	}
 	k--;
	second = (double*) malloc(k*sizeof(double));

  	printf("nombre = %d i= %d \n",nombre,k);

 	for (i=0;i<k;i++) {
 		in=0;
 		for (j=0;j<k;j++) {
 			if (*(p+i)==*(p+j)) {
 				in++;
 			}
 		}
 		if (in==1) {
 			*(second+capacite)=*(p+i);
 			capacite++;
 		}
 	}

 	for (i=0;i<capacite;i++) {
 		printf("%.2lf ",*(second+i));
 	}
 	putchar('\n');

 	free(p);
 	free(second);
	return EXIT_SUCCESS;
}