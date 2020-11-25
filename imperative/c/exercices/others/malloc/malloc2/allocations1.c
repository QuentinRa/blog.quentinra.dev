//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf

// Proposez une fonction qui sur la donnée de deux double, et seulement deux, retourne un
// pointeur sur un double de la valeur maximale des deux paramètres.

// fonction qui prends deux doubles et retourne une adresse sur un double
double* max(double a, double b){
    // on peut pas retourner &a ou &b car la variable a ou b n'existe que dans
    // la fonction, on va donc réserver de la place en mémoire et indiquer en
    // résultat de la fonction ou se trouve le résultat
    double* r = (double*) malloc(1*sizeof(double));//on veut réserver une case de la taille d'un double
    *r = a>b?a:b;// if a>b : *r = a else: *r = b donc en gros on met dans notre cas le plus grand
    return r;//on retourne l'endroit ou trouver la case
}

//déclare A et B comme des constantes
#define A 5.2312
#define B 5.2313

int main(void){
    // appel de la fonction, on garde l'adresse de la case pour pouvoir retourver la valeur
    double* r = max(A,B);
    //affiche le résultat
    fprintf(stdout,"max(%lf,%lf)=%lf",A, B, *r);
    // 1 malloc = 1 free, si t'as réservé de la place en mémoire, t'oublie pas de la libérer
    free(r);
    // tout fini tranquilement
    return EXIT_SUCCESS;
}