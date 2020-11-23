/* 2e essai :) :
Le programme déclare un pointeur : ("p",VALEUR,int,&p)

si time(NULL)%2 alors on initialise x à 59 et on assigne p à &x ce qui donne
("p",&x,int,&p)

sinon on initialise y à 31 et on assigne p à &y ce qui donne
("p",&y,int,&p)

Puis on quitte la boucle : les variables initialisés disparaissent (mais leur adresses sont conservés pendant l'utilisation du programme)

Puis on demande d'affiche la variable contenu à l'adresse pointée par p donc soit &x ou &y sauf que x et y sont mort donc voila...

Ils sont morts en tant que variables mais vivant en tant qu'adresses.
*/

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
 
int main(void) {
  int* p;
 
  if(time(NULL)%2) {
    int x = 59;
    p = &x;
  } else {
    int y = 31;
    p = &y;
  }
  /* fragment inactif
  printf("x=%d\n", x);
  printf("y=%d\n", y);
  */
  printf("%d\n", *p);
  return EXIT_SUCCESS;
}