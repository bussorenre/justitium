/**********************************************************************

  quiz1.c - 01: input and output

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Sun Aug 24 21:42:08 JST 2014

**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(int argc, char const *argv[])
{
    char sentence[1024];
    while( fgets(sentence, 1024, stdin) != NULL)
        printf("%s",sentence);
    return 0;
}
