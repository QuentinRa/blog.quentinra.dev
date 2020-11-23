#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int entier1;

	printf("Entrez un entier :");
	scanf("%d",&entier1);

	char x = (char) entier1;

	printf("%c\n",x);

	/* 65 = A
	-65 = <>
	191 = <>
	321 = A
	On peut supposer que de A à A il c'est passé un tour donc 
	|65-312|=256
	et de <> à <> il c'est passé un tour donc
	|-65-191|=256
	L'encodage des valeurs se ferait donc toutes les 256valeurs soit 8bits soit char.
	Donc on refait le tour de la boucle dès qu'une valeur est plus grande
	*/

	return EXIT_SUCCESS;
}