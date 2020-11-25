//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf
#include <string.h> //strlen

// Écrire une fonction qui sur la donnée d'une chaîne de caractères retourne une copie de cette chaîne.

char* copy(const char* string){
    int size = (int) strlen(string); //taille d'une chaine
    char* copy = (char*) malloc((size+1)*sizeof(char)); // +1 car \0 à la fin pas dans size
    int i = 0;
    while (i < size){
        copy[i] = string[i];
        i++;
    }
    copy[i] = '\0'; //ajoute à la fin
    return copy;
}

int main(void){
    char * original = "Hello, World !";
    char * copied = copy(original);
    fprintf(stdout,"Original: {%s}\nCopy: {%s}\n", original, copied);
    free(copied);
    return EXIT_SUCCESS;
}