//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf

// Proposez une fonction qui sur la donnée de deux tableaux ta, tb de même taille size (donc trois paramètres) retourne
// un pointeur sur leur vecteur de différences.

void show(double *tab, int size);

// Prends deux tableaux d'entiers de même taille et retourne la différence (ta-tb)
double* diff(const double* ta, const double* tb, int size){
    if(size <= 0) return NULL;
    //allocation du vecteur de diff
    double* diff = (double*) malloc(size*sizeof(double));
    //on met dans chaque case la diff
    for (int i = 0; i < size; i++) {
        diff[i] = ta[i] - tb[i];
    }
    return diff;
}

#define SIZE 5
#define TA {12.4,2.311, 4.75,3.002,5}
#define TB {5.4,2.314,5.25,3.001,5}

int main(void){
    double ta[SIZE] = TA;
    double tb[SIZE] = TB;
    double* d = diff(ta, tb, SIZE);
    show(d, SIZE);
    free(d);//libère
    return EXIT_SUCCESS;
}

void show(double *tab, int size) {
    for (int i = 0; i < size; i++) {
        printf("tab[%d]=%.5lf\n", i, tab[i]);
    }
}
