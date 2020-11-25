//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf
#include <string.h> //strlen

// Écrire une fonction qui sur la donnée de deux chaînes de caractères retourne la concaténation de ces chaînes.
// (Exemple : avec "coucou" et "toto", retourne "coucoutoto".)

char* concat(const char* str1, const char* str2){
    int size_str1 = (int) strlen(str1);
    int size_str2 = (int) strlen(str2);
    char* r = (char*) malloc((size_str1 + size_str2 + 1)* sizeof(char)); //+1 pour le \0 à la fin
    int pos = 0;
    for (int i = 0;i < size_str1 ; i++, pos++) {
        r[pos] = str1[i];
    }
    for (int i = 0; i < size_str2 ; i++, pos++) {
        r[pos] = str2[i];
    }
    r[pos] = '\0'; //ajoute le \0
    return r;
}

int main(void){
    char *str1 = "coucou";
    char *str2 = "toto";
    char* r = concat(str1, str2);
    fprintf(stdout, "Result: {%s}\n", r);
    free(r);
    return EXIT_SUCCESS;
}