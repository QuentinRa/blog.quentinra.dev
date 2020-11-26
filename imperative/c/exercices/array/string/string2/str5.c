//Quentin Ra, 25/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS, malloc et free
#include <stdio.h> //printf
#include <string.h> //strlen

// Écrire une fonction qui sur la donnée d'un caractère sep et d'une chaîne s, retourne un tableau contenant les
// sous-chaînes de s délimitées par sep. Par exemple, pour sep = ';' et s = "ab;cde;;f;g hi",
// cette fonction retourne une tableau de taille 5 contenant les chaînes "ab" "cde" "" "f" et "g hi".

// NB : en pratique, pour pouvoir utiliser une telle fonction, il faudrait soit retourner également sa taille (avec
// un enregistrement, ou dans un paramètre supplémentaire passé par référence), ou alors ajouter une case
// supplémentaire contenant l'adresse NULL marquant la fin du tableau.

char* substr(const char* str1, int i, int j);

char ** split(const char sep, const char* str){
    int sub_str_count = 1;
    // array = tableau dynamique dans lequel on va ajouter les sous chaines
    char** array = (char**) malloc(sub_str_count*sizeof(char*)); // on fera du realloc

    // si on le fait à la main, c'est ça
    // array[0] = substr(str, 0,2);
    // array[1] = substr(str, 3,6);
    // array[2] = substr(str, 7,7);
    // array[3] = substr(str, 8,9);
    // array[4] = substr(str, 10,14);

    int i = 0, begin = 0;
    for (; str[i] != '\0'; i++) {
        char current = str[i];
        if(current == sep){
            //on augmente de 1 pour pouvoir mettre plus de chaines
            array = realloc(array, (sub_str_count+1)*sizeof(char*));
            array[sub_str_count-1/* commence à 1*/] = substr(str, begin, i); // extrait la sous chaine
            begin=i+1;//; + 1 donc après le point virgule
            sub_str_count++;
        }
    }
    if (begin != 0) { // si on a plusieurs chaines, alors faut traiter la dernière
        //on augmente pour pouvoir mettre plus de chaines
        array = realloc(array, (sub_str_count+1)*sizeof(char*));
        array[sub_str_count-1] = substr(str, begin, i);
    }

    return array;
}

#define BREAK_COUNT 5 // dans cette version sans structure, on doit avoir une taille arbritraire

int main(void){
    char *str1 = "ab;cde;;f;g hi";
    char** r = split(';', str1); //retourne 1,2,3,4
    fprintf(stdout, "Result:\n");
    for (int i = 0; i < BREAK_COUNT; i++) {
        // affiche la sous chaine
        fprintf(stdout, "{%s}", r[i]);
        if(i+1 < BREAK_COUNT) putc('\n', stdout);
        free(r[i]); // free chaque sous chaine
        // pour être joli on devrait faire deux boucles
    }
    free(r);
    return EXIT_SUCCESS;
}

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