%{
/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 2: Question 1
*/
%}

tag "<"[A-Za-z0-9]+">"
closeTag "<"\/[A-Za-z0-9]+">"
content [^<>\t\n]+

%%

{tag} { printf("\nOPEN TAG: %s\n", yytext); }
{closeTag} { printf("\nCLOSE TAG: %s\n", yytext); }
{content} { printf("\nCONTENT:\n %s\n", yytext); }

%%

int main()
{
	yylex();
	return 0;
}

