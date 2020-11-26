//Quentin Ra, 26/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS
#define PRINT_TAG "%f"
#define ELEMENT_TYPE double //runtime error (0 partout) si changé ici pour des raisons mystiques
#include "list.h"

// Proposer une fonction qui insère entre chaque paire d'éléments consécutifs d'une liste leur moitié.

void insert_half(list list) {
    if(list->size <= 1) return;
    element* min = list->e;
    element* max = list->e->next;

    do {
        element_type v = (max->value+min->value)/2;
        if(v < 0) v *= -1;// valeur absolue
        element* tmp = create_linked_list_element(v);
        tmp->next = max;
        min->next = tmp;//insertion
        min = max;
        max = max->next;
    } while (max != NULL);
}

int main(void){
    list l = create_linked_list();
    add_linked_element(l, 5.0);
    add_linked_element(l, 9.2);
    add_linked_element(l, 4.1);
    add_linked_element(l, 3.0);
    add_linked_element(l, 1.653);
    // notre fonction
    insert_half(l);
    // affiche le résultat
    show_linked_list(l, PRINT_TAG);
    destroy_linked_list(&l);
    return EXIT_SUCCESS;
}
