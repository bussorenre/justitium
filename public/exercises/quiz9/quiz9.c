/**********************************************************************

  quiz9.c - 09: find a phrase "the"

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
    char *the = "the";
    char sentence[1024];
    char *seek;
    int count = 0;
    while( fscanf(stdin, "%s", sentence) != EOF)
    {
        seek = sentence;
        while((seek = strstr(seek, the)) != NULL){
            seek+=3;
            count++;
        }
    }
    printf("%d\n", count);

    return 0;
}
