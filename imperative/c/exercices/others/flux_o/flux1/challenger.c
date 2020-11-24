/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#define type_top 10
#define file_top "files/top10"

typedef struct records_s{
	int score;
	char sigle[4];
}records;

int main(int argc, char * argv[]){

	int i,score,stop=0;
	FILE* top10=NULL;
	records top[type_top+1];

	if (argc!=3){
		fprintf(stderr, "Usage : %s <score> <sigle>\n",argv[0]);
		return EXIT_FAILURE;
	}

	top10 = fopen(file_top,"r");
	if (!top10){
		fprintf(stderr, "open %s in read mode failed.\n",file_top);
		return EXIT_FAILURE;
	}

	for (i = 0; i < type_top; i++){
		fread(top+i,sizeof(int)+3*sizeof(char),1,top10);
		top[i].sigle[3]='\0';
	}

	fclose(top10);

	top10 = fopen(file_top,"w");
	if (!top10){
		fprintf(stderr, "open %s in read mode failed.\n",file_top);
		return EXIT_FAILURE;
	}

	score = (int) strtol(argv[1],NULL,10);

	for (i = type_top-1 ; i >= 0 && stop==0; i--){
		if (top[i].score<score){
			top[i+1].score=top[i].score;
			sprintf(top[i+1].sigle,"%s",top[i].sigle);
		} else {
			top[i+1].score=score;
			snprintf(top[i+1].sigle,4,"%s",argv[2]);
			stop=1;
		}
	}
	if (stop!=1){
		top[0].score=score;
		snprintf(top[0].sigle,4,"%s",argv[2]);
	}

	for (i = 0; i < type_top; i++){
		fwrite(top+i,sizeof(int)+3*sizeof(char),1,top10);
	}

	fclose(top10);

	return EXIT_SUCCESS;
}