/**********************************************************************

  quiz8_test.c - 08: combination / tester

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Mon Aug 25 17:02:31 JST 2014

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
    for (i = 1; i < 10; i++)
    {
        sprintf(buffer, "quiz8_01_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d %d", i+1, rand()%(i+2));
    }

    for (i = 1; i <= 15; i++)
    {
        sprintf(buffer, "quiz8_02_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d %d", i+10, rand()%(i+10));
    }

    for (i = 1; i <= 3; i++)
    {
        sprintf(buffer, "quiz8_03_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d %d", i+27, i+12);
    }

    return 0;
}
