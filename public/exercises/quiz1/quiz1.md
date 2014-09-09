Summary
------
This is preliminary problem.
It requires programming skills od input/putput, which are neccesary throufh the experoimental class.

### Required knowledge
* how to provide values as inputs in programs.
* how to print messages as outputs in programs.
* scanf()
* printf()
* basic opperations ( +, -, *, /, %,  and others)


Problem
------
Write a program taking 2 integers, and print the sum of the integers.
Add the new line code at the end of output.
Here, you should take any input value from the standard input, stdin, while put any output value to the standars output, stdout.


Hint
-----------
You can use scanf() function to get a value from the standard input.

    int a;
    scanf("%d", &a);

You can use '\n' to move the cursor on your screen to the next line.

    printf("\n");

Never print any redundant code, your program is judged as a wrong one.
For example, the first line is evaliated true, but the second false.

    /* This code will be Error */
    printf("A + B is %d\n", answer);

    /* This code will pass Judge system */
    printf("%d\n", answer);


Input
-----------
The input consists of two integers, A and B, where 0 <= A <= 10000 and 0 <= B <= 10000.



Output
-----------
the sum of A and B, namely A+B.


sample input 1
-----------
    10 5


sample output 1
-----------
    15


sample input 2
-----------
    -5 3


sample input 2
-----------
    -2

