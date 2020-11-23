/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char * argv[]) {
	int i;
	char lecture[26];
	char cle[]="ParuseGaia";
	printf("Saisie: ");

	for (i=0;i<26&&lecture[i-1]!='\n';i++) {
		lecture[i]=getchar();
	}
	if (i==26){
		lecture[i]='\0';
	} else {
		lecture[i-1]='\0';
	}

	if (strcmp(lecture,cle)==0){
		printf("Authentification réussie\n");		
	} else {
		printf("mot de passe incorrect\n");
	}

	return EXIT_SUCCESS;
}