/* x = i++ : donne a x la valeur de i puis on augmente i de + 
et x = ++i : augmente i de un et on donne la valeur à x */

#include<stdio.h>
#include<stdlib.h>

int main(void) {
  int a = 1, b = 2, c = 3;
  int *p, *q;

/* ("a",1,int,&a) ("b",2,int,&b) ("c",3,int,&c)
("p",VALEUR,int,&p) ("q",VALEUR,int,&q) */
 
  p=&a;

/* ("a",1,int,&a) ("b",2,int,&b) ("c",3,int,&c)
("p",&a,int,&p) ("q",VALEUR,int,&q) */

  q=&c;

/* ("a",1,int,&a) ("b",2,int,&b) ("c",3,int,&c)
("p",&a,int,&p) ("q",&c,int,&q) */
 
  *p=(*q)++;

/* La valeur pointée par p (&a soit 1) prends la valeur pointée par q (&c soit 3) 
donc a=3 et la valeur pointée par q (&c soit 3) est incrémentée de 1
donc c=4
*/

  p=q;

/* p prends la valeur de q soit l'adresse de c donc
p=&c soit *p = 4 */

  q=&b;

/* q = &b
on a a=3 b=2 c=4 et p=&c q=&b */

  *p-=*q;
/* *p = *p - *q donc
*p = c-b = 4-2 = 2 */

  ++*q;

/* on incrément de un *q soit b soit b=3 */

  *p*=*q;

  /* *p = *p * *q donc *p = 2 * 3 = 6 

  on a donc : a=3, b=3, c=6 p=&c et q=&b */

  a=++*q**p;
  /*on augmente *q soit 3 de 1 donc 4 * 6 (=*p) a = 24 */

  p=&a;
  /* p=&a  on a donc a=24 b=4 c=6 p=&a et q=&b */

  *q=*p/(*q);
  /* b= a / b = 24 / 4 = 6 */

  return EXIT_SUCCESS;
}