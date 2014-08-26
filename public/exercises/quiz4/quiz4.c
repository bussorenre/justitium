/**********************************************************************

  quiz4.c - 04: leap year

  Ryo Matsumoto
    - Data Engineering Lab
    - Ritsumeikan University

  created at: Sun Aug 24 21:42:08 JST 2014

**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int leap_year(int year);

int main(int argc, char const *argv[])
{
    int year;
    scanf("%d", &year);
    if(leap_year(year))
    {
        printf("YES\n");
    }
    else {
        printf("NO\n");
    }
    return 0;
}


int leap_year(int year)
{
    if (year%4==0)
    {
        if (year%100==0)
        {
            if (year%400==0)
            {
                return 1;
            }
            return 0;
        }
        return 1;
    }
    return 0;
}
