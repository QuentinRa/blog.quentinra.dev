/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char* inverse(const char* s);

int main(int argc, char * argv[]) {
	int i=1;

	if (argc<2) {
		printf("Usage : %s <mot>*\n",argv[0]);
		return EXIT_FAILURE;
	}

	for (i=1;i<argc;i++) {
		if (strcmp(argv[i],inverse(argv[i]))==0) {
			if (i==argc-1)
				printf("%s est un palindrome.\n",argv[i]);
			else
				printf("%s est un palindrome,\n",argv[i]); 
		} else {
			if (i==argc-1)
				printf("%s n'est pas un palindrome.\n",argv[i]);
			else
				printf("%s n'est pas un palindrome,\n",argv[i]); 
		}
	}

	return EXIT_SUCCESS;
}

char* inverse(const char* s) {
	int taille=strlen(s),i,j;
	char *tab = (char*) malloc(taille*sizeof(char));

	for (i=0,j=taille-1;i<taille;i++,j--) {
		*(tab+i)=*(s+j);
	}
	*(tab+i)='\0';
	
	return tab;
}