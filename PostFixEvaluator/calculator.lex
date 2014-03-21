%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 6 Question 1(a)
*/

#include<stdio.h>
#include "y.tab.h"

#define YYSTYPE double

int c;
float p;
extern YYSTYPE yylval;

%}

%%
" "       ;

[0-9]+     	{
            		c = atoi(yytext);
            		yylval = c;
            		return(NUMBER);
          	}

[0-9]*"."[0-9]+ {
			p = atof(yytext);
			yylval = (double)p;
			return(DOUBLE);
		}

[^a-z0-9\b]    	{
               		c = yytext[0];
               		return(c);
               	}


