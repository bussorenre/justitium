/**********************************************************************

  quiz1_tester.c - 01: input and output / tester

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Sun Aug 24 22:34:06 JST 2014

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
    openfile("quiz6_01_01.txt");
    fprintf(fp,
        "This is the first test\n"
    );

    openfile("quiz6_01_02.txt");
    fprintf(fp,
        "Hello world!\n"
    );

    openfile("quiz6_01_03.txt");
    fprintf(fp,
        "Damn! I, Agassi, miss again! Mad!\n"
    );

    openfile("quiz6_01_04.txt");
    fprintf(fp,
        "Borrow or rob?\n"
    );

    openfile("quiz6_01_05.txt");
    fprintf(fp,
        "My girlfriend is haruna\n"
    );

    openfile("quiz6_01_06.txt");
    fprintf(fp,
        "Was it a bar or a bat I saw?\n"
    );

    openfile("quiz6_01_07.txt");
    fprintf(fp,
        "Now I see, referees, I won.\n"
    );

    openfile("quiz6_01_08.txt");
    fprintf(fp,
        "I love my computer\n"
    );

    openfile("quiz6_01_09.txt");
    fprintf(fp,
        "Madam, I'm Adam.\n"
    );


    openfile("quiz6_01_10.txt");
    fprintf(fp,
        "Kodak ad? OK!\n"
    );

    fclose(fp);
    return 0;
}
