#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	printf("%f\n", +1.0/0.0);
	/*donne le réel vers lequel un entier qui tends vers 1 sur un réel tends vers zéro 
	limite : +infini/zéro = +infini */
 	printf("%f\n", -1.0/0.0);
	/*donne le réel vers lequel un entier qui tends vers 1 sur un réel tends vers zéro 
	limite : -infini/zéro = -infini */
 	printf("%f\n", -0.0/0.0);
	/*donne le réel vers lequel un entier qui tends vers 1 sur un réel tends vers zéro 
	limite : zéro(négatif)/zéro(positif) = NULL (nan) */

	return EXIT_SUCCESS;
}
