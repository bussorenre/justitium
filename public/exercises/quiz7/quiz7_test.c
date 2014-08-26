/**********************************************************************

  quiz7.c - 07: sorting / tester

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Mon Aug 25 17:46:11 JST 2014

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
    for (i = 1; i <= 5; i++)
    {
        sprintf(buffer, "quiz7_01_%02d", i);
        openfile(buffer);
        fprintf(fp, "10\n");
        for (k = 0; k < 10; k++)
        {
            fprintf(fp, "%d\n", rand()%10+1);
        }
    }

    for (i = 1; i <= 10; i++)
    {
        sprintf(buffer, "quiz7_02_%02d", i);
        openfile(buffer);
        fprintf(fp, "100\n");
        for (k = 0; k < 100; k++)
        {
            fprintf(fp, "%d\n", rand()%100+1);
        }
    }

    for (i = 1; i <= 10; i++)
    {
        j = rand()%900+101;
        sprintf(buffer, "quiz7_03_%02d", i);
        openfile(buffer);
        fprintf(fp, "%d\n", j);
        for (k = 0; k < j; k++)
        {
            fprintf(fp, "%d\n", rand());
        }
    }


    return 0;
}
