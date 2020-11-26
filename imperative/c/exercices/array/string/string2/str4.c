//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf
#include <string.h> //strlen

// Écrire une fonction qui sur la donnée d'une chaîne de caractères et de deux indices i et j, retourne une copie de
// la sous-chaîne comprise entre l'indice i inclus et j non-inclus. Penser à bien renseigner les
// préconditions de la fonction !

char* substr(const char* str1, const int i, const int j){
    int size = (int) strlen(str1);
    int sub_size= j-i;
    int pos = 0;
    char* substr = NULL;
    if (i == j){ // retourne une chaine vide
        substr = (char*) malloc(1*sizeof(char));
        substr[0] = '\0';
        return substr;
    }
    // pas bons arguments
    if(i < 0 || j < i || j > size || j-i > size) return NULL;
    substr = (char*) malloc((sub_size+1)*sizeof(char));
    //prends de i jusqu'à j
    for (int k = i; k < j; k++, pos++) {
        substr[pos]=str1[k];
    }
    substr[pos]='\0';
    return substr;
}

int main(void){
    char *str1 = "coucou";
    char* r = substr(str1, 1,5); //retourne 1,2,3,4
    fprintf(stdout, "Result: {%s}\n", r);
    free(r);
    return EXIT_SUCCESS;
}