//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf
#include <string.h> //strlen

// Écrire une fonction qui sur la donnée d'une chaîne de caractère s et d'un caractère c retourne l'adresse de
// la première occurrence de c dans s, ou NULL si c n'est pas présent dans s.

#define CHAR 'n'

char ** firstIndexOf(char *s, char c) {
    char **o = NULL;

    for (int j = 0; s[j] != '\0'; j++) {
        if(s[j] == c){
            o = (char**) malloc(1*sizeof(char*));
            *o = &s[j];
            break;
        }
    }

    return o;
}

int main(void){
    char* s = "chaine";
    char** i = firstIndexOf(s,CHAR);

    //affichage des adresses
    for (int j = 0; s[j] != '\0'; j++) {
        fprintf(stdout, "{valeur=%c, adresse=%p}\n", s[j], &s[j]);
    }
    fputc('\n', stdout);
    printf("{adresse premiere occurence de %c: %p}",CHAR, *i);

    free(i);
    return EXIT_SUCCESS;
}