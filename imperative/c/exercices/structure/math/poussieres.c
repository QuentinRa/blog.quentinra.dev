#include<stdio.h>
#include<stdlib.h>

int main(void) {
	printf("%f\n", 12345.678910111213);
  	/*Affiche : 12345.678910
 	On en déduit que %f ne peut affichez que 8 chiffres après la virgule */
 	printf("%.12f\n", 12345.678910111213);
 	/* Affiche : 12345.678910111214
 	%f ne sait pas quel nombre suit le dernier 3 alors il lui donne une valeur*/
	printf("%.15f\n", 12345.678910111213);
	/* Affiche : 12345.678910111213554
 	on voit la raison de l'arrondisement a Xe supérieur dut au valeur attribués par %f*/
 	return EXIT_SUCCESS;
}