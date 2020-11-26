// Quentin Ra, 26/11/2020 - version 1
#ifndef LIST_H
#define LIST_H

#ifndef ELEMENT_TYPE
    #define ELEMENT_TYPE double
#endif

// type des valeurs, on peut créer des listes de n'importe
// quel type en changeant les valeurs ici (avant d'importer pour que ce soit ok)

// ------------------------------ TYPES

typedef ELEMENT_TYPE element_type;

// type d'un maillon
typedef struct s_element {
    element_type value;
    struct s_element* next;
} element; // renommage

struct s_list {
    int size;
    element* e; // pointe sur l'adresse du premier élément
};

typedef struct s_list* list;

// ------------------------------ FUNCTIONS

//créer une liste
list create_linked_list();

// ajoute un élément
list add_linked_element(list list, element_type element);

// crée un élément
element* create_linked_list_element(element_type element);

// affiche une liste
void show_linked_list(list l, char* format);

// libère/détruit une liste
void destroy_linked_list(list* list);

int is_list_empty(list list);

#endif
