/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

/*void zero(double a) {
  a = 0.0;
}
 
int main(void) {
  double x=37.5;
  printf("avant : %f\n", x);
  zero(x);
  printf("après : %f\n", x);
  return EXIT_SUCCESS;
}

la fonction initilise un x et affiche sa valeur puis transmet SA VALEUR soit 37.5 à la
fonction zéro qui remet la VALEUR 37,5 à 0 ... donc à aucun moment x n'as été modifié !
Si on veut modifier x, on va transmettre l'adresse de x a la fonction 0 et lui faire modifier
la valeur contenue à la dite adresse : */

void zero(double *a) {
  *a = 0.0;
}
 
int main(void) {
  double x=37.5;
  printf("avant : %f\n", x);
  zero(&x);
  printf("après : %f\n", x);
  return EXIT_SUCCESS;
}