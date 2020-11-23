/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned int nombre,capacite=0,i=0,j,in=0;
	double *p=NULL,*second=NULL;
	printf("Combien ? ");
	scanf("%d",&nombre);
	if (nombre<=0) {
		printf("Nombre incorrect\n");
		return EXIT_FAILURE;
	}  
 	p = (double*) malloc(nombre*sizeof(double));
 	second = (double*) malloc(nombre*sizeof(double));

 	while (i<nombre) {
 		printf("nombre %d? ",i+1);
 		scanf("%lf",(p+i));
 		i++;
 	}

 	for (i=0;i<nombre;i++) {
 		in=0;
 		for (j=0;j<nombre;j++) {
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
 		printf("%lf ",*(second+i));
 	}
 	putchar('\n');

 	free(p);
 	free(second);
	return EXIT_SUCCESS;
}