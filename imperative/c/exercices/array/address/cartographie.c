#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	float x;
    double y;
    long double z;
    char a;
    short int b;
    int	i;
    long long unsigned int j;

    printf("%p\n",&x);
    printf("%p\n",&y);
    printf("%p\n",&z);
    printf("%p\n",&a);
    printf("%p\n",&b);
    printf("%p\n",&i);
    printf("%p\n",&j);

    /*
  	0x7ffe7aaf85e5	char										0x7ffeacf48915		char						8 bits     (1 emplacement = 1 oct) commence octect mpultiple de 1
	0x7ffe7aaf85e6	short int									0x7ffeacf48916		short int					16 bits    (2 emplacement = 2 oct) commence octect mpultiple de 2
    0x7ffe7aaf85e8	float										0x7ffeacf48918		float						32 bits    (4 emplacement = 4 oct) commence octect mpultiple de 4
	0x7ffe7aaf85ec	int											0x7ffeacf4891c		int							32 bits    (4 emplacement = 4 oct) commence octect mpultiple de 4
	0x7ffe7aaf85f0	double										0x7ffeacf48920 		double						64 bits    (8 emplacement = 8 oct) commence octect mpultiple de 8
	0x7ffe7aaf85f8	long long unsigned int						0x7ffeacf48928		long long unsigned int		64 bits    (8 emplacement = 8 oct) commence octect mpultiple de 8
	0x7ffe7aaf8600	long double									0x7ffeacf48930		long double					80 bits    (10 emplacement = 10 oct) commence octect mpultiple de 10
	*/

	/* On peut voir que toutes les adresse du programme sont dans un bloc constant : 0x7ffe7aaf8 ou encore 0x7ffeacf489 ....
	Puis elle sont classés en fonction de leur nombre de bits  */

	return EXIT_SUCCESS;
}