%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 6 Question 2
*/

#include<stdio.h>

%}

%start list

%token WHILE BEG END
%token VAR INT
%token COMP_OP ASSIGN_OP OP

%%

list: WHILE '(' condition ')' BEG stmts END	{ printf("Syntax Correct!\n"); exit(1);}

condition: id COMP_OP id

id:	INT
	|
	VAR

stmts:	stmt
	|
	stmts stmt

stmt:	VAR ASSIGN_OP expr';'

expr:	id OP id

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

