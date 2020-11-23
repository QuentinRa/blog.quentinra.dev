/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

typedef struct charx3 {
	char x;
	char y;
	char z;
}charx3;

typedef struct charx13int2 {
	char x;
	int y;
	char z;
}charx13int2;

typedef struct charx23int2 {
	int x;
	char y;
	char z;
}charx23int1;

typedef struct test {
	double a;
	int n;
	double c;
	char d;
	int e;
	char f;
	char g;
}test;

int main(int argc, char * argv[]) {
	printf("%zu\n",sizeof(charx3));
	printf("%zu\n",sizeof(charx13int2));
	printf("%zu\n",sizeof(charx23int1));
	printf("%zu\n",sizeof(test));

	/* La taille d'une structure est calculable :
	- on regarde la taille en octect du plus grand type (ex : double = 8)
	- on fait des groupes de même type qui SE SUIVENT de taille max 8 octect (<=8)
	(ainsi deux char séparés sont dans 2bloc alors qu'il pourraient en taille être dans un seul)
	- on calcule le nombre de bloc que l'on a fait multiplié par le nombre d'octect max.

		Ex :

			1) char char char
				taillemax = 1 octect (char)
				3 bloc de 1 octect donc
				3 * 1 = 3

			2) char int char
				taillemax = 4 octect (int)
				3 bloc (1 4 1)
				3 * 4 = 12
				
			3) int char char
				taillemax = 4 octect (int)
				2 bloc (4 1 1)
				2 * 4 = 8
			
			char + char = 2 <=4 et se suivent donc un bloc

			4) double int double char int char char
				taille max = double (8)
				6 blocs (8 4 8 1 4 2)
				8 * 6 = 48
				FAUX 40
	*/

	return EXIT_SUCCESS;
}