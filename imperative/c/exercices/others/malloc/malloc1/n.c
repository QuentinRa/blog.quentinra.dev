/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char* strtoc(char *texte,int *capacite,int *marqueur,int *nombre);

int main(int argc, char * argv[]) {
	int capacite=10,marqueur=0,i,stop=0,nombre=50;
	char *texte=NULL;
	texte = (char*) malloc(capacite*sizeof(char));

	printf("Entrez votre texte : ");
	for (i=0;texte[marqueur-1]!='\n'||stop==1;i++) {
		stop=0;
		texte = strtoc(texte,&capacite,&marqueur,&nombre);
		if (marqueur==nombre) {
			nombre+=50;
			texte[marqueur]='\n';
			marqueur+=1;
			stop=1;
		}
	}
	printf("\n%s\n",texte);
	free(texte);
	return EXIT_SUCCESS;
}

char* strtoc(char *texte,int *capacite,int *marqueur,int *nombre) {
	int i=*marqueur,j=*nombre,capacite_locale=*capacite;
	char *p=NULL;
	p = texte;

	if (i+1>capacite_locale) {
		capacite_locale+=10;
		p = (char*) realloc(p,(capacite_locale)*sizeof(char));
	}

	for(i=*marqueur;p[i-1]!=' '&&p[i-1]!='\n'&&i<j-1||i==*marqueur;i++) {
		p[i]=getchar();
		if (i==0 && p[i]==' ') {
			i--;
		}
		if (i+1>capacite_locale) {
			capacite_locale+=10;
			p = (char*) realloc(p,(capacite_locale)*sizeof(char));
		}
	}

	*marqueur=i;
	*capacite=capacite_locale;

	return p;
}