%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 2: Question 2
*/

int i = 0;
int j = 0;
%}

progComment "//"[^\n]*
progComment2 "/*"([^*]|\*+[^*/])*\*+"/"

%%

{progComment} { for(i = 2; i < yyleng; i++) { printf("%c", yytext[i]); } }
{progComment2} { for(j = 2; j < yyleng-2; j++) { printf("%c", yytext[j]); } }
. ;

%%

int main()
{
	yylex();
	return 0;
}

