%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 5 Question 1 & 2
*/

#include<stdio.h>
#include "y.tab.h"

#define YYSTYPE double

int c;
extern YYSTYPE yylval;

%}

%%
" "       ;

[0-9]     	{
            		c = yytext[0];
            		yylval = c - '0';
            		return(DIGIT);
          	}

"sin"		{
			return(SIN);
		}

"cos"		{
			return(COS);
		}

"tan"		{
			return(TAN);
		}

"exp"		{
			return(EXP);
		}

"log"		{
			return(LOG);
		}

[^a-z0-9\b]    	{
               		c = yytext[0];
               		return(c);
               	}




