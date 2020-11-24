/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int lecture_liste(char *path);
int croissante(char *path);
int creer_liste_croissante(char *path1,char *path2,char *dest);

int main(int argc, char * argv[]) {

	int tmp;

	if(argc!=4){
		fprintf(stderr, "Usage : %s <liste1> <liste2> <dest>\n",argv[0]);
		return EXIT_FAILURE;
	}
	
	/* Vérifie qu'elles sont croissantes */
	tmp = croissante(argv[1]);
	if (tmp==-1||tmp==0){
		fprintf(stdout,"luxe\n");
		return EXIT_FAILURE;
	}
	tmp=croissante(argv[2]);
	if (tmp==-1||tmp==0){
		return EXIT_FAILURE;
	}

	creer_liste_croissante(argv[1],argv[2],argv[3]);
	if (lecture_liste(argv[3])==-1){
		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}

int lecture_liste(char *path){
	int i;
	double d;
	FILE *fichier=NULL;

	fichier = fopen(path,"r");
	if (!fichier){
		fprintf(stdout,"Unable to open %s in read mode.\n",path);
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

int croissante(char *path){
	int i=0,stop=0;
	double last;
	FILE *fichier=NULL;
	fichier = fopen(path,"r");
	if (!fichier){
		fprintf(stdout,"Unable to open %s in read mode.\n",path);
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

	fprintf(stdout,"La liste %s est croissante.\n",path);

	fclose(fichier);
	return 1;
}

int creer_liste_croissante(char *path1,char *path2,char *dest){
	double valeur1,valeur2;
	FILE *fichier1=NULL,*fichier2=NULL,*sortie=NULL;
	
	fichier1 = fopen(path1,"r");
	if (!fichier1){
		fprintf(stdout,"Unable to open %s in read mode.\n",path1);
		return -1;
	}
	fichier2 = fopen(path2,"r");
	if (!fichier2){
		fprintf(stdout,"Unable to open %s in read mode.\n",path2);
		return -1;
	}
	sortie = fopen(dest,"w");
	if (!sortie){
		fprintf(stdout,"Unable to open %s in write mode.\n",dest);
		return -1;
	}

	while(!feof(fichier1) || !feof(fichier2)){
		int r1 = fread(&valeur1,sizeof(double),1,fichier1);
		int r2 = fread(&valeur2,sizeof(double),1,fichier2);
		if (r1!=0 && r2!=0){
			if(valeur1>valeur2){
				fwrite(&valeur2,sizeof(double),1,sortie);
				fwrite(&valeur1,sizeof(double),1,sortie);
			} else {
				fwrite(&valeur1,sizeof(double),1,sortie);
				fwrite(&valeur2,sizeof(double),1,sortie);
			}
		}
		/* si deux listes de tailles différentes a traiter */
	}

	fclose(fichier1);
	fclose(fichier2);
	fclose(sortie);

	return 0;
}