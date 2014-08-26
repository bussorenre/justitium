/**********************************************************************

  quiz5.c - 05: inner product

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Mon Aug 25 16:13:25 JST 2014

**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ELEMENTS 1000

int main(int argc, char const *argv[])
{
    int N,i;
    double x[MAX_ELEMENTS];
    double y[MAX_ELEMENTS];
    double product=0;

    scanf("%d", &N);
    for (i = 0; i < N; i++)
    {
        scanf("%lf", &x[i]);
    }

    for (i = 0; i < N; i++)
    {
        scanf("%lf", &y[i]);
    }

    for (i = 0; i < N; i++)
    {
        product += x[i]*y[i];
    }

    printf("%0.6lf", product);

    return 0;
}
