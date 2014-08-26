/**********************************************************************

  quiz7.c - 07: sorting

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
    int i,j,k, N;
    int nums[1000];
    scanf("%d", &N);
    for (i = 0; i < N; i++)
    {
        scanf("%d", &nums[i]);        
    }

    for (i = 0; i < N; i++)
    {
        for (j = i; j < N; j++)
        {
            if (nums[i] > nums[j])
            {
                k = nums[i];
                nums[i] = nums[j];
                nums[j] = k;
            }
        }
    }
    for (i = 0; i < N; i++)
    {
        printf("%d\n", nums[i]);        
    }

    return 0;
}
