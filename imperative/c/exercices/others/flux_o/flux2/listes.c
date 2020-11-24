/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#define path "files/liste"

int creer_liste(char *file);
int lecture_liste(char *file);
int croissante(char *file);


int main(int argc, char * argv[]) {
	
	if(creer_liste(path)==-1){
		return EXIT_FAILURE;
	}

	if(lecture_liste(path)==-1){
		return EXIT_FAILURE;
	}

	if (croissante(path)==-1){
		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}

int creer_liste(char *file){
	int i=0,r=1;
	char c;
	double d;
	FILE *fichier=NULL;

	fichier = fopen(file,"w");
	if (!fichier){
		fprintf(stdout,"Unable to open %s in write mode.\n",file);
		return -1;
	}

	fprintf(stdout,"Saisie de réels, q pour quitter\n");
	for (i = 0; c!='q' ; i++){
		fprintf(stdout,"réel n°%d? ",i+1);
		r=scanf("%lf",&d);
		if(r){
			fwrite(&d,sizeof(double),1,fichier);
		} else {
			c=getchar();
		}
	}

	fclose(fichier);
	return 0;
}

int lecture_liste(char *file){
	int i;
	double d;
	FILE *fichier=NULL;

	fichier = fopen(file,"r");
	if (!fichier){
		fprintf(stdout,"Unable to open %s in read mode.\n",file);
		return -1;
	}

	for (i = 0; !feof(fichier); i++){
		int n=fread(&d,sizeof(double),1,fichier);
		if(n!=0)
		fprintf(stdout,"%lf ",d);
	}
	putchar('\n');

	fclose(fichier);
	return 0;
}

int croissante(char *file){
	int i=0,stop=0;
	double last;
	FILE *fichier=NULL;
	fichier = fopen(file,"r");
	if (!fichier){
		fprintf(stdout,"Unable to open %s in read mode.\n",file);
		return -1;
	}

	if(!feof(fichier)){
		fread(&last,sizeof(double),1,fichier);
	}

	for (i = 0; !feof(fichier) && stop!=1 ; i++){
		double tmp;
		fread(&tmp,sizeof(double),1,fichier);
		if(last>tmp){
			fprintf(stdout,"La liste n'est pas croissante.\n");
			return 0;
		} else {
			last=tmp;
		}
	}

	fprintf(stdout,"La liste est croissante.\n");

	fclose(fichier);
	return 0;
}