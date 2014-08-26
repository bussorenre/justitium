/**********************************************************************

  quiz6.c - 06: palindrome

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Sun Aug 24 21:42:08 JST 2014

**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char const *argv[])
{
    char input[1024] = {0};
    char nospace[1024] = {0};
    int i=0, j=0;
    fgets(input, 1024, stdin);
    while(input[i] != '\0')
    {
        if(isalpha((int)input[i])){
            nospace[j] = tolower((int)input[i]);
            j++;
        }
        i++;
    }
    printf("%s\n", nospace);
    for (i = 0; i < j/2; i++)
    {
        if (nospace[i] != nospace[j-i-1])
        {
            printf("NO\n");
            return 0;
        }
    }

    printf("YES\n");
    return 0;
}
