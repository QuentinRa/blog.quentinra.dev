#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int entier1,entier2;

	printf("Entrez un premier entier :\n");
	scanf("%d",&entier1);
	getchar();
	printf("Entrez un second entier :\n");
	scanf("%d",&entier2);

	if ((entier1<0)&&(entier2<0)) {						/*     - x - = +    */
			printf("Signe du produit : positif.\n");
	}	else if ((entier1>0)&&(entier2>0)) {			/*   + x + = +     */
			printf("Signe du produit : positif.\n");
	}	else if ((entier1>0)&&(entier2<0)) {			/*   + x - = -     */
			printf("Signe du produit : négatif.\n");
	}	else if ((entier1<0)&&(entier2>0)) {			/*   - x + = -     */
			printf("Signe du produit : négatif.\n");
	} 	else if ((entier1==0)||(entier2==0)) {			/* 0 x + = 0 ; 0 x - = 0 ; 0 x 0 = 0 est vice versa */
		printf("Signe du produit : null (=0).\n");
	}

	return EXIT_SUCCESS;
}
