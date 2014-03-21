%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 5 Question 1 & 2
*/

#include<stdio.h>
#include<math.h>

#define YYSTYPE double

int regs[26];
int base;

%}

%start list

%token DIGIT SIN COS TAN EXP LOG

%left '+' '-'
%left '*' '/'
%left COS EXP SIN TAN
%left LOG
%left UMINUS

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

expr:    '(' expr ')'
         {
           $$ = $2;
         }
         |
         expr '*' expr
         {
           $$ = $1 * $3;
         }
         |
         expr '/' expr
         {
           $$ = $1 / $3;
         }
         |
         expr '+' expr
         {
           $$ = $1 + $3;
         }
         |
         expr '-' expr
         {
           $$ = $1 - $3;
         }
         |
	 SIN expr
	 {
	   $$ = sin(M_PI * $2 / 180);
	 }
	 |
	 COS expr
	 {
	   $$ = cos(M_PI * $2 / 180);
	 }
	 |
	 TAN expr
	 {
	   $$ = tan(M_PI * $2 / 180);
	 }
	 |
	 EXP expr
	 {
	   $$ = exp($2);
	 }
	 |
	 LOG expr
	 {
	   $$ = log($2);
	 }
	 |
        '-' expr %prec UMINUS
         {
           $$ = -$2;
         }
	 |
         number
	 |
	 doubleNum
         ;

number:  DIGIT
         {
           $$ = $1;
           base = ($1==0) ? 8 : 10;
         }
	 |
         number DIGIT
         {
           $$ = base * $1 + $2;
         }
         ;

doubleNum: number '.' number
	  {
		$$ = $1 + ( $3 / pow(10, $3>0?(int)log10((double)$3)+1:1) );
	  }
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

