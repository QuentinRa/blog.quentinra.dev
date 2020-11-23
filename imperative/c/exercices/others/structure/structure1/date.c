/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

/* struct tm *localtime (const time_t *__timer)
	Elements importants :
	struct tm {
		tm_mday 		entre 1 et 31
		tm_mon			entre 0 ET 11
		tm_year 		année depuis 1900
	} 

	time_t time (time_t *__timer)
*/

int main(int argc, char * argv[]) {
	struct tm temps;
	time_t temps_raw = time(NULL);
	temps = *localtime(&temps_raw);

	printf("%4d-%2d-%2d\n",temps.tm_year+1900,temps.tm_mon+1,temps.tm_mday);

	return EXIT_SUCCESS;
}
