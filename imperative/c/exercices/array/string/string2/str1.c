//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf

// Écrire une fonction qui retourne la longueur d'une chaîne de caractère, vue comme un tableau.

#define TEXT "Hello, World!"
#define SIZE 14 //strlen(TEXT)+1 car retourne pas \0

int length(const char *text) {
    int size = 0;
    while (text[size] != '\0') size++;
    return size;
}

int main(void){
    char text[SIZE] = TEXT;
    int size = length(text);
    fprintf(stdout, "taille: %d", size); //SIZE-1 (car sans le \0)
    return EXIT_SUCCESS;
}