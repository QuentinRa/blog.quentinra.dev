/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include <sys/types.h>	/* getgrnam */
#include <grp.h>		/* getgrnam */

/* struct group *getgrnam (const char *__name);
	
	struct group {
		char *gr_name;		groupe name
		char **gr_mem;		nom des elements du groupes
	}

*/

int main(int argc, char * argv[]) {
	int i;
	struct group student18_seach;
	char t[]="students18";
	student18_seach = *getgrnam(t);

	for (i = 0; i < 5; i++) {
		buffer=student18_seach->gr_mem;
		printf("%s\n",buffer);
	}

	return EXIT_SUCCESS;
}
