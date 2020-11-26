//Quentin Ra, 26/11/2020 - version 1

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "list.h"

//créer une liste
list create_linked_list(){
    list l = (list) malloc(sizeof(list));
    l->size = 0;
    l->e = NULL; //last
    return l;
}

// ajoute un élément
list add_linked_element(list list, element_type value){
    element* e = create_linked_list_element(value);
    element* c = list->e;// get frist
    if(c != NULL){
        while (c->next != NULL) c = c->next;
        c->next = e;
    } else { //premier element
        list->e = e;
    }
    list->size++;
    return list;
}

element* create_linked_list_element(element_type value){
    element* e = (element*) malloc(sizeof(element));
    e->value = value;
    e->next = NULL; //last
    return e;
}


// affiche une liste
void show_linked_list(list l, char* format){
    element* c = l->e;// get frist

    //allocation pour le format
    char* start = "valeur: ";
    char* str_format = (char*) malloc((strlen(format)+strlen(start)+1/*\0*/+1/*\n*/)*sizeof(char));
    strcpy(str_format, start);
    strcat(str_format, format);
    strcat(str_format, "\n");//\0\n
    while (c->next != NULL){
        fprintf(stdout, str_format, c->value);
        c = c->next;
    }
    fprintf(stdout, str_format, c->value);
}

// libère/détruit une liste
void destroy_linked_list(list* list){
    element* c = (*list)->e;// get frist
    while (c->next != NULL){
        element* tmp = c;
        c = c->next;
        free(tmp);
    }
    free(list);
}

int is_list_empty(list list) {
    return list->size == 0?1:0;
}