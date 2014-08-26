/**********************************************************************

  quiz4_tester.c - 04: leap year / tester

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Mon Aug 25 16:01:08 JST 2014

**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char filename[1024];
#define INPUT_DIR   "./input/"
#define openfile(name) {fclose(fp);sprintf(filename, "%s%s", INPUT_DIR, name);fp = fopen(filename,"w");if (fp == NULL){perror(NULL);exit(1);}}

int main(int argc, char const *argv[])
{
    FILE *fp = NULL;        // output area
    int seed = 0;           // random seed 
    int i,j,k;              // for loop
    char buffer[1024];      // buffer

    /* command line */
    if (argc == 2)
    {
        seed = atoi(argv[1]);
    }
    else if (argc < 2)
    {
        // nothing to do
    }

    else
    {
        perror("Error - too many arguments.");
        exit(1);        
    }

    /* initialize random */
    srand(0);

    /* generate test code */
    for (i = 1; i <= 10; i++)
    {
        sprintf(buffer, "quiz4_01_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d\n", rand()%201+1900);
    }

    for (i = 1; i <= 30; i++)
    {
        sprintf(buffer, "quiz4_02_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d\n", rand()%10000+1);
    }

    fclose(fp);
    return 0;
}
