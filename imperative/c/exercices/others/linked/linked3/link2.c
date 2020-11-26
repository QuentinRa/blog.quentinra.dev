//Quentin Ra, 26/11/2020 - version 1

#include <stdlib.h> //EXIT_SUCCESS
#include <stdio.h>

#define PRINT_TAG "%f"
#define ELEMENT_TYPE double //runtime error (0 partout) si changé ici pour des raisons mystiques
#include "list.h"

//Proposer une fonction qui retourne une liste comportant les mêmes éléments mais triée (par insertion) par ordre
// croissant qu'une liste passée en paramètre. On ne modifiera pas la liste passée en paramètre.

list sort(list l){
    //vide
    if(is_list_empty(l)) return create_linked_list();
    list r = create_linked_list();
    //rien a trier
    if(l->size == 1){
        add_linked_element(r, l->e->value);
        return r;
    }

    // autre cas,
    // on prends un élément de la liste est on le place dans
    // notre nouvelle liste au bon endroit
    element* e_l = l->e;//prends le premier
    add_linked_element(r, e_l->value); //on l'ajoute à l'autre liste
    e_l = e_l->next;
    while (e_l != NULL){
        element_type v = e_l->value;//valeur à placer

        //changer la toute première ?
        if(r->e->value > v){
            element* old = r->e;
            r->e = create_linked_list_element(v);
            r->e->next = old;
        } else { //on regarde les autres
            element* e_r = r->e;
            while (e_r->next != NULL){
                if(e_r->next->value >= v){ //le suivant est plus grand
                    // on l'ajoute donc maintenant
                    element* old = e_r->next;
                    e_r->next = create_linked_list_element(v);
                    e_r->next->next = old;
                    break;
                }
                //on passe au suivant
                e_r = e_r->next;
            }
            if(e_r->next == NULL){
                //on l'a pas placé car atteint la fin de la liste, donc on l'ajoute
                add_linked_element(r, v);
            }
        }

        //passe au suivant de la liste originale
        e_l = e_l->next;
    }
    return r;
}

int main(void){
    list l = create_linked_list();
    add_linked_element(l, 5.0);
    add_linked_element(l, 9.2);
    add_linked_element(l, 4.1);
    add_linked_element(l, 3.0);
    add_linked_element(l, 5.0);
    add_linked_element(l, 1.653);
    // affiche le résultat
    show_linked_list(sort(l), PRINT_TAG);
    destroy_linked_list(&l);
    return EXIT_SUCCESS;
}
