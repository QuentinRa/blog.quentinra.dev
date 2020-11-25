//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf

// On souhaite obtenir un tableau trié contenant les mêmes valeurs qu'un tableau t passé en paramètre sans modifier
// ce dernier. Proposez une fonction qui retourne un pointeur sur un tel tableau trié.

void show(double *tab, int size);

// tri un tableau (plus grand au plus petit) et renvoi le tableau trié
double* sort(const double* array, int size){
    if (size <=0 ) return NULL;
    double* sorted = (double*) malloc(size*sizeof(double));
    // tri du tableau en mode grosse brute
    // d'ailleurs l'algorithme est assez moche donc a remplacer par le votre
    //
    // en gros on va regarder pour chaque élément combien il y en a de plus petit
    // 0? alors position 0, 1? alors position 1 etc...
    // si égalité, alors on réserve autant de cases que d'égalités et celui au plus
    // petit indice est dans la première, le suivant dans la seconde etc...
    for (int i = 0; i < size; ++i) {
        double current = array[i];
        int pos = 0;
        for (int j = 0; j < size; j++) {
            if(i == j) continue;
            double autre = array[j];
            // si c'est la même valeur, alors les plus petits
            // prennents les premières places et les plus grands les autres
            // donc en gros si on a deux 7 par exemple indices 5 et 7
            // l'indice 5 va prendre la première des deux cases réservées aux 7
            // et l'indice 7 va prendre la seconde des deux cases réservées aux 7
            if(autre == current && i<j) pos++;
            else if(current < array[j]) pos++;
        }
        sorted[pos] = current;
    }
    return sorted;
}

#define TAB {5,3,8,9.2,9.25,2.24,5}
#define SIZE 7

int main(void){
    double tab[SIZE] = TAB;
    double* sorted = sort(tab, SIZE);
    show(sorted, SIZE);
    free(sorted);
    return EXIT_SUCCESS;
}

void show(double *tab, int size) {
    for (int i = 0; i < size; i++) {
        printf("tab[%d]=%.5lf\n", i, tab[i]);
    }
}
