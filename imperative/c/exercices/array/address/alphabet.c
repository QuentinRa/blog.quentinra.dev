/* Ce programme déclare ("min",VALEUR,char,&min) et ("max",VALEUR,char,&max)
et un pointeur : ("p",NULL,char,&p) ; On note que NULL est une adresse valant 0.

On initialise ("min",'a',char,&min) et ("max",'A',char,&max) et tant que maj <='Z' on fait :

	on assigne p : si p==&min a &maj sinon a &min ce qui donne et on affiche la valeur pointée par l'adresse contenu dans p :

	min='a' ; maj='A';
	p (NULL) != &min donc
	p=&min
	affiche *p soit a
	...

	min='b' ; maj='B';
	p (&min) == &min donc
	p=&max
	affiche *p soit B
	...

	min='c' ; maj='C';
	p (&max) != &min donc
	p=&min
	affiche *p soit c
	...

	On peut donc en déduire que ce progamme va afficher TOUTES les lettres de l'alphabet (<='Z') en inversent minusucle et majusucule 
	et en commencant par a (minuscule) ce qui donnerais :

	aBcDeFgHiJkLmNoPqRsTuVwXyZ
*/

#include<stdio.h>
#include<stdlib.h>

int main(void) {
  char min, maj;
  char *p = NULL;
 
  for(min = 'a', maj = 'A'; maj <= 'Z'; min++, maj++) {
    p = (p == &min) ? &maj : &min;
    putchar(*p);
  }
  putchar('\n');
  return EXIT_SUCCESS;
}

/* On vérifie et le progamme donne : 
aBcDeFgHiJkLmNoPqRsTuVwXyZ */