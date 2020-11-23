/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

void exemple(unsigned n) {
  if (n != 0) {
    putchar('>');
    exemple(n-1);
    putchar('<');
  } else
    putchar('O');
}

int main(int argc, char * argv[]) {
	exemple(10);
	return EXIT_SUCCESS;
}

/* Lors de l'appell de exemple, le main est mis dans la pile puis :
on lance la fonction :
tout la première partie dans de 10 puis n-1 ... jusqu'a 0 est la phase
ascendante c'est a dire que l'on empile les version précénte de la fonction
exemple :

On cherche a execupter n=10 sauf que pour cela on doit connaitre exemple(n-1)

#0  exemple (n=10) at phases.c:7
#1  0x00005555555546a4 in main (argc=1, argv=0x7fffffffde38) at phases.c:15

donc on met dans la pile la version précédente (n=10) et on fait (n-1)

#0  exemple (n=9) at phases.c:7
#1  0x0000555555554672 in exemple (n=10) at phases.c:8
#2  0x00005555555546a4 in main (argc=1, argv=0x7fffffffde38) at phases.c:15

Lors que n=0 alors on n'apelle plus exemple et on pile va se vider :
phase descendante
*/