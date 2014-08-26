/**********************************************************************

  quiz5_tester.c - 05: inner product / tester

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Mon Aug 25 16:25:58 JST 2014

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
    for (i = 1; i <= 9; i++)
    {
        sprintf(buffer, "quiz5_01_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d\n", i+1);
        for (int k = 0; k < i+1; k++)
        {
            fprintf(fp, "%f ", (double)rand()/(RAND_MAX));        
        }
        fprintf(fp, "\n");
        for (int k = 0; k < i+1; k++)
        {
            fprintf(fp, "%f ", (double)rand()/(RAND_MAX));
        }
        fprintf(fp, "\n");
    }

    for (i = 1; i <= 20; i++)
    {
        j = rand()%900+100;
        sprintf(buffer, "quiz5_02_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d\n", j);
        for (int k = 0; k < j; k++)
        {
            fprintf(fp, "%f ", (double)rand()/(RAND_MAX));        
        }
        fprintf(fp, "\n");
        for (int k = 0; k < j; k++)
        {
            fprintf(fp, "%f ", (double)rand()/(RAND_MAX));
        }
        fprintf(fp, "\n");
    }
    return 0;
}
