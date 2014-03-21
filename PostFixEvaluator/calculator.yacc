%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 6 Question 1(a)
*/

#include<stdio.h>
#include<math.h>

#define YYSTYPE double

%}

%start list

%token NUMBER
%token DOUBLE

%%

list:
	|
        list stat '\n'
        |
        list error '\n'
        {
           yyerrok;
        }
        ;

stat:
	expr
	{
	   printf("%f\n", $1);
	}
	;

expr:
         expr expr '*'
         {
           $$ = $1 * $2;
         }
         |
         expr expr '/'
         {
           $$ = $1 / $2;
         }
         |
         expr expr '+'
         {
           $$ = $1 + $2;
         }
         |
         expr expr '-'
         {
           $$ = $1 - $2;
         }
         |
	 expr expr '^'
	 {
	   $$ = pow($1, $2);
	 }
	 |
         NUMBER
	 |
	 DOUBLE
         ;

%%
main()
{
	return(yyparse());
}

yyerror(s)
char *s;
{
	fprintf(stderr, "%s\n",s);
}

yywrap()
{
	return(1);
}

