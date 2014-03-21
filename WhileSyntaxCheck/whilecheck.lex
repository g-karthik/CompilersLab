%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 6 Question 2
*/

#include<stdio.h>
#include "y.tab.h"

%}

letter [A-Za-z]
digit [0-9]

%%

[ \n\t]	{ }

"while"	{
		return(WHILE);
	}

"begin"	{
		return(BEG);
	}

"end"	{
		return(END);
	}

({letter})({letter}|{digit})*	{
					return(VAR);
				}

"=="|"<="|"<"|">="|">"|"!="	{
					return(COMP_OP);
				}

({digit})+	{
			return(INT);
		}

"="	{
		return(ASSIGN_OP);
	}

"+"|"-"|"*"|"/"|"%"	{
				return(OP);
			}

[^a-zA-Z0-9\b]		{
				return(yytext[0]);
			}


