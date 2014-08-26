/**********************************************************************

  quiz0.c - test code

  $Author$
  created at: Fri Aug  1 08:43:36 JST 2014

  Copyright (C) 2014-2015 Ryo Matsumoto

**********************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    int N = 0, i = 1;
    scanf("%d", &N);
    for (int i = 1; i <= N; i++)
    {
        if (i%15 == 0)
        {
            printf("FizzBuzz\n");
        }
        else if (i%3 == 0)
        {
            printf("Fizz\n");
        }
        else if (i%5 == 0)
        {
            printf("Buzz\n");
        }
        else
        {
            printf("%d\n", i);
        }
    }

    return 0;
}

