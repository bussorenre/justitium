/**********************************************************************

  quiz8.c - 08: Combination nCr

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Sun Aug 24 21:42:08 JST 2014

**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

int combination(int n, int r)
{
    if(n==r)
        return(1);
    else if(r==0)
        return(1);
    else if(r==1)
        return(n);
    else
        return( combination(n-1, r-1) + combination(n-1, r) );
}



int main(int argc, char const *argv[])
{
    int N, R;
    scanf("%d %d", &N, &R);
    printf("%d\n", combination(N,R));
    return 0;
}
