/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define src "files/rgb.txt"

void verification_composantes(char *buf,char *argv[]);

int main(int argc, char * argv[]) {

	FILE *file=NULL;
	char buf[256];

	/* Arguments */
	if (argc!=2){
		fprintf(stderr, "Usage : %s <couleur>\n",argv[0]);
		return EXIT_FAILURE;
	}
	/* ouverture */
	file = fopen(src,"r");
	if (!file){
		fprintf(stderr,"Unable to open %s in read mode.\n",argv[1]);
		return EXIT_FAILURE;
	}
	fgets(buf,256,file); /* absorbtion de la 1er ligne */
	
	while(!feof(file)){
		fgets(buf,256,file);
		verification_composantes(buf,argv);
	}

	fclose(file);

	return EXIT_SUCCESS;
}

void verification_composantes(char *buf,char *argv[]){
	int compteur=0,delete_saut;

	while(buf[compteur]!='\t'){
		compteur++;
	}
	while(buf[compteur]=='\t'){
		compteur++;
	}
	delete_saut=compteur;
	while(buf[delete_saut]!='\n'){
		delete_saut++;
	}
	buf[delete_saut]='\0';
	if (strcmp(buf+compteur,argv[1])==0){
		fprintf(stdout,"%s : ",(buf+compteur));
		compteur=0;
		while(buf[compteur]!='\t'){
			fprintf(stdout,"%c",buf[compteur]);
			compteur++;
		}
		putchar('\n');
	}
}