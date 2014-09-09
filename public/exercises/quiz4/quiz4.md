Summary
------
This exercise checks the programing skill to utilize function calls.

### Required knowledge
* function
* basic opperations
* if-else statement


Problem
------
A leap year is a year containing one additional day in order to keep the calendar year synchronized with the astronomical or seasonal year.  
In the Gregorian calendar, the following criteria must be taken into account to identify leap years:

A year is a leap year, if
* it is evenly divisible by 4, 
* it is not evenly divisible by 100, and
* it is evenly divisible by 400.

This means that 2000 and 2400 are leap years, while 1800, 1900, 2100, 2200, 2300 and 2500 are NOT leap years.

Make a program which prints YES, if an integer, N, corresponds to a leap year. Otherwise, it should print NO.

You can get an integer, N, from standard input.  
please use following prototype declaration to find leap years.  

    int leap_year(int year);

Input
-----------
N (1 <= N <= 10000)


Output
-----------
YES or NO  

Please print capital "YES" or "NO".  
If you print "Yes" or "No", they will be judged as "Wrong Answer"  
Do not forget to print a new line code at the end.  


sample input 1
-----------
    2004


sample output 1
-----------
    YES


sample input 2
-----------
    2100


sample output 2
-----------
    NO


sample input 3
-----------
    2000


sample output 3
-----------
    YES
